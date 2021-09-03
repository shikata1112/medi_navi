## アプリ名
  Medi Navi(メディナビ)
  <img width="1440" alt="スクリーンショット 2021-02-04 5 12 41" src="https://user-images.githubusercontent.com/67092021/106803824-f1f6ff80-66a7-11eb-8a36-e176426cc2e9.png">  
## 概要
  病院・クリニックの検索、口コミ投稿、スケジュール管理、会員同士のやり取りができるサービス。

## URL
  https://medi-navi.site/
  
  ヘッダーの【ゲストログイン】ボタンからゲスト会員としてログインできます。

## 特に力を入れて取り組んだこと
  - Rspec (単体: model, controller / 結合: system）、一部機能はテスト駆動開発,テスト数 計160以上
  - リファクタリング (メソッド化、delegateでメソッドの委譲)
  - N+1問題の解消（全ページ解消済み）
  - 非同期通信(1.sidekiq使用、2.DOMをJavaScriptで取得しajaxでリクエストを送る。APIを作成しデータの更新)
  - チーム開発を意識したGitコマンド、GitHubの活用 （イシュー、プルリク、マージ）

### 機能一覧
- 検索機能
  - あいまい検索
  - 診療科目検索
  - 都道府県検索
  - 登録住所近辺のクリニック検索(google API)
- 問い合わせ機能
  - 会員からアプリケーションの管理者へ問い合わせができ、管理者にはSlackで通知し会員には問い合わせ完了メールが送られる(Slack, mailerはsidekiqで非同期化)
- クーポン自動削除機能
  - レビュー投稿すると発行されるクーポンが一定期間が経過し期限切れになると自動で削除される
- 通知機能
  - DMが送られる、フォローされると会員に通知がくる
- レビュー投稿機能
- DM機能
- カレンダー機能（イベントが表示できる）
- お気に入り機能
- フォロー機能
- お気に入り機能
- PVランキング機能
- 閲覧履歴表示機能

その他機能の詳細は下記よりご確認ください

https://docs.google.com/spreadsheets/d/1QON6Tq3UOt7xvWTvUil9pjH0jcYtZlt6tWFRD3GqM68/edit?usp=sharing

## 環境・使用技術
### フロントエンド
- Bootstrap 3.3.6
- SCSS 
- JavaScript、jQuery、Ajax

### バックエンド
- Ruby 2.6.6
  - テンプレートエンジンとしてslimを使用
- Rails 5.2.4.4

### 開発環境
- MySQL2 0.5.3

### 本番環境
- AWS (EC2、RDS for MySQL、Route53、CloudWatch)
- MySQL2
- Nginx、 Puma

## About me
新卒で3年3ヶ月間、医療機器メーカーにて医療機器の修理・販売・保守を行うサービスエンジニア（SE）として勤務してました。
2020年7月からWebエンジニアを目指して勉強中です。
