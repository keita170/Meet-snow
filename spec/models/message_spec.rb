require 'rails_helper'

RSpec.describe 'Messageモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Message.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
    context 'Roomモデルとの関係' do
      it 'N:1となっている' do
        expect(Message.reflect_on_association(:room).macro).to eq :belongs_to
      end
    end
    context 'Notificationモデルとの関係' do
      it '1:Nとなっている' do
        expect(Message.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end