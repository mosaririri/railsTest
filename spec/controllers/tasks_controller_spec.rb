require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'new' do
    it '新規作成画面に遷移'
    it 'リクエストは200を返す'
  end

  describe 'create' do
    context '有効なパラメータの場合' do
      it 'リクエストは302を返す'
      it '登録数が1増加する'
      it '登録完了メッセージを表示する'
      it 'ユーザー情報画面に遷移する'
    end
    context '無効なパラメータの場合' do
      it 'リクエストは200を返す'
      it '登録数は増加しない'
      it 'エラーメッセージを表示する'
      it 'タスク作成画面にリダイレクトする'
    end
  end
  describe 'update' do
     context '有効なパラメータの場合' do
      it 'リクエストは302を返す'
      it '更新完了メッセージを表示する'
      it 'ユーザー情報画面に遷移する'
    end
    context '無効なパラメータの場合' do
      it 'リクエストは200を返す'
      it '登録内容は変化しない'
      it 'エラーメッセージを表示する'
      it 'タスク編集画面にリダイレクトする'
    end
  end
end
