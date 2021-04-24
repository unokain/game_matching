require 'faker'

2.times do |n|
    User.create(
        name: Faker::Games::Pokemon.name,
        email: Faker::Internet.email,
        password: "password",
        game_skill: Faker::Lorem.paragraphs,
        self_profile: Faker::Lorem.paragraphs,
        image:File.open("./public/icon/test.jpg"),
    )
    User.all.each do |user|
        user.plans.create!(
            title: Faker::Games::Pokemon.name,
            content: Faker::Lorem.paragraphs,
            start_time: Time.now + ((3600*12)*(n+1)),
            limit_time: Time.now + ((3600*12)*(n)),
            )
    end
end

# Plan.all.each do |plan|
#     plan.tag_list(Faker::Color.color_name)    
# end