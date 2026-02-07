# Corporate Theme

ビジネス向けのクリーンでプロフェッショナルなテーマ。四半期レビュー、クライアント提案、社内報告に最適。

## Design Concept

**Trust, Clarity, Precision** — 明確なライン、構造的なボーダー処理、控えめなシャドウで信頼感と読みやすさを重視。

## Visual Identity

- **見出し**: h1にプライマリカラーの下線（3px）、h2にライトカラーの下線（2px）で階層を明示
- **テーブル**: プライマリカラー背景のヘッダー、偶数行のストライプ
- **引用**: 左4pxのプライマリカラーバー + 背景色カード
- **コードブロック**: ライトグレー背景、ボーダー付き、微細なシャドウ
- **水平線**: ライトカラーの2px線
- **ページネーション**: プライマリカラーの上線付き

## Color Palette

| Variable | Value | Usage |
|----------|-------|-------|
| `--color-primary` | `#0984e3` | 見出し、アクセント |
| `--color-secondary` | `#74b9ff` | サブ要素、ホバー |
| `--color-dark` | `#2d3436` | 本文テキスト |
| `--color-medium` | `#636e72` | サブテキスト |
| `--color-light` | `#dfe6e9` | ボーダー、区切り |
| `--color-bg` | `#ffffff` | 背景 |
| `--color-bg-alt` | `#f5f6fa` | カード背景 |
| `--color-gradient` | `linear-gradient(135deg, #0984e3 0%, #74b9ff 100%)` | アクセント面 |

## CSS Theme File

テーマCSSファイル: `corporate.css`
スライド作成時は frontmatter で `theme: corporate` を指定。

## Recommended Use

- 四半期レビュー、経営報告
- クライアント向け提案資料
- 社内プレゼンテーション
- プロジェクト進捗報告
