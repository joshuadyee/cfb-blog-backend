class PostsController < ApplicationController
  def index
    @posts = Post.all 
    render :index
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def create
    @post = Post.new(
      title: params[:title],
      body: params[:body]
    )
    if @post.save
      render :show
    else
      render json: {errors: @post.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title] || @post.title
    @post.body = params[:body] || @post.body
    if @post.save
      render :show
    else
      render json: {errors: @post.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    render json: {message: "Post successfully deleted"}
  end
end
