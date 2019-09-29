# frozen_string_literal: true

class TopController < ApplicationController
  def index
    @user = User.first 
  end
end
