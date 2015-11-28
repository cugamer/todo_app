class TasksController < ApplicationController
  def index
    @task_list = List.find(params[:id])
    @tasks = @task_list.tasks
    
    render 'index'
  end
  
  def create
    list = List.find(task_params[:list_id])
    task = list.tasks.new(task_params)
    
    if task.save
      flash[:success] = "New task was created"
    else
      flash[:danger] = task.errors.full_messages[0]
    end
    
    redirect_to show_tasks_path(list.id)
  end
  
  def destroy
    task = Task.find(params[:id])
    @task_list = List.find(task.list_id)
    @tasks = @task_list.tasks
    task_name = task.name
    if task.destroy
      flash[:success] = "The \"#{task_name}\" task was successfully removed."
    else
      flash[:danger] = "The task was not removed"
    end
    
    render 'index'
  end
  
  private
    def task_params
      params.require(:task).permit(:name, :list_id)
    end
end
