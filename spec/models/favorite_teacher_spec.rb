require 'rails_helper'

RSpec.describe 'FavoriteTeacherモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(FavoriteTeacher.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'TeacherPostモデルとの関係' do
      it 'N:1となっている' do
        expect(FavoriteTeacher.reflect_on_association(:teacher_post).macro).to eq :belongs_to
      end
    end
  end
end