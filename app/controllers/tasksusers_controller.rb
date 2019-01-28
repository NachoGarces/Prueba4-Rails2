class TasksusersController < ApplicationController
  before_action :authenticate_user!

  def create
    @task = Task.find(params[:task_id])
    time = Time.now
    @tasksusers = TasksUsers.new(task_id: @task.id,
                                 user_id: current_user.id,
                                 completed: true,
                                 completed_at: time)
    if @tasksusers.save
      redirect_to root_path, notice: 'Tarea completada!!'
    else
      redirect_to root_path, alert: 'Error al completar tarea'
    end
  end

  def update
    @tasksusers = TasksUsers.find(params[:id])
    if @tasksusers.completed == true
      @tasksusers.update(completed: false, completed_at: nil)
    else
      @tasksusers.update(completed: true, completed_at: Time.now)
    end
    redirect_to root_path
  end
end
