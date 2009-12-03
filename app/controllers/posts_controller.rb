class PostsController < ApplicationController

  before_filter :find_post, :only => [:show, :destroy, :edit, :update]
  before_filter :find_posts, :only => :index
  before_filter :new_post, :only => [:new, :create]

  def setup_enclosing_resources
    @user = User.find(params[:user_id])
  end
  def find_post
    setup_enclosing_resources
    @post = @user.posts.find(params[:id])
    @comment = @post.comments.new(params[:comment])
  end
  def find_posts
    setup_enclosing_resources
    @posts = @user.posts
  end
  def new_post
    setup_enclosing_resources
    @post = @user.posts.new(params[:post])
  end

  # GET /posts
  # GET /posts.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.xml
  def create
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
        format.html { redirect_to(user_posts_path(@user)) }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        flash[:notice] = 'Post was successfully updated.'
        format.html { redirect_to(user_post_path(@user, @post)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post.destroy

    flash[:notice] = 'Post was successfully removed.'
    respond_to do |format|
      format.html { redirect_to(user_posts_path(@user)) }
      format.xml  { head :ok }
    end
  end
end
