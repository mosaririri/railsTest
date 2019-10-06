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
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index 
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
