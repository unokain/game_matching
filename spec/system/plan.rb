require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  before do
  end
  describe '新規作成機能' do
    context 'プランを新規作成した場合' do
      it '作成したプランが表示される' do
        visit new_session_path
        fill_in "Email", with: 'login2@gmail.com'
        fill_in "Password", with: '20202020'
        click_on 'Log in'
        visit new_task_path
        fill_in "Task name", with: '万葉課題'
        fill_in "Details", with: '課題の進捗状況'
        fill_in "Limit",with: '20211231'
        find("option[value='完了']").select_option
        find("option[value='高']").select_option
        click_on 'Create Task'
        expect(page).to have_content '課題の進捗状況'
      end
    end
    describe '検索機能' do
      before do
        # 必要に応じて、テストデータの内容を変更して構わない
      end
      context 'タイトルであいまい検索をした場合' do
        it "検索キーワードを含むタスクで絞り込まれる" do
        end
      end
      context 'ステータス検索をした場合' do
        it "ステータスに完全一致するタスクが絞り込まれる" do
          end
        end
      end
      context 'タイトルのあいまい検索とステータス検索をした場合' do
        it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
          # ここに実装する
        end
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # テストで使用するためのタスクを作成
        # タスク一覧ページに遷移
        # visit new_session_path
        # fill_in "Email", with: 'login2@gmail.com'
        # fill_in "Password", with: '20202020'
        # click_on 'Log in'
        # visit tasks_path
        # # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）git
        # expect(page).to have_content 'mofmof課題'
        # # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
    context 'タスクが作成日時の降順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        #変更があるたび、要素を追加する必要があり、大変なので、で切るだけfactorybotを使おう
        # FactoryBot.create(:task,task_name: 'hi', details: 'hi',limit: '20210301',status:"完了",priority:"中",user: @user)
        # FactoryBot.create(:second_task,task_name: 'hi', details: 'hihi2',limit: '20210401',status:"未着手", priority:"中",user: @user,created_at: Time.current + 1.days)
        # FactoryBot.create(:third_task,task_name: 'hiii', details: 'hihi3', limit: '20210501',status:"着手", priority:"中",user: @user,created_at: Time.current + 2.days)
        # FactoryBot.create(:add_task,task_name: 'hiiiii', details: 'hihi4',limit: '20210601', status:"着手", priority:"中",user: @user,created_at: Time.current + 3.days)
        # visit new_session_path
        # fill_in "Email", with: 'login2@gmail.com'
        # fill_in "Password", with: '20202020'
        # click_on 'Log in'
        # visit tasks_path
        # task = all('#task_list')
        # task_0 = task[0]
        # expect(task_0).to have_content '4'
      end
    end
    context 'タスクの終了期限を降順で並べ替える場合' do
      it '終了期限が新しいタスクが一番上に表示される' do
      end
    end
    context 'タスクの優先順位を昇順で並べ替える場合' do
      it '優先順位高が一番上に表示される' do
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
       end
     end
  end
end