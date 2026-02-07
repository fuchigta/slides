# Tech Theme

ダークベースのテック向けテーマ。開発者カンファレンス、技術ドキュメント、アーキテクチャ紹介に最適。

## Design Concept

**Precision, Cutting-edge, Developer-friendly** — ダークモード、グロー効果、ターミナル風のコードブロックで技術的な雰囲気を演出。

## Visual Identity

- **見出し**: h1にグロー効果（`text-shadow`）、h2にボーダー下線
- **テーブル**: ダーク背景ヘッダー + プライマリカラーの下線、偶数行の微妙な背景差
- **引用**: プライマリカラーのバー + ダーク背景カード + 深いシャドウ
- **コードブロック**: より暗い背景（#181825）、インセットシャドウ付きのターミナル風
- **水平線**: ライトカラーの1px線 + プライマリカラーのグロー
- **ページネーション**: ダーク背景 + ボーダーの控えめなバッジ

## Color Palette

| Variable | Value | Usage |
|----------|-------|-------|
| `--color-primary` | `#89b4fa` | 見出し、アクセント |
| `--color-secondary` | `#a6e3a1` | 成功、ハイライト |
| `--color-dark` | `#cdd6f4` | 本文テキスト |
| `--color-medium` | `#a6adc8` | サブテキスト |
| `--color-light` | `#45475a` | ボーダー、区切り |
| `--color-bg` | `#1e1e2e` | 背景 |
| `--color-bg-alt` | `#313244` | カード背景 |
| `--color-gradient` | `linear-gradient(135deg, #89b4fa 0%, #b4befe 100%)` | アクセント面 |

## CSS Theme File

テーマCSSファイル: `tech.css`
スライド作成時は frontmatter で `theme: tech` を指定。

## Recommended Use

- 技術カンファレンス登壇
- アーキテクチャ設計レビュー
- 開発チーム向け発表
- OSS プロジェクト紹介
