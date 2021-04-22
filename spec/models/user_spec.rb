require 'rails_helper'
describe 'ユーザーモデル機能', type: :model do
  describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    user = FactoryBot.create(:user)
    let!(:plan) { FactoryBot.create(:plan, title: 'sample', user: user) }
    let!(:second_plan) { FactoryBot.create(:second_plan, title: 'not_titke', user: user) }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むユーザーが絞り込まれる" do
        expect(User.search_user('sample')).to include(plan)
        expect(User.search_user('test')).not_to include(second_plan)
        expect(User.search_user('sample').count).to eq 1
      end
    end
  end
end