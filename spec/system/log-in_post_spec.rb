require 'rails_helper'

describe '投稿のテスト' do
  let!(:student_post) { create(:student_post, title:'hoge',body:'body') }
  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面(root_path)に「Welcome toMeet snow!!」が表示されているか' do
        expect(page).to have_content 'Welcome toMeet snow!!'
      end
      it 'top_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「Meet snow」と表示される' do
        expect(page).to have_content 'Meet snow'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it 'アカウント作成ボタンが表示される' do
        expect(page).to have_button 'アカウント作成'
      end
    end

    context '新規登録成功のテスト' do
      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button 'アカウント作成' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、新規登録できたユーザの詳細画面になっている' do
        click_button 'アカウント作成'
        expect(current_path).to eq '/users/' + User.last.id.to_s
      end
    end
  end

  describe 'ユーザログイン' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「Meet snow」と表示される' do
        expect(page).to have_content 'Meet snow'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
    end

    context 'ログイン成功のテスト' do
      before do
        fill_in 'user[name]', with: user.name
        fill_in 'user[password]', with: user.password
        fill_in 'user[email]', with: user.email
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、ログインしたユーザの詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[name]', with: ''
        fill_in 'user[password]', with: ''
        fill_in 'user[email]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      fill_in 'user[email]', with: user.email
      click_button 'ログイン'
    end
  end

  describe 'ユーザログアウトのテスト' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      fill_in 'user[email]', with: user.email
      click_button 'ログイン'
      click_button 'プロフィール編集'
      logout_link = find_all('a')[4].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
    end

    context 'ログアウト機能のテスト' do
      it '正しくログアウトできている: ログアウト後のリダイレクト先においてAbout画面へのリンクが存在する' do
        expect(page).to have_link '', href: '/'
      end
      it 'ログアウト後のリダイレクト先が、トップになっている' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  # describe "投稿画面(new_student_post_path)のテスト" do
  #   before do
  #     visit new_student_post_path
  #   end
  #   context '表示の確認' do
  #     it 'new_student_post_pathが"/student_posts/new"であるか' do
  #       expect(current_path).to eq('/student_posts/new')
  #     end
  #     it '投稿ボタンが表示されているか' do
  #       expect(page).to have_button '新規投稿をする'
  #     end
  #   end
  #   context '投稿処理のテスト' do
  #     it '投稿後のリダイレクト先は正しいか' do
  #       fill_in 'student_post[title]', with: Faker::Lorem.characters(number:5)
  #       fill_in 'student_post[body]', with: Faker::Lorem.characters(number:20)
  #       click_button '新規投稿をする'
  #       expect(page).to have_current_path student_posts_path
  #     end
  #   end
  # end

#   describe "投稿一覧のテスト" do
#     before do
#       visit todolists_path
#     end
#     context '表示の確認' do
#       it '投稿されたものが表示されているか' do
#         expect(page).to have_content list.title
#         expect(page).to have_link list.title
#       end
#     end
#   end

#   describe "詳細画面のテスト" do
#     before do
#       visit todolist_path(list)
#     end
#     context '表示の確認' do
#       it '削除リンクが存在しているか' do
#         expect(page).to have_link '削除'
#       end
#       it '編集リンクが存在しているか' do
#         expect(page).to have_link '編集'
#       end
#     end
#     context 'リンクの遷移先の確認' do
#       it '編集の遷移先は編集画面か' do
#         edit_link = find_all('a')[3]
#         edit_link.click
#         expect(current_path).to eq('/todolists/' + list.id.to_s + '/edit')
#       end
#     end
#     context 'list削除のテスト' do
#       it 'listの削除' do
#         expect{ list.destroy }.to change{ List.count }.by(-1)
#       end
#     end
#   end

#   describe '編集画面のテスト' do
#     before do
#       visit edit_todolist_path(list)
#     end
#     context '表示の確認' do
#       it '編集前のタイトルと本文がフォームに表示(セット)されている' do
#         expect(page).to have_field 'list[title]', with: list.title
#         expect(page).to have_field 'list[body]', with: list.body
#       end
#       it '保存ボタンが表示される' do
#         expect(page).to have_button '保存'
#       end
#     end
#     context '更新処理に関するテスト' do
#       it '更新後のリダイレクト先は正しいか' do
#         fill_in 'list[title]', with: Faker::Lorem.characters(number:5)
#         fill_in 'list[body]', with: Faker::Lorem.characters(number:20)
#         click_button '保存'
#         expect(page).to have_current_path todolist_path(list)
#       end
#     end
#   end
end