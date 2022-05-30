class Gen
  def bulk
    1000.times do
      first_name = Faker::Name.first_name

      User.create!(
        first_name: first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email(name: first_name),
        dob: Faker::Date.between(from: 45.years.ago, to: 15.years.ago),
        gender: Faker::Gender.short_binary_type,
        title: Faker::Name.prefix
      )
    end
  end
end
