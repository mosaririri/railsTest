# ユーザー情報に関するコントローラー
class UsersController < ApplicationController
  # 新規作成画面
  def new
    @user = User.new
  end

  # 新規作成
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to top_index_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to top_index_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
