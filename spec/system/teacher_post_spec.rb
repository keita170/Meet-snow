# require 'rails_helper'

# describe 'TeacherPostでの投稿、編集、削除のテスト' do
#   let!(:teacher_post) { create(:teacher_post, title:'hoge',body:'body') }
#   describe "投稿画面(new_teacher_post_path)のテスト" do
#     before do
#     #テスト用データを読み込む
#     @user = FactoryBot.create(:user)
#     sign_in @user
#     visit new_teacher_post_path
#     end
#     context '表示の確認' do
#       it 'new_teacher_post_pathが"/teacher_posts/new"であるか' do
#         expect(current_path).to eq('/teacher_posts/new')
#       end
#       it '投稿ボタンが表示されているか' do
#         expect(page).to have_button '新規投稿する'
#       end
#     end
#     context '投稿処理のテスト' do
#       it '投稿後のリダイレクト先は正しいか' do
#         fill_in 'teacher_post[title]', with: Faker::Lorem.characters(number:5)
#         fill_in 'teacher_post[body]', with: Faker::Lorem.characters(number:20)
#         click_button '新規投稿する'
#         expect(page).to have_current_path teacher_posts_path
#       end
#     end
#   end

#   describe "投稿一覧のテスト" do
#     before do
#       @user = FactoryBot.create(:user)
#       sign_in @user
#       visit teacher_posts_path
#     end
#     context '表示の確認' do
#       it '投稿されたものが表示されているか' do
#         expect(page).to have_content teacher_post.field
#         expect(page).to have_link teacher_post.field
#       end
#     end
#   end

#   describe "詳細画面のテスト" do
#     before do
#       @user = FactoryBot.create(:user)
#       sign_in @user
#       visit teacher_post_path(teacher_post)
#     end
#     context '表示の確認' do
#       it '投稿されたものが表示されているか' do
#         expect(page).to have_content teacher_post.field
#         expect(page).to have_link teacher_post.field
#       end
#     end
#   end
#   describe '編集画面のテスト' do
#     before do
#       @user = FactoryBot.create(:user)
#       sign_in @user
#       visit edit_teacher_post_path(teacher_post)
#     end
#     context '表示の確認' do
#       it '編集前のタイトルと本文がフォームに表示(セット)されている' do
#         expect(page).to have_field 'teacher_post[title]', with: teacher_post.title
#         expect(page).to have_field 'teacher_post[body]', with: teacher_post.body
#       end
#       it '保存ボタンが表示される' do
#         expect(page).to have_button '編集内容を保存'
#       end
#     end
#     context 'teacher_post削除のテスト' do
#       it 'teacher_postの削除' do
#         expect{ teacher_post.destroy }.to change{ TeacherPost.count }.by(-1)
#       end
#     end
#     context '更新処理に関するテスト' do
#       it '更新後のリダイレクト先は正しいか' do
#         fill_in 'teacher_post[title]', with: Faker::Lorem.characters(number:5)
#         fill_in 'teacher_post[body]', with: Faker::Lorem.characters(number:20)
#         click_button '編集内容を保存'
#         expect(page).to have_current_path teacher_posts_path
#       end
#     end
#   end
# end
