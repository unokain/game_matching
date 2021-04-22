require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  describe '新規作成機能' do
    context 'プランを新規作成した場合' do
      it '作成したプランが表示される' do
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
        expect(page).to have_content '一緒にゲームする人募集'
      end
    end
  end
  describe '検索機能' do
    context 'タイトルであいまい検索をした場合' do
        user = FactoryBot.create(:user)
        let!(:plan) { FactoryBot.create(:plan, title: 'sample', user: user) }
        let!(:second_plan) { FactoryBot.create(:second_plan, title: 'not_title', user: user) }
      it "検索キーワードを含むタスクで絞り込まれる" do
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
        fill_in "search", with: '一緒にゲームする人募集'
        click_on '検索'
        expect(page).to have_content '一緒にゲームする人募集'
      end
    end
  end
  describe '一覧表示機能' do
    user = FactoryBot.create(:second_user)
    let!(:plan) { FactoryBot.create(:plan, title: 'sample1', user: user, created_at: Time.current + 1.days) }
    let!(:second_plan) { FactoryBot.create(:second_plan, title: 'sample2', user: user, created_at: Time.current + 2.days) }
    let!(:thrid_plan) { FactoryBot.create(:second_plan, title: 'sample3', user: user, created_at: Time.current + 3.days) }
    context 'プランが作成日時の降順に並んでいる場合' do
      it 'プランが表示される' do
        visit new_user_registration_path
        fill_in "Eメール", with: 'login_test@gmail.com'
        fill_in "user[name]", with: 'test太郎'
        fill_in "パスワード", with: '20202020'
        fill_in "パスワード（確認用）", with: '20202020'
        click_on 'アカウント登録' 
        expect(page).to have_content 'sample1'
        expect(page).to have_content 'sample2'
        expect(page).to have_content 'sample3'
      end
    end
  end
  describe '詳細表示機能' do
    user = FactoryBot.create(:second_user)
    let!(:plan) { FactoryBot.create(:plan, title: 'sample1', user: user, created_at: Time.current + 1.days) }
    let!(:second_plan) { FactoryBot.create(:second_plan, title: 'sample2', user: user, created_at: Time.current + 2.days) }
    let!(:thrid_plan) { FactoryBot.create(:second_plan, title: 'sample3', user: user, created_at: Time.current + 3.days) }
    context '任意のプラン詳細画面に遷移した場合' do
      it '該当プランの内容が表示される' do
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
        expect(page).to have_content 'プラン内容'
        expect(page).to have_content 'コメント一覧'
      end
    end
  end
  describe 'プラン編集機能' do
    user = FactoryBot.create(:second_user)
    let!(:plan) { FactoryBot.create(:plan, title: 'sample1', user: user, created_at: Time.current + 1.days) }
    let!(:second_plan) { FactoryBot.create(:second_plan, title: 'sample2', user: user, created_at: Time.current + 2.days) }
    let!(:thrid_plan) { FactoryBot.create(:second_plan, title: 'sample3', user: user, created_at: Time.current + 3.days) }
    context '任意のプラン編集画面に遷移した場合' do
      it '該当プランの内容が編集できる' do
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
        click_on '編集'
        fill_in "plan[title]", with: 'ゲームを教えてくれる人大募集'
        click_on '投稿する'
        expect(page).not_to have_content '一緒にゲームする人募集'
        expect(page).to have_content 'ゲームを教えてくれる人大募集'
      end
    end
  end
  describe 'プラン削除' do
    context '任意のプラン編集画面に遷移した場合' do
      it '該当プランの内容が削除できる' do
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
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content '一緒にゲームする人募集'
      end
    end
  end
  describe 'プラン申し込み機能' do
    user = FactoryBot.create(:user)
    let!(:plan) { FactoryBot.create(:plan, title: 'sample', user: user) }
    context '任意のプラン詳細画面に遷移した場合' do
      it '該当プランの申し込みボタンから申し込みができる' do
        visit new_user_registration_path
        fill_in "Eメール", with: 'login_test@gmail.com'
        fill_in "user[name]", with: 'test太郎'
        fill_in "パスワード", with: '20202020'
        fill_in "パスワード（確認用）", with: '20202020'
        click_on 'アカウント登録'
        visit plans_path
        click_on 'sample'
        click_on '申し込む'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'キャンセルする'
      end
      it '該当プランの申し込みボタンからキャンセルできる' do
        visit new_user_registration_path
        fill_in "Eメール", with: 'login_test@gmail.com'
        fill_in "user[name]", with: 'test太郎'
        fill_in "パスワード", with: '20202020'
        fill_in "パスワード（確認用）", with: '20202020'
        click_on 'アカウント登録'
        visit plans_path
        click_on 'sample'
        click_on '申し込む'
        page.driver.browser.switch_to.alert.accept
        click_on 'キャンセルする'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '申し込む'
      end
    end
  end
end

