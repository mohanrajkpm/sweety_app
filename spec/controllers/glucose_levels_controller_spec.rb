require 'rails_helper'

RSpec.describe GlucoseLevelsController, type: :controller do

	before(:each) do
		@user = FactoryBot.create(:user)
  	@glucose_level = FactoryBot.create(:glucose_level, user_id: @user.id)
  end

  describe 'GET #new' do
	  it 'assigns a new glucose_level to @glucose_level' do
	  	glucose_level = GlucoseLevel.new
	    get :new
	    expect(assigns(:glucose_level)).to be_a_new(GlucoseLevel)
	  end
	end

	describe 'GET #index and Post #create' do
		before do
			user = create(:user)
			allow_any_instance_of(GlucoseLevelsController).to receive(:current_user) { user }
		end

		it "should index" do
			get :index
			expect(response.status).to eq(200)
		end

	  it "should create" do
	    expect {
	      post :create, params: { glucose_level: { glucose: 45 } }
	    }.to change(GlucoseLevel, :count).by(1)
	  end
	end
 
end
