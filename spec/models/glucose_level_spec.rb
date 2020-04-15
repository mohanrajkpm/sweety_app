require 'rails_helper'

RSpec.describe GlucoseLevel, type: :model do
	before(:each) do
		user = FactoryBot.create(:user)
  	@glucose_level = FactoryBot.create(:glucose_level, user_id: user.id)
  end

  context "Access the books validations" do
 
	  it "is valid glucose level attributes " do
	    expect(@glucose_level).to be_valid
	  end

	  it "is check glucose not be string" do
	  	@glucose_level.glucose = "str"
      expect(@glucose_level).to be_invalid
    end

    it "is check wtihout user" do
   		@glucose_level.user = nil
   		expect(@glucose_level).to be_invalid
 		end
  end

end
