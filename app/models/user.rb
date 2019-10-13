# frozen_string_literal: true.
# ユーザーモデル
class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
