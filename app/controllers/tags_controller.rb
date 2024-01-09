class TagsController < ApplicationController
  def index
    @tags = Tag.all 
    render :index
  end

  def show
    @tag = Tag.find_by(id: params[:id])
    render :show
  end

  def create
    @tag = Tag.new(
      hashtag: params[:hashtag]
    )
    if @tag.save
      render :show
    else
      render json: {errors: @tag.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @tag = Tag.find_by(id: params[:id])
    @tag.hashtag = params[:hashtag] || @tag.hashtag
    if @tag.save
      render :show
    else
      render json: {errors: @tag.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @tag = Tag.find_by(id: params[:id])
    @tag.destroy
    render json: {message: "Tag successfully deleted"}
  end
end
