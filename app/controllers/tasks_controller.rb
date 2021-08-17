class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :details, :completed))
    @task.save
    redirect_to task_path(@task)
  end

  def show
  end

  def edit
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end
end
