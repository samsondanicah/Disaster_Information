10.times do
  user = User.create!(email: Faker::Internet.email, password: 'qwer4321', password_confirmation: "qwer4321")
  puts "create user id: #{user.id}, email: #{user.email}"
end
#
# 30.times do |i|
#   puts "start create #{i} post"
#   post = Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, address: Faker::Lorem.sentence, user: User.all.sample)
#   (1..20).to_a.sample.times do
#     Comment.create(content: Faker::Lorem.sentence, user: User.all.sample, post: post)
#   end
#   puts "finish #{i} post"
# end

categories = ['COVID', 'Earthquake', 'Requirements']

categories.each do |category|
  category = Category.find_or_create_by(name: category)
end

30.times do |i|
  puts "start create #{i} post"
  post = Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user: User.all.sample, categories: Category.all.sample(1), address: Faker::Address.full_address)
  (1..100).to_a.sample.times do
    Comment.create(content: Faker::Lorem.sentence, user: User.all.sample, post: post)
  end
  puts "finish #{i} post"
end