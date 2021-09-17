# require 'rails_helper'

# RSpec.describe 'StudentPostモデルのテスト', type: :model do
#   describe 'バリデーションのテスト' do
#     subject { student_post.valid? }

#     let(:user) { create(:user) }
#     let!(:student_post) { build(:student_post, user_id: user.id) }

#     context 'titleカラム' do
#       it '空欄でないこと' do
#         student_post.title = ''
#         is_expected.to eq false
#       end
#     end

#     context 'bodyカラム' do
#       it '空欄でないこと' do
#         student_post.body = ''
#         is_expected.to eq false
#       end
#       it '140文字以下であること:  140文字は〇' do
#         student_post.body = Faker::Lorem.characters(number: 140)
#         is_expected.to eq true
#       end
#       it '140文字以下であること: 141文字は×' do
#         student_post.body = Faker::Lorem.characters(number: 141)
#         is_expected.to eq false
#       end
#     end

#     context 'fieldカラム' do
#       it '空欄でないこと' do
#         student_post.field = ''
#         is_expected.to eq false
#       end
#     end

#   end

#   describe '実際に保存してみる' do
#     it "有効な投稿内容の場合は保存されるか" do
#       expect(FactoryBot.build(:student_post)).to be_valid
#     end
#   end

#   context "空白のバリデーションチェック" do
#     it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
#       student_post = StudentPost.new(title: '', body:'hoge')
#       expect(student_post).to be_invalid
#       expect(student_post.errors[:title]).to include("を入力してください")
#     end

#     it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
#       student_post = StudentPost.new(title: 'hoge', body:'')
#       expect(student_post).to be_invalid
#       expect(student_post.errors[:body]).to include("を入力してください")
#     end

#     it "fieldが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
#       student_post = StudentPost.new(title: 'hoge', field:'')
#       expect(student_post).to be_invalid
#       expect(student_post.errors[:field]).to include("を入力してください")
#     end
#   end
# end
