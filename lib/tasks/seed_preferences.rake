namespace :seed do
  desc "Seed the database with preference categories and questions"
  task preferences: :environment do
    puts "Loading preference seeds..."
    load Rails.root.join('db/seeds/preferences.rb')
    puts "Preferences seeded successfully!"
  end
end