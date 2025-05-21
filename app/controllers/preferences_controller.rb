class PreferencesController < ApplicationController
  before_action :load_category, only: [:show, :edit, :update]
  
  def index
    @categories = PreferenceCategory.active.ordered
  end

  def new
    @category = PreferenceCategory.new
  end

  def create
    @category = PreferenceCategory.new(category_params)
    if @category.save
      redirect_to preferences_path, notice: "Category '<strong>#{@category.name}</strong>' was created successfully"
    else
      @categories = PreferenceCategory.active.ordered
      flash.now[:alert] = "Failed to create category: #{@category.errors.full_messages.to_sentence}"
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @preferences = UserPreference.by_name(@category.name).pluck(:key, :value).to_h
  end

  def edit
    @preferences = UserPreference.by_name(@category.name).pluck(:key, :value).to_h
  end

  def update
    updated_count = 0
    
    params[:preferences]&.each do |key, value|
      question = @category.preference_questions.find_by(key: key)
      next unless question

      # Convert values based on question type
      processed_value = case question.question_type
                        when 'boolean'
                          value == '1'
                        when 'checkbox'
                          value.is_a?(Array) ? value : []
                        else
                          value
                        end
      
      # Store in database
      if UserPreference.set(@category.name, key, processed_value)
        updated_count += 1
      end
    end

    if updated_count > 0
      redirect_to preference_path(@category.name), notice: "#{updated_count} #{'preference'.pluralize(updated_count)} updated successfully"
    else
      redirect_to preference_path(@category.name), notice: "No changes were made to preferences"
    end
  end

  def add_question
    @category = PreferenceCategory.find_by!(name: params[:id])
    question_params = params.permit(:label, :key, :question_type, :description, :default_value, :required, :options)
    
    # Convert options from comma-separated string to JSON array if present
    if question_params[:options].present?
      question_params[:options] = question_params[:options].split(',').map(&:strip).to_json
    end
    
    # Set position to end
    max_position = @category.preference_questions.maximum(:position) || 0
    question = @category.preference_questions.new(question_params.merge(position: max_position + 1))
    
    if question.save
      redirect_to edit_preference_path(@category.name), notice: "Question '<strong>#{question.label}</strong>' was added successfully"
    else
      flash[:alert] = "Failed to add question: #{question.errors.full_messages.to_sentence}"
      redirect_to edit_preference_path(@category.name)
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to preferences_path, alert: "Category not found"
  end
  
  def edit_question
    @category = PreferenceCategory.find_by!(name: params[:id])
    @question = @category.preference_questions.find(params[:question_id])
    
    render :edit_question
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Question or category not found"
    redirect_to preferences_path
  end
  
  def update_question
    @category = PreferenceCategory.find_by!(name: params[:id])
    @question = @category.preference_questions.find(params[:question_id])
    
    question_params = params.require(:preference_question).permit(:label, :key, :question_type, :description, :default_value, :required, :options)
    
    # Convert options from comma-separated string to JSON array if present
    if question_params[:options].present? && !question_params[:options].start_with?('[')
      question_params[:options] = question_params[:options].split(',').map(&:strip).to_json
    end
    
    if @question.update(question_params)
      redirect_to edit_preference_path(@category.name), notice: "Question '<strong>#{@question.label}</strong>' was updated successfully"
    else
      flash[:alert] = "Failed to update question: #{@question.errors.full_messages.to_sentence}"
      render :edit_question
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Question or category not found"
    redirect_to preferences_path
  end
  
  def delete_question
    @category = PreferenceCategory.find_by!(name: params[:id])
    question = @category.preference_questions.find(params[:question_id])
    question_label = question.label
    
    if question.destroy
      # Also delete any preferences associated with this question
      UserPreference.where(name: @category.name, key: question.key).delete_all
      flash[:notice] = "Question '<strong>#{question_label}</strong>' was deleted successfully"
    else
      flash[:alert] = "Failed to delete question"
    end
    
    redirect_to edit_preference_path(@category.name)
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Question or category not found"
    redirect_to preferences_path
  end

  private

  def category_params
    params.require(:preference_category).permit(:name, :description, :active)
  end
  
  def question_params
    params.require(:preference_question).permit(:label, :key, :question_type, :description, :default_value, :required, :options)
  end

  def load_category
    @category = PreferenceCategory.find_by!(name: params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to preferences_path, alert: "Category not found"
  end
end
