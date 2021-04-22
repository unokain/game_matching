require 'rails_helper'
describe 'プランモデル機能', type: :model do
  describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    user = FactoryBot.create(:user)
    let!(:plan) { FactoryBot.create(:plan, title: 'sample', user: user) }
    let!(:second_plan) { FactoryBot.create(:second_plan, title: 'not_titke', user: user) }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
        expect(Plan.plans_search('sample')).to include(plan)
        expect(Plan.plans_search('test')).not_to include(second_plan)
        expect(Plan.plans_search('sample').count).to eq 1
      end
    end
  end
end
