FactoryGirl.define do
  
    factory :level do
  	    name "Pro"

	    after(:create) do |level|
	      level.challenges << FactoryGirl.create(:challenge)
	    end
    end



    



 
end

  



