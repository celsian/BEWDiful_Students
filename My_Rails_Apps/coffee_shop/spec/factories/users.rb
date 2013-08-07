# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Joe Bob"
    balance "100.00"
  end

  # factory :admin_user, class: "User"
end
