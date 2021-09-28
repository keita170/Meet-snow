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
      # it 'プロフィール編集ボタンで編集画面へ遷移する' do
      #   click_link "プロフィール編集"
      #   expect(current_path).to eq ('/users/' + user.id.to_s + '/edit')
      # end
      # it 'Usersリンクのアイコンが表示される' do
      #   is_expected.to have_selector '.fas.fa-user'
      # end
    end
  end

  describe 'アイコンのテスト' do
    context 'ユーザー詳細画面' do
      subject { page }

      before do
        @user = FactoryBot.create(:user)
        sign_in @user
        visit user_path(user)
      end

      it 'studentのアイコンが表示される' do
        is_expected.to have_selector '.fas.fa-baby'
      end
      it 'teaacherのアイコンが表示される' do
        is_expected.to have_selector '.fas.fa-user-graduate'
      end
      it 'いいね一覧へのアイコンが表示される' do
        is_expected.to have_selector '.fas.fa-heart'
      end
      it 'DM一覧へのアイコンが表示される' do
        is_expected.to have_selector '.fas.fa-comment'
      end
      it 'ユーザー詳細画面へのアイコンが表示される' do
        is_expected.to have_selector '.fas.fa-user'
      end
      it '通知一覧画面へのアイコンが表示される' do
        is_expected.to have_selector '.fas.fa-bell'
      end
    end
  end

  describe 'ログインしていない場合のアクセス制限のテスト: アクセスできず、ログイン画面に遷移する' do
    subject { current_path }

    it 'ユーザ一覧画面' do
      visit users_path
      is_expected.to eq '/users/sign_in'
    end
    it 'ユーザ詳細画面' do
      visit user_path(user)
      is_expected.to eq '/users/sign_in'
    end
    it 'ユーザ情報編集画面' do
      visit edit_user_path(user)
      is_expected.to eq '/users/sign_in'
    end
    it '生徒投稿一覧画面' do
      visit student_posts_path
      is_expected.to eq '/users/sign_in'
    end
    it '先生投稿一覧画面' do
      visit teacher_posts_path
      is_expected.to eq '/users/sign_in'
    end
    it 'いいね一覧画面' do
      visit favorites_users_path
      is_expected.to eq '/users/sign_in'
    end
    it '通知一覧画面' do
      visit notifications_path
      is_expected.to eq '/users/sign_in'
    end
    it 'DM一覧画面' do
      visit rooms_path
      is_expected.to eq '/users/sign_in'
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
        click_link "ログアウトする"
        expect(current_path).to eq '/'
      end
    end
  end

end
