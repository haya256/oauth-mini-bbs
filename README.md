# OAuth Mini BBS

個人情報を極力保持しないシンプルなミニSNSアプリケーション

## 概要

- Google OAuth（OpenID Connect）でログイン
- メールアドレスや名前は保存せず、匿名で投稿できる
- ユーザーは "User #1", "User #2" のような匿名IDで表示

## 技術スタック

- **Ruby**: 3.4.8
- **Rails**: 8.1.2
- **Database**: PostgreSQL 17
- **Authentication**: OmniAuth Google OAuth2

## クイックスタート

```bash
# 依存関係インストール
bundle install

# データベース作成
bin/rails db:create
bin/rails db:migrate

# 環境変数設定
cp .env.example .env
# .env を編集して必要な値を設定（詳細は下記「環境変数」を参照）

# サーバー起動
bin/rails server
# => http://localhost:3000
```

## 環境変数

`.env.example` をコピーして `.env` を作成し、以下の値を設定してください。

| 変数名 | 必須 | 説明 |
|---|---|---|
| `APP_TITLE` | 任意 | アプリのタイトル（デフォルト: `OAuth Mini BBS`） |
| `GOOGLE_CLIENT_ID` | 必須 | Google OAuth クライアント ID |
| `GOOGLE_CLIENT_SECRET` | 必須 | Google OAuth クライアントシークレット |

## Google OAuth 設定

1. [Google Cloud Console](https://console.cloud.google.com/apis/credentials) でプロジェクト作成
2. OAuth 2.0 クライアント ID を作成（ウェブアプリケーション）
3. 承認済みのリダイレクト URI に以下を追加:
   - 開発環境: `http://localhost:3000/auth/google_oauth2/callback`
   - 本番環境: `https://yourdomain.com/auth/google_oauth2/callback`
4. スコープは **openid のみ** を使用
5. クライアント ID とシークレットを `.env` に設定

## トラブルシューティング

### PostgreSQL に接続できない
```bash
brew services start postgresql@17
bin/rails db:create
```

### OAuth 認証が失敗する
- `.env` の認証情報を確認
- Google Cloud Console のリダイレクト URI が正しいか確認
- Rails サーバーを再起動

## 主要機能

- ✅ Google OAuth ログイン
- ✅ 匿名投稿（500文字まで）
- ✅ 投稿一覧表示
- ✅ ログアウト

## 今後の拡張予定

- 投稿の編集・削除
- いいね機能
- コメント機能
- ページネーション
- リアルタイム更新

## ライセンス

[MIT License](LICENSE) © 2026 haya256
