class TasksusersController < ApplicationController
  before_action :authenticate_user!

  def create
    @task = Task.find(params[:task_id])
    @tasksusers = TasksUsers.new(task_id: @task.id,
                                 user_id: current_user.id,
                                 completed: true)
    if @tasksusers.save
      redirect_to root_path, notice: 'Tarea completada!!'
    else
      redirect_to root_path, alert: 'Error al completar tarea'
    end
  end

  def index
    @tasksusers = TasksUsers.all
    @task = Task.all
  end
end
