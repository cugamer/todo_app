class TasksController < ApplicationController
  def index
    @task_list = List.find(params[:id])
    @tasks = @task_list.tasks
    
    render 'index'
  end
end
