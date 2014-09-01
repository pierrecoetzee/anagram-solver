require 'spec_helper'

describe LoginController do

  describe 'login with a valid user name and password'  do

    fixtures :all

    before(:each){
      @user = users(:ministry_of_justice)
      session[:user_id] = @user.id
    }

    describe "GET 'index'" do
      it "returns http success" do
        get 'index'
        response.should be_success
      end
    end

    describe "GET 'authenticate'" do
      it "redirects a logged in user to the management page" do
        get :authenticate, "user"=>{"user_name"=>@user.user_name, "password"=> @user.password}
        response.should redirect_to(:home)
      end
    end

  end

end
