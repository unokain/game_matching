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
  describe '登録機能' do
    let(:user) { FactoryBot.create(:user) }
    let!(:plan) { FactoryBot.create(:plan, user: user) }
    it '新規作成できる' do
      expect(plan).to be_valid
    end
    it 'titleがない場合、無効である' do
      plan.title = nil
      plan.valid?
      expect(plan).to be_invalid
    end
    it 'contentがない場合、無効である' do
      plan.content = nil
      plan.valid?
      expect(plan).to be_invalid
    end
    it 'メッセージがが501文字以上の場合、無効である' do
      plan.content = 'x' * 501
      plan.valid?
      expect(plan).to be_invalid
    end
    it '開始日時が現在時刻より前の場合、無効である' do
      plan.start_time = Time.now - 60
      plan.valid?
      expect(plan).to be_invalid
      expect(plan.errors[:start_time]).to include("は現在の日時より後の時間を選択してください")
    end
    it '開始日時が申し込み期限より前の場合、無効である' do
      plan.start_time = Time.now + 3600
      plan.limit_time = Time.now + 7200
      plan.valid?
      expect(plan.errors[:limit_time]).to include("は開始日時より前の時間を選択してください")
    end
    it '申し込み期限がnilの場合、無効である' do
      plan.limit_time = nil
      expect(plan).to be_invalid
    end
    it '開始日時がnilの場合、無効である' do
      plan.start_time = nil
      expect(plan).to be_invalid
    end
  end
end
