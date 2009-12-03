class UsersController < ApplicationController

  before_filter :find_user, :only => [:show, :destroy, :edit, :update]
  before_filter :find_users, :only => :index
  before_filter :new_user, :only => [:new, :create]

  def setup_enclosing_resources

  end
  def find_user
    setup_enclosing_resources
    @user = User.find(params[:id])
    @post = @user.posts.new(params[:post])
  end
  def find_users
    setup_enclosing_resources
    @users = User.find(:all)
  end
  def new_user
    setup_enclosing_resources
    @user = User.new(params[:user])
  end

  # GET /users
  # GET /users.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.xml
  def create
    respond_to do |format|
      if @user.save
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(users_path()) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(user_path(@user)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user.destroy

    flash[:notice] = 'User was successfully removed.'
    respond_to do |format|
      format.html { redirect_to(users_path()) }
      format.xml  { head :ok }
    end
  end
end
