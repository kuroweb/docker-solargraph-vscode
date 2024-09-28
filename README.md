# docker-solargraph-vscode<!-- omit in toc -->

- VSCodeでSolargraphによるコード補完と定義ジャンブを動作させるために作成したもの

## TOC<!-- omit in toc -->

- [Required](#required)
- [Setup](#setup)
- [ENV Config](#env-config)

## Required

- VSCode Extension:
  - [castwide.solargraph](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph)

## Setup

- `env`ファイルを作成して値を入力（[ENV Config](#env-config)）

  ```bash
  $ cp env.example env
  ```

- Docker Composeでイメージビルド、Dockerコンテナを起動

  ```bash
  $ docker compose build
  $ docker compose run app bundle install
  $ docker compose up -d
  ```

- VSCodeに[castwide.solargraph](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph)をインストール

- SolargraphをVSCodeで実行したいプロジェクトで`.vscode/settings.json`に以下の内容を追記

  ```json
  {
    "solargraph.transport": "external",
    "solargraph.externalServer": {
      "host": "localhost",
      "port": 7658
    },
    "solargraph.useBundler": true,
    "solargraph.diagnostics": false,
    "solargraph.definitions": true,
    "solargraph.completion": true,
    "solargraph.references": true,
    "solargraph.checkGemVersion": false
  }
  ```

## ENV Config

- `env`に入力する値

  | 項目 | 内容 | 例 |
  | -- | -- | -- |
  | RUBY_VERSION | コンテナで実行するRubyバージョン | 3.2.2 |
  | SOLARGRAPH_VERSION | コンテナで実行するSolargraphバージョン | 0.48.0 |
  | SOURCE_PATH | Solargraphを実行するソースコードのフルパス | /Users/\<username\>/rails |
  | PORT | Solargraphコンテナのポート番号 | 7658 |
