require 'rails_helper'

RSpec.describe 'ViewCountモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(ViewCount.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'StudentPostモデルとの関係' do
      it 'N:1となっている' do
        expect(ViewCount.reflect_on_association(:student_post).macro).to eq :belongs_to
      end
    end
  end
end