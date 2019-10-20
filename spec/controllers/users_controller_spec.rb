require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'new' do
    before do
      get :new
    end
    it '新規作成画面に遷移' do
      expect(response).to render_template :new
    end
    it 'リクエストは200を返す' do
      expect(response.status).to eq 200
    end
  end

  describe 'create' do
   context '有効なパラメータの場合' do
     before do
      @user = attributes_for(:user)
      post :create, params: {user: @user}
     end
      it 'リクエストは302を返す' do
        expect(response.status).to eq 302
      end
      it '登録数が1増加する' do
        expect{
          post :create, params: {user: @user}
        }.to change(User, :count).by(1)
      end
      it 'top#indexに遷移する' do
        expect(response).to redirect_to(top_index_path)
      end
    end
  end
end
