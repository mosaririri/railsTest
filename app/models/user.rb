# frozen_string_literal: true.
# ユーザーモデル
class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
