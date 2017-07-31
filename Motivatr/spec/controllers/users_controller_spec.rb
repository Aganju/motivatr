require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do

    before(:each) do
      get :new
    end

    it { should render_template("new") }
    it {should respond_with(200) }
  end

  describe "POST #create" do

    context "Valid parameters" do
      before(:each) do
        post :create, params: {
          user:
          { username: 'bob',
          password: 'bobspass'}
        }
      end

      it { should respond_with(302) }
      it { should redirect_to(user_url(User.last.id)) }
    end

    context "Invalid parameters" do
      before(:each) do
        post :create, params: {
          user:
          { username: 'bob',
          password: '123'}
        }
      end

      it { should respond_with(200) }
      it { should render_template ("new") }
    end

  end

end
