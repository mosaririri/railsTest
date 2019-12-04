# タスクに関するコントローラー
class TasksController < ApplicationController
  # 新規作成画面
  def new
    @task = Task.new
    user_id = params[:id]
    @task.user_id = user_id
  end

  # タスク登録
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to user_path(@task.user_id)
    else
      redirect_to 'new'
    end
  end

  # タスク表示
  def show
    @task = Task.find(params[:id])
  end

  # タスク更新
  def update
    @task = Task.find(params[:id])
    @task.executed_at = Time.zone.now if params[:is_executed]
    if @task.update_attributes(task_params)
      redirect_to user_path(@task.user_id)
    else
      render 'show'
    end
  end

  # タスクの削除
  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to user_path(@task.user_id)
  end

  private

  def task_params
    params.require(:task).permit(:content, :user_id, :is_executed)
  end
end
