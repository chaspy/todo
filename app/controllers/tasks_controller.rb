class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save!
    redirect_to tasks_url
  end

  def show
  end

  def index
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
