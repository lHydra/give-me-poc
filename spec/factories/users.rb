FactoryBot.define do
  factory :user, aliases: [:author] do
    email { Faker::Internet.email }
    role { User::ROLES.sample }

    trait :with_name do
      name { Faker::Name.name }
    end
  end
end
