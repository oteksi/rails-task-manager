class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
   end

  def show
    # @task = Task.find(params[:id])
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    # no need for app/views/restaurants/destroy.html.erb
    redirect_to tasks_path(@task)
  end

  private

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:title, :details, :completed)
  end

   def set_task
     @task = Task.find(params[:id])
   end

end
