require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do
  describe 'コメント新規作成機能' do
    context 'コメントを新規作成した場合' do
      it '作成したコメントが表示される' do
        visit new_user_registration_path
        fill_in "Eメール", with: 'login_test@gmail.com'
        fill_in "user[name]", with: 'test太郎'
        fill_in "パスワード", with: '20202020'
        fill_in "パスワード（確認用）", with: '20202020'
        click_on 'アカウント登録'
        visit new_plan_path
        fill_in "plan[title]", with: '一緒にゲームする人募集'
        fill_in "plan[tag_list]", with: 'ゲーム'
        fill_in'plan[limit_time]', with: '002021-10-02-1700'
        fill_in'plan[start_time]', with: '002021-10-07-1700'
        fill_in "plan[content]", with: 'ガチ初心者ですが一緒に楽しみたいのでフレンド募集します初心者の方 一緒に頑張りましょう！中～上級者の方 コツとか教えて貰えたらめっちゃ嬉しいです！！'
        click_on '投稿する'
        click_on '一緒にゲームする人募集'
        fill_in "comment[content]", with: 'コメント入力'
        click_on '投稿する'
        expect(page).to have_content 'コメント入力'
      end
    end
  end
end