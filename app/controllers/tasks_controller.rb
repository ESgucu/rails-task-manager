class TasksController < ApplicationController
  def index
    @tasks = Task.all

  end

  def show
    @task_id = params[:id]
    @task = Task.find(@task_id)
  end

  def new
    @task = Task.new
  end

  def delete
  end

  def edit
    @task = Task.find(params[:id])
  end


  def update
    @task = Task.find(params[:id])
    @task.update((task_params))
    redirect_to task_path(@task)
  end

  def delete
    task = Task.find(params[:id])
    task.destroy

    redirect_to tasks_path, status: :see_other
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end
  private

  def task_params
    params.require(:task).permit(:title, :address, :completed)
  end

end
