# README

# TITLE
Made in Recorder

## 概要
買ったものの製造地・生産地を記録します。

## コンセプト
好きなものがどこから来たのか地図で見れたら嬉しくありませんか？

## バージョン
Ruby 2.6.0
Rails 5.2.2

## 機能一覧
- [ ] ログイン機能
- [ ] ユーザー登録機能
  - [ ] メールアドレス、名前、パスワードは必須
  - [ ] プロフィール画像、基本位置(住所など),自己紹介は選択
- [ ] 投稿一覧表示
  - [ ] (作られた場所情報のマーカーをマップに一覧表示)
- [ ] 投稿機能
  - [ ] 名前と画像と製造地情報は必須
  - [ ] タグ選択機能
  - [ ] (タグ追加機能)
- [ ] 投稿詳細確認機能
  - [ ] 地図を表示して作られた場所にマーカーを設置
  - [ ] (基本位置と作られた場所の両方にマーカーを設置して線で結ぶ)
- [ ] 投稿編集機能
- [ ] 投稿削除機能

## カタログ設計
https://docs.google.com/spreadsheets/d/1v24HhlVa0P1CbKKrrtFDMEily5rakp-YMSd9HYdFVjs/edit?usp=sharing

## テーブル定義
https://cacoo.com/diagrams/8VgVHYFWWaAFuWd6/4D5D9  
https://docs.google.com/spreadsheets/d/13D8XlkKxKejtQ6SAXisJe1FJ32A-1t0GfOktPhEp0As/edit?usp=sharing

## 画面遷移図
https://cacoo.com/diagrams/nV8xL2joGV9Jo4xO/67747

## 画面ワイヤーフレーム
https://cacoo.com/diagrams/qIDKvsXIcbwCn3f0/2FBE8

## 使用予定Gem
* carrierwave
* mini_magick
* devise
