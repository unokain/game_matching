# README
ゲームマッチングアプリ（仮）

## 概要
このアプリは、ゲーマー同士の交流する場所を作り、募集と参加というプロセスを経て、交流してもらうことを目的にしてます。同じゲームが好きなゲーマーでもそれだけでゲーマーどうしが交流するにはハードルが高い現状があります。特にシャイな人にとってはハードルが高いと思います。最近はツイッターで募集をかけて集まり交流することが主流ですが、フォロワー数が多い人であったり、知り合い同士で集まってしまったりして、ただ単に募集をかけただけでは人が集まらない事情があります。また、esprotが流行る中、友達同士では集まって遊ぶことは一般的であれど、ゲームがうまい方がゲームを教える、初心者が教わるという技術や経験を目的として生まれる交流環境は、が少ないとも思っています。そんな現状の中、ゲーマが交流できる場所を提供することが必要だと思っています。

## コンセプト
ゲームが好きなユーザーがアプリを通じてコミュニティを形成し、業界の発展に貢献する。

## バージョン
Ruby 2.6.5 
Rails 5.2.５

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、名前、パスワードは必須
- [ ] ユーザー退会機能
- [ ] パスワード再設定機能
- [ ] プラン一覧表示機能
  - [ ] タグ機能が使える
  - [ ] kaminariを使用して見やすくする
- [ ] プラン投稿機能
  - [ ] タイトルと記事内容は必須
- [ ] プラン編集機能
- [ ] プラン削除機能
  - [ ] プラン編集とプラン削除は投稿者のみ実行可能
- [ ] 友達つながりフォロー機能
  - [ ] 友達検索を可能とする
  - [ ] 自分自身はフォローできない
- [ ] コメント投稿機能
- [ ] コメント削除機能
- [ ] コメント編集機能
  - [ ] コメント編集とコメント削除はコメントした本人のみ可能
  - [ ] コメント機能についてはページ遷移なしで実行できる
- [ ] メール告知機能
- [ ] プラン申し込み機能
- [ ] チャット機能


## カタログ設計
https://docs.google.com/spreadsheets/d/1zvaPTHeHArCu1Y-PpOT-1TodCdc0q3MeYH90IzNPiiM/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1dDiq0F1QGjXyzu0OShLcF-tHokfM8NIE4BpXMeSbb1c/edit?usp=sharing

## 画面遷移図,ER図
https://docs.google.com/spreadsheets/d/1_AxvymDTGwRX0arSO8jeZqEJ0zMDYnbIDIRahI7xjuc/edit?usp=sharing

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1z5FMqYAlH0Ajbo4jcn2mYRVvT_cHh_z3wTsvwsRzIHc/edit?usp=sharing

## 使用している技術
* WebフレームワークにRuby on Railsを使用
* Rspecを使用してテスト
* フロントエンドはHTML,CSS,javascriptを使用
* レスポンシブ対応のためにBootstrap
* Ajaxを使用した動的処理
* device等のいくつかプラグインを使用
* AWS Nginx uniconを使った仮想サーバーへのアプリケーションのデプロイ
* S３ストレージを使った画像の保存
* AWSのroutes53を使用したドメイン設定
* AWSのERBを使用したhttpsの実装


## 使用しているGem
* carrierwave
* mini_magick
* gem 'faker'
* devise
* kaminari
* acts-as-taggable-ong
* bootstrap
* unicorn
* rails_admin
* webpacker
* jquery-rails
* dotenv-rails
* faker
* factory_bot_rails
* rspec-rails

## その他
* Font AwesomeのCDNでの導入

