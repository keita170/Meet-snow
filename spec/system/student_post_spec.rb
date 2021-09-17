# require 'rails_helper'

# describe 'StudentPostでの投稿、編集、削除のテスト' do
#   let!(:student_post) { create(:student_post, title:'hoge',body:'body') }
#   describe "投稿画面(new_student_post_path)のテスト" do
#     before do
#     #テスト用データを読み込む
#     @user = FactoryBot.create(:user)
#     sign_in @user
#     visit new_student_post_path
#     end
#     context '表示の確認' do
#       it 'new_student_post_pathが"/student_posts/new"であるか' do
#         expect(current_path).to eq('/student_posts/new')
#       end
#       it '投稿ボタンが表示されているか' do
#         expect(page).to have_button '新規投稿する'
#       end
#     end
#     context '投稿処理のテスト' do
#       it '投稿後のリダイレクト先は正しいか' do
#         fill_in 'student_post[title]', with: Faker::Lorem.characters(number:5)
#         fill_in 'student_post[body]', with: Faker::Lorem.characters(number:20)
#         click_button '新規投稿する'
#         expect(page).to have_current_path student_posts_path
#       end
#     end
#   end

#   describe "投稿一覧のテスト" do
#     before do
#       @user = FactoryBot.create(:user)
#       sign_in @user
#       visit student_posts_path
#     end
#     context '表示の確認' do
#       it '投稿されたものが表示されているか' do
#         expect(page).to have_content student_post.field
#         expect(page).to have_link student_post.field
#       end
#     end
#   end

#   describe "詳細画面のテスト" do
#     before do
#       @user = FactoryBot.create(:user)
#       sign_in @user
#       visit student_post_path(student_post)
#     end
#     context '表示の確認' do
#       it '投稿されたものが表示されているか' do
#         expect(page).to have_content student_post.field
#         expect(page).to have_link student_post.field
#       end
#     end
#   end
#   describe '編集画面のテスト' do
#     before do
#       @user = FactoryBot.create(:user)
#       sign_in @user
#       visit edit_student_post_path(student_post)
#     end
#     context '表示の確認' do
#       it '編集前のタイトルと本文がフォームに表示(セット)されている' do
#         expect(page).to have_field 'student_post[title]', with: student_post.title
#         expect(page).to have_field 'student_post[body]', with: student_post.body
#       end
#       it '保存ボタンが表示される' do
#         expect(page).to have_button '編集内容を保存'
#       end
#     end
#     context 'student_post削除のテスト' do
#       it 'student_postの削除' do
#         expect{ student_post.destroy }.to change{ StudentPost.count }.by(-1)
#       end
#     end
#     context '更新処理に関するテスト' do
#       it '更新後のリダイレクト先は正しいか' do
#         fill_in 'student_post[title]', with: Faker::Lorem.characters(number:5)
#         fill_in 'student_post[body]', with: Faker::Lorem.characters(number:20)
#         click_button '編集内容を保存'
#         expect(page).to have_current_path student_posts_path
#       end
#     end
#   end
# end
