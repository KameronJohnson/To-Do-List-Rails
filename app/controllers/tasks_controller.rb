class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
      @list = List.find(params[:list_id])
      @task = @list.tasks.new(task_params)
      if @task.save
        flash[:notice] = "Task added!"
        redirect_to list_path(@task.list)
      else
        render :new
      end
    end

    def edit
      @task = Task.find(params[:id])
      @list = @task.list

    end

    def update
      @task = Task.find(params[:id])
      if @task.update(params[:task])
        redirect_to list_path(@task.list)
      else
        render :edit
      end
    end

    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      redirect_to list_path(@task.list)
    end

  private
    def task_params
      params.require(:task).permit(:description)
    end
  end
