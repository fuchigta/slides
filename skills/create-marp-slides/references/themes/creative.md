# Creative Theme

グラデーションを活かしたクリエイティブなテーマ。マーケティング、ブランディング、製品ローンチに最適。
既存スライドの #667eea / #764ba2 配色をインスピレーションとして設計。

## Design Concept

**Energy, Inspiration, Bold Expression** — グラデーション装飾、丸みのあるシェイプ、遊び心のあるシャドウで活力と創造性を表現。

## Visual Identity

- **見出し**: h1にグラデーションテキスト（`background-clip: text`）、h2にグラデーション下線（`border-image`）
- **テーブル**: グラデーションヘッダー、丸い角、下線区切り
- **引用**: グラデーションバー + ティント背景 + 丸みのある角 + 浮遊感のあるシャドウ
- **コードブロック**: グラデーション左バー、丸い角（12px）、プライマリカラーのシャドウ
- **水平線**: グラデーション（3px）
- **ページネーション**: 控えめなテキスト表示

## Color Palette

| Variable | Value | Usage |
|----------|-------|-------|
| `--color-primary` | `#667eea` | 見出し、アクセント |
| `--color-secondary` | `#764ba2` | グラデーション終点 |
| `--color-dark` | `#2d3436` | 本文テキスト |
| `--color-medium` | `#6c757d` | サブテキスト |
| `--color-light` | `#dee2e6` | ボーダー、区切り |
| `--color-bg` | `#ffffff` | 背景 |
| `--color-bg-alt` | `#f8f9fa` | カード背景 |
| `--color-gradient` | `linear-gradient(135deg, #667eea 0%, #764ba2 100%)` | アクセント面 |

## CSS Theme File

テーマCSSファイル: `creative.css`
スライド作成時は frontmatter で `theme: creative` を指定。

## Recommended Use

- マーケティング・ブランディング資料
- 製品ローンチ、新機能紹介
- カンファレンス登壇スライド
- クリエイティブ提案
