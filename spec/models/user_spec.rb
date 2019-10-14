# frozen_string_literal: true.
require 'rails_helper'

RSpec.describe User, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = build(:user)
  end

  describe 'バリデーション' do
    it 'nameとemail、passwordに入力がある場合' do
      expect(@user.valid?).to eq(true)
    end

   it 'nameがカラの場合' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

   it 'emailがカラの場合' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

   it 'passwordがカラの場合' do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end

  end

end
