require 'rails_helper'
describe 'ユーザーモデル機能', type: :model do
  describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    let!(:user) { FactoryBot.create(:user, name: 'sample') }
    let!(:second_user) { FactoryBot.create(:second_user, name: 'not_titke') }
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むユーザーが絞り込まれる" do
        expect(User.search_user('sample')).to include(user)
        expect(User.search_user('test')).not_to include(second_user)
        expect(User.search_user('sample').count).to eq 1
      end
    end
    describe '検索機能' do
      # 必要に応じて、テストデータの内容を変更して構わない
      let!(:user) { FactoryBot.create(:user, name: 'sample') }
      let!(:second_user) { FactoryBot.create(:second_user, name: 'not_titke') }
      it '名前が31文字以上の場合、無効である' do
        user.name = 'x' * 31
        user.valid?
        expect(user).to be_invalid
      end
      it 'ゲームスキルがが501文字以上の場合、無効である' do
        user.game_skill = 'x' * 501
        user.valid?
        expect(user).to be_invalid
      end
      it '自己紹介がが501文字以上の場合、無効である' do
        user.self_profile = 'x' * 501
        user.valid?
        expect(user).to be_invalid
      end
      it 'nameがnilの場合、無効である' do
        user.name = nil
        expect(user).to be_invalid
      end
    end
  end
end