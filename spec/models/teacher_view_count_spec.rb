require 'rails_helper'

RSpec.describe 'TeacherViewCountモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(TeacherViewCount.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'TeacherPostモデルとの関係' do
      it 'N:1となっている' do
        expect(TeacherViewCount.reflect_on_association(:teacher_post).macro).to eq :belongs_to
      end
    end
  end
end