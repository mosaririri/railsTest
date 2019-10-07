# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @users = User.all
  end
end
