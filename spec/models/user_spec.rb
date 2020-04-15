require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
		@user = FactoryBot.create(:user)
  end

  it "is valid glucose level attributes " do
		expect(@user).to be_valid
	end

	it "is invalid email of user" do
	  @user.email = "myemail"
    expect(@user).to be_invalid
  end
end
