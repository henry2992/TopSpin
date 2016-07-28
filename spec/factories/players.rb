FactoryGirl.define do
  
  factory :player do
    email "example@example.com"
    password "password"
    password_confirmation "password"
    first_name "Joe"
    last_name "Doe"
    birthday Date.today
  end


end