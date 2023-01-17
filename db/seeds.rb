15.times do
  Article.create!(
    [{
      name: Faker::Movie.title
    }])
end