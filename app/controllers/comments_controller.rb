class CommentsController < ApplicationController

  before_filter :find_comment, :only => [:show, :destroy, :edit, :update]
  before_filter :find_comments, :only => :index
  before_filter :new_comment, :only => [:new, :create]

  def setup_enclosing_resources
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end
  def find_comment
    setup_enclosing_resources
    @comment = @post.comments.find(params[:id])
  end
  def find_comments
    setup_enclosing_resources
    @comments = @post.comments
  end
  def new_comment
    setup_enclosing_resources
    @comment = @post.comments.new(params[:comment])
  end

  # GET /comments
  # GET /comments.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.xml
  def create
    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(user_post_comments_path(@user, @post)) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(user_post_comment_path(@user, @post, @comment)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment.destroy

    flash[:notice] = 'Comment was successfully removed.'
    respond_to do |format|
      format.html { redirect_to(user_post_comments_path(@user, @post)) }
      format.xml  { head :ok }
    end
  end
end
