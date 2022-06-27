User.create!(
    email: "test@test.com",
    password: "test@test",
    password_confirmation: "test@test",
    name: 'Admin User',
    roles: 'site_admin'
)

puts "1 Admin user created"


User.create!(
    email: "test2@test.com",
    password: "test@test",
    password_confirmation: "test@test",
    name: 'Regular User',
    )

puts "1 regular user created"

3.times do |topic|
  Topic.create!(
      title: "Topic #{topic}"
  )
end

puts '3 Topics created'

10.times do |blog|
  Blog.create!(
      title: "UX Design News #{blog}",
      body: "The field of UX design is one of the hottest areas in the tech industry today. A UX designer is responsible for creating user-friendly, intuitive designs for software and websites. The demand for UX designers is growing rapidly, and many companies are willing to pay top dollar for talented designers.",
      topic_id: Topic.last.id
  )
end

puts '10 blog posts created'

5.times do |skill|
  Skill.create!(
      title: "UX Design #{skill}",
      percent_utilized: 15
  )
end

puts '5 skills created'

8.times do |portfolio_item|
  Portfolio.create!(
      title: "Portfolio title #{portfolio_item}",
      subtitle: 'UX Design News',
      body: 'So if you’re interested in pursuing a career in UX design, getting a degree could be beneficial. But ultimately, it’s up to you whether or not to pursue formal education in this field; there are many talented designers who have self-taught themselves and been successful without any formal training.',
      main_image: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngaaa.com%2Fdetail%2F997979&psig=AOvVaw2oo72vheL1YiGRZnZB7qq7&ust=1654258645041000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLjf2-vfjvgCFQAAAAAdAAAAABAD',
      thumb_image: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngaaa.com%2Fdetail%2F997979&psig=AOvVaw2oo72vheL1YiGRZnZB7qq7&ust=1654258645041000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLjf2-vfjvgCFQAAAAAdAAAAABAD'
  )
end


puts '8 portfolio items created'

3.times do |technology|
  Portfolio.last.technologies.create!(
      name: "Technology #{technology}"
  )
end

puts '3 technologies created'
