FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "email#{n}@domain.com"
    end
    password { '123456' }
  end
end
