# README
ゲームマッチングアプリ（仮）

## 概要
ゲーマーのマッチングを目的とするアプリで、ゲームが上手いユーザーが人を集め、技術を教えることを手助けする。
ユーザーがプランを計画し、催行日や期限を設けて実行する。ゲームを教えるユーザーは決済機能で金銭的報酬、コ
メント機能やランキング機能で自己実現を報酬として会得する。

## コンセプト
ゲームが好きなユーザーがアプリを通じてコミュニティを形成し、業界の発展に貢献する。

## バージョン
Ruby 2.6.5 
Rails 5.2.4.4

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、名前、パスワードは必須
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
- [ ] 申し込み機能


## カタログ設計
https://docs.google.com/spreadsheets/d/1zvaPTHeHArCu1Y-PpOT-1TodCdc0q3MeYH90IzNPiiM/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1dDiq0F1QGjXyzu0OShLcF-tHokfM8NIE4BpXMeSbb1c/edit?usp=sharing

## 画面遷移図,ER図
https://docs.google.com/spreadsheets/d/1_AxvymDTGwRX0arSO8jeZqEJ0zMDYnbIDIRahI7xjuc/edit?usp=sharing

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1z5FMqYAlH0Ajbo4jcn2mYRVvT_cHh_z3wTsvwsRzIHc/edit?usp=sharing

## 使用予定Gem
* carrierwave
* mini_magick
* gem 'faker'
* devise
* kaminari
* acts-as-taggable-ong
* bootstrap
* ajax

## 使用予定の「就職term」技術
* devise
* コメント機能
* AWS
* 友達登録機能

 ## カリキュラム外で取り入れる技術（使用予定）
* acts-as-taggable-ongを使ったタグ管理機能
* pay.jpによる決済機能（余裕があれば）
