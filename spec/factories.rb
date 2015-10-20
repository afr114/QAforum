FactoryGirl.define do
  factory(:user) do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end
  end

  # Must create a user first
  factory(:question) do
    title { Faker::Name.name }
    text  { Faker::Lorem.setences(10) }
    user  User.last
  end

end
