FactoryGirl.define do
  
  factory :challenge do
    name "challenge 1"
    description "this is the description for challenge 1"
    points 20
    level Level.create(name:  "pro")
  end


end
