---
name: create-marp-slides
description: 'Marpを使った美しいスライド作成スキル。ユーザーのメッセージや原稿からプロフェッショナルなプレゼンテーションを生成する。"slides", "presentation", "Marp", "スライド", "プレゼン", "発表資料", "スライド作って", "プレゼン資料" などのキーワードで発動。テーマとレイアウトパターンを組み合わせ、PDF/HTML/PPTX/PNGへのエクスポートもサポート。'
---

# Marp Slides

## Quick Reference

| タスク                 | アクション                                            |
| ---------------------- | ----------------------------------------------------- |
| 新規スライド作成       | テーマ選択 → レイアウト組み合わせ → .md生成           |
| 既存原稿からスライド化 | 原稿読み込み → 構成分析 → テーマ・レイアウト適用      |
| 既存スライド編集       | .md読み込み → 修正 → プレビュー確認                   |
| テーマ変更             | frontmatterの`theme:`を差し替え                       |
| エクスポート           | `marp_export.sh` で PDF/HTML/PPTX/PNG 出力            |
| デザイン確認           | `marp_preview.sh` でPNG出力 → `Read` ツールで画像確認 |

## Marp Basics

### Frontmatter Template

```yaml
---
marp: true
theme: corporate
paginate: true
---
```

### Slide Structure

- `---` で新しいスライドに区切る
- `<!-- _class: layout-name -->` でスライドにCSSクラスを適用

## Workflow

### 新規作成フロー

1. **入力の確認**: ユーザーのメッセージ/原稿を分析（ファイル指定時は`Read`で読み込み）
2. **テーマ選択**: 用途に応じてテーマを提案（`references/themes/`参照）
3. **構成設計**: 1スライド1メッセージの原則でスライド構成を決定
4. **レイアウト割り当て**: 各スライドに最適なレイアウトを選択（`references/layouts/`参照）
5. **Markdown生成**: frontmatterに`theme:`を指定し、スライド本文を生成
6. **デザイン確認**: プレビューでレイアウト崩れをチェック（後述）

### 原稿からの変換

ユーザーが原稿ファイルのパスを指定した場合:

1. `Read`ツールで原稿ファイルを読み込む
2. 内容を分析し、スライド構成に分解する
3. 各セクションに適切なレイアウトを割り当てる
4. frontmatterに`theme:`を指定してMarkdownを生成する

### 既存スライド編集

1. 既存の.mdファイルを`Read`で読み込み
2. frontmatterのtheme指定とスライド本文を把握
3. 要求された修正を適用

## Theme Application

frontmatterの`theme:`フィールドでテーマ名を指定する。レイアウトCSSは共通ベーステーマ（`_base.css`）で`var(--color-*)`を参照するため、テーマとレイアウトは自由に組み合わせ可能。

| Theme       | 用途                           |
| ----------- | ------------------------------ |
| `corporate` | ビジネス、クライアント向け     |
| `creative`  | マーケティング、カンファレンス |
| `tech`      | 技術プレゼン、開発者向け       |
| `minimal`   | 汎用、シンプルな発表           |

テーマ詳細（カラーパレット、CSS変数、推奨用途）は`references/themes/`の各`.md`ファイルを参照。

## Layout Patterns

全16レイアウトは`_base.css`でCSS変数ベースに定義。どのテーマとも組み合わせ可能。

- **Basic** (`references/layouts/basic.md`): `title-slide`, `section-divider`, `content-slide`, `two-column`, `image-slide`
- **Business** (`references/layouts/business.md`): `comparison-table`, `stats-grid`, `timeline`, `org-chart`, `quote-slide`
- **Tech & General** (`references/layouts/tech.md`): `code-block`, `arch-diagram`, `demo-slide`, `asymmetric`, `icon-grid`, `summary-slide`

各レイアウトのHTMLテンプレートと使用例はリファレンスファイルを参照。

## Design Principles

1. **1スライド1メッセージ**: 各スライドは1つの明確なポイントのみ伝える
2. **レイアウト多様性**: 同じレイアウトが3スライド連続しないようにする
3. **日本語テキスト注意点**:
   - 日本語は英語より文字幅が広い。テキスト量を控えめに
   - `line-height: 1.8`以上を推奨
   - 長文は箇条書きに分解する
4. **視覚的階層**: h1 > h2 > h3 > body textのサイズ差を明確に
5. **余白**: `padding: 50px`以上を確保。詰め込みすぎない
6. **コントラスト**: 背景と文字色のコントラスト比4.5:1以上

## Design Review Process

スライド生成後、自律的にデザインを検証・修正するプロセス。

### Step 1: PNG画像出力

`marp_preview.sh`でscratchpadディレクトリに全スライドのPNG画像を出力する:

```bash
bash skills/create-marp-slides/scripts/marp_preview.sh <input.md> --output-dir <scratchpad>
```

生成されるファイル: `<scratchpad>/<basename>.001.png`, `<scratchpad>/<basename>.002.png`, ...

### Step 2: 画像確認

`Read`ツールで各スライドのPNG画像を直接確認する。Readツールは画像ファイルをマルチモーダルに認識する。

確認観点（発生しやすい問題）:

- **レイアウト崩れ**: グリッドレイアウト（two-column, stats-grid等）が縦積みになっていないか
- **グラデーション背景**: summary-slideの背景が白のままになっていないか
- **h1の不要なborder-bottom**: テーマ側のborder設定が残っていないか
- **テキストの切れ・はみ出し**: スライド領域を超えていないか
- **余白・間隔のバランス**

### Step 3: 修正と再検証

問題発見時はMarkdownを修正し、再度`marp_preview.sh`でPNG出力→`Read`で確認を繰り返す。

## Export

```bash
bash skills/create-marp-slides/scripts/marp_export.sh <input.md> --format <html|pdf|pptx|png|images> [--output path] [--allow-local]
```

## Anti-patterns

- **インラインCSS（`style:`）を使わない** — `theme:` で外部テーマを指定する
- **ハードコードされた色を使わない** — 必ずCSS変数`var(--color-*)`を使用
- **1スライドに情報を詰め込みすぎない** — 1メッセージの原則を守る
- **HTML要素だけのスライドを作らない** — Markdownの見出し・リストを優先し、HTMLは構造が必要な場合のみ
- **同一レイアウトの連続使用** — 単調さを避ける

## Marp CSS注意事項

### セレクタ変換ルール（重要）

Marpは全CSSセレクタに `div#\:\$p > svg > foreignObject > section` というプレフィックスを付与する。この変換により:

- `.title-slide` → `section .title-slide`（**子孫セレクタ**になる）
- `section.title-slide` → `section.title-slide`（**要素セレクタ**のまま）

`_class`ディレクティブはクラスを`<section>`要素自体に付与するため、`_base.css`でセクションレベルのレイアウトクラスを定義する際は**必ず`section.class-name`構文を使う**。

```css
/* 正しい — sectionにクラスが付くのでマッチする */
section.title-slide { ... }

/* 誤り — section内の.title-slide子要素を探すのでマッチしない */
.title-slide { ... }
```

子レベルのクラス（`.col`, `.stat-card`, `.timeline-item`等）はHTML内で使用するため、通常の`.class-name`セレクタで問題ない。

### border上書きの注意

`border: none`ショートハンドは個別プロパティ（`border-bottom`等）を確実に上書きしない場合がある。h1やh2のborderを消す場合は明示的に指定する:

```css
section.title-slide h1 {
  border: none;
  border-bottom: none; /* 明示的に指定 */
}
```
