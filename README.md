# Subscription
「Subscription」は、月にかかる費用を管理できるアプリです。

グラフで視覚的に月の費用を確認できたり、メールでの通知もあるので、

どれくらい自分が使っているのかを簡単に把握することができます。

URL:


画面遷移図

<img width="609" src="https://user-images.githubusercontent.com/48615196/77590516-39ade600-6f31-11ea-9371-5f339c953c91.png">


ER図

<img width="434" src="https://user-images.githubusercontent.com/48615196/77590270-b4c2cc80-6f30-11ea-897a-a4fd98ffd8ab.png">


機能一覧

ユーザー

・ログイン機能

・ログアウト機能

・会員登録機能

サービス

・投稿機能

・集計機能(グラフで推移確認）

・検索機能

・ページング機能

・メール機能

使用技術一覧

言語・FW

・ruby 2.5.0p0

・Rails 5.2.4.2

その他gem・tool等

・devise (認証機能)

・kaminari (ページネーション)

・ransack (検索、ソート)

・bootstrap4

・chart-js-rails (チャート表示)
