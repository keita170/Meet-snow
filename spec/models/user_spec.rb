# require 'rails_helper'

# RSpec.describe 'Userモデルのテスト', type: :model do
#   describe 'バリデーションのテスト' do
#     subject { user.valid? }

#     let!(:other_user) { create(:user) }
#     let(:user) { build(:user) }

#     context 'nameカラム' do
#       it '空欄でないこと' do
#         user.name = ''
#         is_expected.to eq false
#       end
#       it '2文字以上であること: 1文字は×' do
#         user.name = Faker::Lorem.characters(number: 1)
#         is_expected.to eq false
#       end
#       it '2文字以上であること: 2文字は〇' do
#         user.name = Faker::Lorem.characters(number: 2)
#         is_expected.to eq true
#       end
#       it '20文字以下であること: 15文字は〇' do
#         user.name = Faker::Lorem.characters(number: 15)
#         is_expected.to eq true
#       end
#       it '15文字以下であること: 16文字は×' do
#         user.name = Faker::Lorem.characters(number: 16)
#         is_expected.to eq false
#       end
#       it '一意性があること' do
#         user.name = other_user.name
#         is_expected.to eq false
#       end
#     end

#     context 'introductionカラム' do
#       it '200文字以下であること: 200文字は〇' do
#         user.introduction = Faker::Lorem.characters(number: 200)
#         is_expected.to eq true
#       end
#       it '200文字以下であること: 201文字は×' do
#         user.introduction = Faker::Lorem.characters(number: 201)
#         is_expected.to eq false
#       end
#     end
#   end
  
#   describe 'アソシエーションのテスト' do
#     context 'StudentPostモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:student_posts).macro).to eq :has_many
#       end
#     end
#     context 'TeacherPostモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:teacher_posts).macro).to eq :has_many
#       end
#     end
#     context 'Favoriteモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:favorites).macro).to eq :has_many
#       end
#     end
#     context 'FavoriteTeacherモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:favorite_teachers).macro).to eq :has_many
#       end
#     end
#     context 'Commentモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:comments).macro).to eq :has_many
#       end
#     end
#     context 'CommentTeacherモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:comment_teachers).macro).to eq :has_many
#       end
#     end
#     context 'Evaluationモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:evaluations).macro).to eq :has_many
#       end
#     end
#     context 'ViewCountモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:view_counts).macro).to eq :has_many
#       end
#     end
#     context 'TeacherViewCountモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:teacher_view_counts).macro).to eq :has_many
#       end
#     end
#     context 'Messageモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:messages).macro).to eq :has_many
#       end
#     end
#     context 'Entryモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:entries).macro).to eq :has_many
#       end
#     end
#     context 'Roomモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(User.reflect_on_association(:rooms).macro).to eq :has_many
#       end
#     end
#   end
# end
