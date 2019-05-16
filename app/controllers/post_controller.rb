class PostController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to employee_post_index_path(@post)
    else
      render :edit
    end
  end

  def edit
    
  end

  def update
     if @post.update_attributes(post_params)
      redirect_to employee_post_index_path(@post)
    else
      render :edit
    end
  end

  private 

  def post_params
    params.require(:post).permit(:upload, :description, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
