require 'faker'

puts "🌱 Seeding spices..."

# Seed your database here
10.times do 
    user = User.create(
        username: Faker::Name.first_name,
    )
    
    rand(1..3).times do
        Message.create(
            title: Faker::Book.title,
            comment: Faker::Lorem.sentence,
            user_id: user.id
        )

    end
 
end

puts "✅ Done seeding!"
