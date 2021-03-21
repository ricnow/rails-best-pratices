# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)

    respond_to do
      if @task.save
        render :show, status: :created, location: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do
      if @task.update(task_params)
        render :show, status: :ok, location: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :location, :scheduled_to)
  end
end
