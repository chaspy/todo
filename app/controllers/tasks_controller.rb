class TasksController < ApplicationController
before_action :authenticate_user!, except: [:index]

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.user_id = current_user[:id]
    task.save!
    redirect_to tasks_url
  end

  def show
  end

  def index
    @tasks = Task.all
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
    params.require(:task).permit(:name, :description)
  end
end
