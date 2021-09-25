# require 'rails_helper'

# RSpec.describe 'TeacherPostモデルのテスト', type: :model do
#   describe 'バリデーションのテスト' do
#     subject { teacher_post.valid? }

#     let(:user) { create(:user) }
#     let!(:teacher_post) { build(:teacher_post, user_id: user.id) }

#     context 'titleカラム' do
#       it '空欄でないこと' do
#         teacher_post.title = ''
#         is_expected.to eq false
#       end
#       it '15文字以下であること: 15文字は〇' do
#         teacher_post.title = Faker::Lorem.characters(number: 15)
#         is_expected.to eq true
#       end
#       it '15文字以下であること: 16文字は×' do
#         teacher_post.title = Faker::Lorem.characters(number: 16)
#         is_expected.to eq false
#       end
#     end

#     context 'bodyカラム' do
#       it '空欄でないこと' do
#         teacher_post.body = ''
#         is_expected.to eq false
#       end
#       it '140文字以下であること: 140文字は〇' do
#         teacher_post.body = Faker::Lorem.characters(number: 140)
#         is_expected.to eq true
#       end
#       it '140文字以下であること: 141文字は×' do
#         teacher_post.body = Faker::Lorem.characters(number: 141)
#         is_expected.to eq false
#       end
#     end

#     context 'fieldカラム' do
#       it '空欄でないこと' do
#         teacher_post.field = ''
#         is_expected.to eq false
#       end
#     end
#   end

#   describe 'アソシエーションのテスト' do
#     context 'Userモデルとの関係' do
#       it 'N:1となっている' do
#         expect(TeacherPost.reflect_on_association(:user).macro).to eq :belongs_to
#       end
#     end
#     context 'FavoriteTeacherモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(TeacherPost.reflect_on_association(:favorite_teachers).macro).to eq :has_many
#       end
#     end
#     context 'CommentTeacherモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(TeacherPost.reflect_on_association(:comment_teachers).macro).to eq :has_many
#       end
#     end
#     context 'Notificationモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(TeacherPost.reflect_on_association(:notifications).macro).to eq :has_many
#       end
#     end
#     context 'TeacherViewCountモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(TeacherPost.reflect_on_association(:teacher_view_counts).macro).to eq :has_many
#       end
#     end
#   end

#   describe '実際に保存してみる' do
#     it "有効な投稿内容の場合は保存されるか" do
#       expect(FactoryBot.build(:teacher_post)).to be_valid
#     end
#   end

#   context "空白のバリデーションチェック" do
#     it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
#       teacher_post = TeacherPost.new(title: '', body:'hoge')
#       expect(teacher_post).to be_invalid
#       expect(teacher_post.errors[:title]).to include("を入力してください")
#     end

#     it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
#       teacher_post = TeacherPost.new(title: 'hoge', body:'')
#       expect(teacher_post).to be_invalid
#       expect(teacher_post.errors[:body]).to include("を入力してください")
#     end

#     it "fieldが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
#       teacher_post = TeacherPost.new(title: 'hoge', field:'')
#       expect(teacher_post).to be_invalid
#       expect(teacher_post.errors[:field]).to include("を入力してください")
#     end
#   end
# end
