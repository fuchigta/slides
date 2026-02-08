# slides

Marpを使った美しいスライド作成プラグイン for Claude Code。

ユーザーのメッセージや原稿から、テーマとレイアウトパターンを適用したプロフェッショナルなプレゼンテーションを生成します。

## 前提条件

- [marp-cli](https://github.com/marp-team/marp-cli)（グローバルインストールまたはnpx経由）

```bash
npm install -g @marp-team/marp-cli
```

## インストール

Claude Code のプラグインとして追加:

```bash
claude plugin add /path/to/slides
```

## 使い方

### スライド作成

「スライドを作って」「プレゼン資料を作成」などと指示すると `create-marp-slides` スキルが起動します。

### 原稿からの変換

原稿ファイル（.md, .txt）のパスを指定すると、内容を分析してスライドに変換します。

### エクスポート

PDF / HTML / PPTX / PNG 形式へのエクスポートに対応しています。エクスポート形式を指示すれば、スキルが自動的に処理します。

## テーマ

テーマは外部CSSファイルとして定義されており、frontmatterで指定します:

```yaml
---
marp: true
theme: corporate
paginate: true
---
```

| テーマ    | CSS ファイル      | 特徴                             | 用途                           | サンプル                                |
| --------- | ----------------- | -------------------------------- | ------------------------------ | --------------------------------------- |
| Corporate | `corporate.css`   | クリーンなライン、構造的ボーダー | ビジネス、クライアント向け     | [PDF](examples/corporate.pdf) |
| Creative  | `creative.css`    | グラデーション装飾、丸みシェイプ | マーケティング、カンファレンス | [PDF](examples/creative.pdf)  |
| Tech      | `tech.css`        | ダークモード、グロー効果         | 技術プレゼン、開発者向け       | [PDF](examples/tech.pdf)      |
| Minimal   | `minimal.css`     | タイポグラフィ重視、余白活用     | 汎用、シンプルな発表           | [PDF](examples/minimal.pdf)   |

テーマは自動的に適用されるため、追加設定は不要です。

## レイアウト

16種類のレイアウトパターンを提供:

- **Basic**（5種）: Title, Section Divider, Content, Two Column, Image
- **Business**（5種）: Comparison Table, Stats Grid, Timeline, Org Chart, Quote
- **Tech**（6種）: Code Block, Architecture, Demo, Asymmetric, Icon Grid, Summary

すべてのレイアウトはCSS変数ベースで、どのテーマとも組み合わせ可能です。

## ライセンス

MIT
