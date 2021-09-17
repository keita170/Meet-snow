# require 'rails_helper'

# RSpec.describe 'Evaluationモデルのテスト', type: :model do
#   describe 'バリデーションのテスト' do
#     subject { evaluation.valid? }

#     let(:user) { create(:user) }
#     let!(:evaluation) { build(:evaluation, user_id: user.id) }

#     context 'evaluationカラム' do
#       it '空欄でないこと' do
#         evaluation.evaluation = ''
#         is_expected.to eq false
#       end
#     end

#     context 'contentカラム' do
#       it '空欄でないこと' do
#         evaluation.content = ''
#         is_expected.to eq false
#       end
#     end

#     context 'commentカラム' do
#       it '空欄でないこと' do
#         evaluation.comment = ''
#         is_expected.to eq false
#       end
#     end
#   end

#   describe '実際に保存してみる' do
#     it "有効な投稿内容の場合は保存されるか" do
#       expect(FactoryBot.build(:evaluation)).to be_valid
#     end
#   end

#   context "空白のバリデーションチェック" do
#     it "evaluationが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
#       evaluation = Evaluation.new(evaluation: '', content:'またお願いしたい', comment:'hoge')
#       expect(evaluation).to be_invalid
#       expect(evaluation.errors[:evaluation]).to include("を入力してください")
#     end

#     it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
#       evaluation = Evaluation.new(evaluation: '4.0', content:'', comment:'hoge')
#       expect(evaluation).to be_invalid
#       expect(evaluation.errors[:content]).to include("を入力してください")
#     end

#     it "fieldが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
#       evaluation = Evaluation.new(evaluation: '4.0', content:'またお願いしたい', comment:'')
#       expect(evaluation).to be_invalid
#       expect(evaluation.errors[:comment]).to include("を入力してください")
#     end
#   end
# end
