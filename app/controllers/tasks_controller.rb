class TasksController < ApplicationController
before_action :authenticate_user!, except: [:index]

  def new
    @task = Task.new
    @tags = current_user.tags
    @today = Date.today
  end

  def create
    task = Task.new(task_params)
    task.user_id = current_user[:id]
    task.save!
    redirect_to tasks_url
  end

  def index
    if params[:tag_id] then
      @tasks = current_user.tasks.where(tag_id: params[:tag_id])
    elsif params[:expire_date] then
      @tasks = current_user.tasks.where(expire_date: params[:expire_date])
    else
      @tasks = current_user.tasks.order(:expire_date)
    end
    @tags = current_user.tags
    render :json => @tasks
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :tag_id, :expire_date)
  end
end
