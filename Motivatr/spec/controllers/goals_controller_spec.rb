require 'rails_helper'

RSpec.describe GoalsController, type: :controller do

  describe "GET #index" do

    before(:each) do
      bob = User.create(username:  'bob', password: 'bobspass')
      get :index, params: { user_id: bob.id }
    end

    it { should render_template("index") }
    it {should respond_with(200) }

  end

  describe "GET :new" do
    before(:each) do
      get :new
    end
    it {should render_template("new")}
    it {should respond_with(200)}
  end


  describe "POST #create" do

    context "Valid parameters" do
      before(:each) do
        bob = User.create(username:  'bob', password: 'bobspass')
        post :create, params: {
          goal:
          { body: 'to jump to the moon',
            user_id: bob.id,
            private: 'vary vary preevate'}
        }
      end

      it { should respond_with(302) }
      it { should redirect_to(goal_url(Goal.last.id)) }
    end

    context "Invalid parameters" do
      before(:each) do
        post :create, params: {
          goal: {body: nil}
        }
      end

      it { should respond_with(200) }
      it { should render_template ("new") }
    end

  end

end

# bob = User.create(username:  'bob', password: 'bobspass')
# bob.goals.create(body: 'get more bobby' privacy: 'public')
# bob.goals.create(body: 'get a bobbete' privacy: 'private')
# context 'bob is logged in' do
#   it {should have_content('get more bobby')}
#   it {should have_content('get a bobbete')}
# end
#
# context 'bobette is logged in' do
#   it {should have_content('get more bobby')}
#   it {should_not have_content('get a bobbete')}
# end
