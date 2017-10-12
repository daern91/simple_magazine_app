# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: 'Admin Webmastersson',
  email: 'admin@example.com',
  password: "abc123"
)

5.times do
  u = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "abc123"
  )
  5.times do
    a = Article.create(
      title: Faker::HitchhikersGuideToTheGalaxy.character,
      content: Faker::HitchhikersGuideToTheGalaxy.quote,
      user_id: u.id,
      created_at: Faker::Date.backward(400)
    )
    2.times do
      t = Tag.create(
        title: Faker::HitchhikersGuideToTheGalaxy.planet,
      )
      3.times do
        s = Subtag.create(
          title: Faker::HitchhikersGuideToTheGalaxy.starship,
        )
        table = Ast.create(
          article_id: a.id,
          tag_id: t.id,
          subtag_id: s.id
        )
      end
    end
  end
end
