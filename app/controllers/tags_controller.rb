class TagsController < ApplicationController
before_action :authenticate_user!, except: [:index]

  def new
    @tag = Tag.new
  end

  def create
    tag = Tag.new(tag_params)
    tag.save!
    redirect_to tags_url
  end

  def index
    @tags = Tag.all    
  end

  def destroy
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
