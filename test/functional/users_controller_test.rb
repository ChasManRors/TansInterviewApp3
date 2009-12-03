require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = User.find(:first)
  end

  context "on GET to UsersController#index" do
    setup do
      get :index
    end

    should_respond_with :success
    should_assign_to :users
    should_render_template :index
    should_not_set_the_flash
    should_not_change "User.count"
  end

  context "on GET to UsersController#show" do
    setup do
      get :show, :id => @user.to_param
    end

    should_assign_to :user
    should_respond_with :success
    should_render_template :show
    should_not_set_the_flash
    should_not_change "User.count"
    should "set @user to requested instance" do
      assert_equal @user, assigns(:user)
    end
  end

  context "on GET to UsersController#new" do
    setup do
      get :new
    end

    should_respond_with :success
    should_assign_to :user
    should_not_set_the_flash
    should_render_template :new
    should_render_a_form
    should_not_change "User.count"
  end

  context "on GET to UsersController#edit" do
    setup do
      get :edit, :id => @user.to_param
    end

    should_assign_to :user
    should_respond_with :success

    should_render_template :edit
    should_not_set_the_flash
    should_render_a_form
    should_not_change "User.count"
    should "set @user to requested instance" do
      assert_equal @user, assigns(:user)
    end
  end

  context "on POST to UsersController#create with " do
    setup do
      post :create, :user => {  }
    end

    should_assign_to :user
    should_set_the_flash_to(/created/i)
    should_redirect_to "users_path()"
    should "not have errors on @user" do 
      assert assigns(:user).errors.blank?
    end
    should_change "User.count", :by => 1
  end

  context "on PUT to UsersController#update with" do
    setup do
      put :update, :id => @user.to_param
    end

    should_assign_to :user
    should_set_the_flash_to(/updated/i)
    should_redirect_to "user_path(@user)"
    should_not_change "User.count"
    should "not have errors on @user" do
      assert assigns(:user).errors.empty?
    end
  end

  context "on DELETE to UsersController#destroy" do
    setup do
      delete :destroy, :id => @user.to_param
    end

    should_set_the_flash_to(/removed/i)
    should_redirect_to "users_path()"
    should_change "User.count", :by => -1
  end

  context "on GET to UsersController#index as xml" do
    setup do
      get :index, :format => "xml"
    end

    should_respond_with :success
    should_respond_with_content_type :xml #('users') # TODO: fix this

    should_assign_to :users
  end

  context "on GET to UsersController#show as xml" do
    setup do
      get :show, :id => @user.to_param, :format => "xml"
    end

    should_assign_to :user
    should_respond_with :success

#    should_respond_with_xml_for('user') # TODO: fix this
  end

  context "on POST to UsersController#create as xml" do
    setup do
      post :create, :user => {  }
    end

    should_assign_to :user
    should "not have errors on @user" do 
      assert assigns(:user).errors.blank?
    end
  end

  context "on PUT to UsersController#update as xml" do
    setup do
      put :update, :id => @user.to_param
    end

    should_assign_to :user
    should "not have errors on @user" do
      assert assigns(:user).errors.blank?
    end
  end

  context "on DELETE to UsersController#destroy as xml" do
    setup do
      delete :destroy, :id => @user.to_param
    end

    should_change "User.count", :by => -1
  end
end
