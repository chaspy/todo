class TagsController < ApplicationController
before_action :authenticate_user!, except: [:index]

  def new
  end

  def create
  end

  def index
    @tags = Tag.all    
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :tag_id, :expire_date)
  end
end
