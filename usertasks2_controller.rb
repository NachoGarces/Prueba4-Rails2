class UsertasksController < ApplicationController
  before_action :authenticate_user!

  def create
    @task = Task.find(params[:task_id])
    @usertask = Usertask.new(task: @task, user: current_user)
    if @usertask.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
end
