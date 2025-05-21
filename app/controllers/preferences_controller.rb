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
      redirect_to preferences_path, notice: "Category created successfully"
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
      UserPreference.set(@category.name, key, processed_value)
    end

    redirect_to preference_path(@category.name), notice: "Preferences updated successfully"
  end

  def add_question
    @category = PreferenceCategory.find_by!(name: params[:id])
    question_params = params.require(:preference_question).permit(:label, :key, :question_type, :description, :default_value, :required, :options)
    # Convert options from comma-separated string to JSON array if present
    if question_params[:options].present?
      question_params[:options] = question_params[:options].split(',').map(&:strip).to_json
    end
    # Set position to end
    max_position = @category.preference_questions.maximum(:position) || 0
    question = @category.preference_questions.new(question_params.merge(position: max_position + 1))
    if question.save
      redirect_to edit_preference_path(@category.name), notice: "Question added successfully"
    else
      flash[:alert] = "Failed to add question: #{question.errors.full_messages.to_sentence}"
      redirect_to edit_preference_path(@category.name)
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to preferences_path, alert: "Category not found"
  end

  private

  def category_params
    params.require(:preference_category).permit(:name, :description, :active)
  end

  def load_category
    @category = PreferenceCategory.find_by!(name: params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to preferences_path, alert: "Category not found"
  end
end
