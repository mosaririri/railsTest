# frozen_string_literal: true.
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "入力情報を登録する（名前）" do
    expect(FactoryBot.create(:user)).to be_valid
  end
end
