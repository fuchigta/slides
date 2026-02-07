# Minimal Theme

余白を活かしたミニマルデザイン。汎用的な発表、シンプルな報告、アカデミック向けに最適。

## Design Concept

**Clarity through Reduction, Typographic Hierarchy** — 装飾を極力排し、余白とタイポグラフィのウェイト差で階層を表現。

## Visual Identity

- **見出し**: 装飾なし。フォントウェイト（700/600）とレタースペーシングのみで階層を表現
- **テーブル**: 背景色なしのヘッダー、プライマリカラーの下線のみ
- **引用**: 細い（2px）セカンダリカラーのバー、グレーテキスト、イタリック
- **コードブロック**: 微細なボーダーの控えめなスタイル
- **水平線**: ヘアライン（1px）、広めのマージン（2.5em）
- **ページネーション**: テキストのみ（装飾なし）

## Color Palette

| Variable | Value | Usage |
|----------|-------|-------|
| `--color-primary` | `#1a1a2e` | 見出し |
| `--color-secondary` | `#e94560` | アクセント |
| `--color-dark` | `#16213e` | 本文テキスト |
| `--color-medium` | `#7f8c8d` | サブテキスト |
| `--color-light` | `#ecf0f1` | ボーダー、区切り |
| `--color-bg` | `#ffffff` | 背景 |
| `--color-bg-alt` | `#fafafa` | カード背景 |
| `--color-gradient` | `linear-gradient(135deg, #1a1a2e 0%, #e94560 100%)` | アクセント面 |

## CSS Theme File

テーマCSSファイル: `minimal.css`
スライド作成時は frontmatter で `theme: minimal` を指定。

## Recommended Use

- 汎用プレゼンテーション
- 研究発表、勉強会
- シンプルな社内共有
- ドキュメント的なスライド
