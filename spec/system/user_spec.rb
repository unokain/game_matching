require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do
  describe '新規作成機能' do
    context 'ユーザーを新規作成した場合' do
      it '作成したユーザーが表示される' do
        visit new_user_registration_path
        fill_in "Eメール", with: 'login_test@gmail.com'
        fill_in "user[name]", with: 'test太郎'
        fill_in "パスワード", with: '20202020'
        fill_in "パスワード（確認用）", with: '20202020'
        click_on 'アカウント登録'
        click_on 'マイページ'
        expect(page).to have_content 'test太郎'
      end
    end
  end
  describe '検索機能' do
    context '名前であいまい検索をした場合' do
        user = FactoryBot.create(:user)
        second_user = FactoryBot.create(:second_user)
        let!(:plan) { FactoryBot.create(:plan, title: 'sample', user: user) }
        let!(:second_plan) { FactoryBot.create(:second_plan, title: 'not_title', user: second_user) }
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit new_user_registration_path
        fill_in "Eメール", with: 'login_test@gmail.com'
        fill_in "user[name]", with: 'sample太郎'
        fill_in "パスワード", with: '20202020'
        fill_in "パスワード（確認用）", with: '20202020'
        click_on 'アカウント登録'
        visit users_path
        fill_in "search_user", with: 'sample太郎'
        click_on '検索'
        expect(page).to have_content 'sample太郎'
        expect(page).not_to have_content 'test'
      end
    end
  end
  describe '詳細表示機能' do
    user = FactoryBot.create(:second_user)
    let!(:plan) { FactoryBot.create(:plan, title: 'sample1', user: user, created_at: Time.current + 1.days) }
    let!(:second_plan) { FactoryBot.create(:second_plan, title: 'sample2', user: user, created_at: Time.current + 2.days) }
    let!(:thrid_plan) { FactoryBot.create(:second_plan, title: 'sample3', user: user, created_at: Time.current + 3.days) }
    context '任意のユーザー詳細画面に遷移した場合' do
      it '該当ユーザーの内容が表示される' do
        visit new_user_registration_path
        fill_in "Eメール", with: 'login_test@gmail.com'
        fill_in "user[name]", with: 'test太郎'
        fill_in "パスワード", with: '20202020'
        fill_in "パスワード（確認用）", with: '20202020'
        click_on 'アカウント登録'
        click_on 'マイページ'
        expect(page).to have_content 'ゲームスキル・実績'
        expect(page).to have_content 'login_test@gmail.com'
      end
    end
  end
  describe 'ユーザー情報編集機能' do
    context '任意のユーザー編集画面に遷移した場合' do
      it '該当ユーザーの内容が編集できる' do
        visit new_user_registration_path
        fill_in "Eメール", with: 'login_test@gmail.com'
        fill_in "user[name]", with: 'test太郎'
        fill_in "パスワード", with: '20202020'
        fill_in "パスワード（確認用）", with: '20202020'
        click_on 'アカウント登録'
        click_on 'マイページ'
        click_on 'プロフィールを編集'
        fill_in "user[game_skill]", with: 'ゲームを教えてくれる人大募集'
        fill_in "user[current_password]", with: '20202020'
        click_on '更新'
        click_on 'マイページ'
        expect(page).to have_content 'ゲームを教えてくれる人大募集'
      end
    end
  end
  describe 'プラン削除' do
    context '任意のタスク編集画面に遷移した場合' do
      it '該当タスクの内容が編集できる' do
        visit new_user_registration_path
        fill_in "Eメール", with: 'login_test@gmail.com'
        fill_in "user[name]", with: 'test太郎'
        fill_in "パスワード", with: '20202020'
        fill_in "パスワード（確認用）", with: '20202020'
        click_on 'アカウント登録'
        click_on 'マイページ'
        click_on 'プロフィールを編集'
        click_on 'アカウント削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
  end
  describe 'フォロー機能' do
    context 'ユーザー一覧画面に遷移した場合' do
      it 'ユーザーをフォローできる' do
        visit new_user_registration_path
        fill_in "Eメール", with: 'login_test@gmail.com'
        fill_in "user[name]", with: 'test太郎'
        fill_in "パスワード", with: '20202020'
        fill_in "パスワード（確認用）", with: '20202020'
        click_on 'アカウント登録'
        click_on 'マイページ'
        click_on 'プロフィールを編集'
        click_on 'アカウント削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
  end
end

