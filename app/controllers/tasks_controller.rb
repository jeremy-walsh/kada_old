class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def add
    @task = Task.new
    @task.save
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      render 'add'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to tasks_path
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  private
    def task_params
      params.require(:task).permit(:title, :description)
    end
end
