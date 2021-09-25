require 'rails_helper'

describe 'StudentPostでの投稿、編集、削除のテスト' do
  let(:user) { create(:user) }

  describe "投稿画面(new_student_post_path)のテスト" do
    before do
    #テスト用データを読み込む
    @user = FactoryBot.create(:user)
    sign_in @user
    visit user_path(user)
    end

    context 'ログイン後の遷移先の確認' do
      it '遷移先が"/users/:id"であるか' do
        expect(current_path).to eq('/users/'+ user.id.to_s)
      end
    end

  end

  describe "ログアウトのテスト" do
    before do
    #テスト用データを読み込む
    @user = FactoryBot.create(:user)
    sign_in @user
    visit edit_user_path(user)

    end
    context 'ログアウト機能のテスト' do
      it '現在ユーザー編集ページにいるか' do
        expect(page).to have_current_path edit_user_path(user)
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        click_link destroy_user_session_path
        expect(current_path).to eq '/'
      end
    end
  end

end
