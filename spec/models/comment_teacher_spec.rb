# require 'rails_helper'

# RSpec.describe 'CommentTeacherモデルのテスト', type: :model do
#   describe 'アソシエーションのテスト' do
#     context 'Userモデルとの関係' do
#       it 'N:1となっている' do
#         expect(CommentTeacher.reflect_on_association(:user).macro).to eq :belongs_to
#       end
#     end
#     context 'StudentPostモデルとの関係' do
#       it 'N:1となっている' do
#         expect(CommentTeacher.reflect_on_association(:teacher_post).macro).to eq :belongs_to
#       end
#     end
#     context 'Notificationモデルとの関係' do
#       it '1:Nとなっている' do
#         expect(CommentTeacher.reflect_on_association(:notifications).macro).to eq :has_many
#       end
#     end
#   end
# end