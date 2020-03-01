# frozen_string_literal: true

# mypageコントローラ
class MypageController < ApplicationController
  def index
    @user = User.find(params[:id]);
    @tasks = @user.tasks;
  end
end
