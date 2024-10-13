class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]

  def index
    @posts = Post.all
    logger.debug "Posts: #{@posts.inspect}" 
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.author = current_user.email  # Automatically set the author's email
    
    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :published).tap do |post_params|
      post_params[:published] = post_params[:published].to_i if post_params[:published]
    end
  end
end
