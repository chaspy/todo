class TagsController < ApplicationController
before_action :authenticate_user!, except: [:index]

  def new
    @tag = Tag.new
  end

  def create
    tag = Tag.new(tag_params)
    tag.user_id = current_user[:id]
    tag.save!
    redirect_to tags_url
  end

  def index
    @tags = current_user.tags
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_to tags_url
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
