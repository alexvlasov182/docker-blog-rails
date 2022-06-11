3.times do |topic|
  Topic.create!(
     title: "Topic #{topic}"
  )
end

10.times do |blog|
  Blog.create!(
    title: "My Blog Post About Ruby on Rails #{blog}",
    body: "RubyGems.org is the Ruby community’s gem hosting service. Instantly publish your gems and then install them. Use the API to find out more about available gems. Become a contributor and improve the site yourself.
RubyGems.org is made possible through a partnership with the greater Ruby community. Fastly provides bandwidth and CDN support, Ruby Central covers infrastructure costs, and Ruby Together funds ongoing development and ops work. Learn more about our sponsors and how they work together.
We need your help to fund the developer time that keeps RubyGems.org running smoothly for everyone. Join Ruby Together today.
",
    topic_id: Topic.last.id
    )
end

puts '10 blog posts created'

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
  )
end

puts '5 skills created'

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio title #{portfolio_item}",
    subtitle: 'Ruby on Rails',
    body: 'RubyGems.org is made possible through a partnership with the greater Ruby community. Fastly provides bandwidth and CDN support, Ruby Central covers infrastructure costs, and Ruby Together funds ongoing development and ops work. Learn more about our sponsors and how they work together.',
    main_image: 'https://place-hold.it/600x400.jpg/888/fff/',
    thumb_image: 'https://place-hold.it/300x200.jpg/888/fff/'
  )
end

1.times do |portfolio_item|
  Portfolio.create!(
      title: "Portfolio title #{portfolio_item}",
      subtitle: 'Angular',
      body: 'Build features quickly with simple, declarative templates. Extend the template language with your own components and use a wide array of existing components. Get immediate Angular-specific help and feedback with nearly every IDE and editor. All this comes together so you can focus on building amazing apps rather than trying to make the code work.',
      main_image: 'https://place-hold.it/600x400.jpg/888/fff/',
      thumb_image: 'https://place-hold.it/300x200.jpg/888/fff/'
  )
end

puts '8 portfolio items created'

