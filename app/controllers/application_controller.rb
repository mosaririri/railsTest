# frozen_string_literal: true

# 汎用コントローラー
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 新規登録時のストロングパラメータに「nicknameカラム」の追加
  def configure_permitted_parameters
    # 新規登録時のストロングパラメータに「nicknameカラムとageカラム」の追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
