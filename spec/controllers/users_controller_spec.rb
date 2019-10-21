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
    context '無効なパラメータの場合' do
      before do
        @invalid_user = attributes_for(:invalid_user)
        post :create, params: {user: @invalid_user}
      end
      it 'リクエストは200を返す' do
        expect(response.status).to eq 200 
      end
      it '登録数が増加しない' do
        expect{
          post :create, params: {user: @invalid_user}
        }.not_to change(User, :count)
      end
      it '#newに遷移する' do
        expect(response).to render_template :new
      end
    end
  end
  describe '#update' do
    context 'ユーザーが存在する' do
      before do
        @attr = attributes_for(:user)
        post :create, params: { user: @attr }
        @user = User.first
      end
      context '有効なパラメータの場合' do
        before do
          # Strong Parameter設定時の書き方（忘れないように）
          patch :update, params: { id: @user.id, user: { name: 'hogehoge', email: @user.email, password: @user.password }}
        end
        it 'ステータスが302を返す' do
          expect(response.status).to eq 302
        end
        it 'DBのデータが更新される' do
          expect(@user.reload.name).to eq 'hogehoge'
        end
        it 'ユーザーページに遷移する' do
          expect(response).to redirect_to @user
        end
      end
      context '無効なパラメータの場合' do
        before do
          # Strong Parameter設定時の書き方（忘れないように）
          patch :update, params: { id: @user.id, user: { name: 'hogehoge', email: nil, password: @user.password }}
        end
        it 'ステータスが200を返す' do
          expect(response.status).to eq 200
        end
        it 'DBのデータが更新されない' do
          expect(@user.reload.name).to eq @user.name
        end
        it '編集ページにに戻る' do
          expect(response).to render_template 'edit'
        end
      end
    end
    context 'ユーザーが存在しない' do
      before do
        @invald_user = build(:invalid_user)
      end
      it '例外を吐く' do
        expect {
          patch :update, params: { id: 999999, name: 'hoge'}
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end
