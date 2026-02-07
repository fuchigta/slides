---
name: create-marp-slides
description: Marpを使った美しいスライド作成スキル。ユーザーのメッセージや原稿からプロフェッショナルなプレゼンテーションを生成する。"slides", "presentation", "Marp", "スライド", "プレゼン", "発表資料", "スライド作って", "プレゼン資料"などのキーワードで発動。テーマとレイアウトパターンを組み合わせ、PDF/HTML/PPTX/PNGへのエクスポートもサポート。
---

# Marp Slides

Marp（Markdown Presentation Ecosystem）を使って、外部テーマCSSとレイアウトパターンを適用した美しいスライドを生成するスキル。

## Quick Reference

| タスク | アクション |
|--------|-----------|
| 新規スライド作成 | テーマ選択 → レイアウト組み合わせ → .md生成 |
| 既存原稿からスライド化 | 原稿読み込み → 構成分析 → テーマ・レイアウト適用 |
| 既存スライド編集 | .md読み込み → 修正 → プレビュー確認 |
| テーマ変更 | frontmatterの`theme:`を差し替え |
| エクスポート | `marp_export.sh` で PDF/HTML/PPTX/PNG 出力 |
| デザイン確認 | HTML出力 → playwright-cliプレビュー → スクリーンショット確認 |

## Marp Basics

### Frontmatter Structure

```yaml
---
marp: true
theme: corporate
paginate: true
---
```

- `marp: true` — Marpとしてレンダリングを有効化（必須）
- `theme: <theme-name>` — 外部CSSテーマを指定（corporate / creative / tech / minimal）
- `paginate: true` — ページ番号表示

### Slide Separators

- `---` で新しいスライドに区切る
- `<!-- _class: layout-name -->` でスライドにCSSクラスを適用

### Image Syntax

- `![bg](url)` — 背景画像
- `![bg left:40%](url)` — 左側40%に画像配置
- `![bg right](url)` — 右側に画像配置
- `![width:300px](url)` — サイズ指定画像

### HTML Flag

`--html`フラグが必要。`<div>`等のHTML要素を使用するレイアウトではこのフラグがないとレンダリングされない。エクスポートスクリプトは自動付与する。

## Workflow

### 新規作成フロー

1. **入力の確認**: ユーザーのメッセージ/原稿を分析
   - 原稿ファイル（.md, .txt等）が指定された場合はそれを読み込む
   - 口頭指示の場合はメッセージからコンテンツを構成
2. **テーマ選択**: 用途に応じてテーマを提案（`references/themes/`参照）
3. **構成設計**: 1スライド1メッセージの原則でスライド構成を決定
4. **レイアウト割り当て**: 各スライドに最適なレイアウトを選択（`references/layouts/`参照）
5. **Markdown生成**: frontmatterに`theme:`を指定し、スライド本文を生成
6. **デザイン確認**: HTMLプレビューでレイアウト崩れをチェック（後述）
7. **エクスポート**: 要求された形式で出力

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

テーマは外部CSSファイルとして`references/themes/`に定義されており、frontmatterの`theme:`フィールドでテーマ名を指定する。エクスポートスクリプトが`--theme-set`フラグでテーマディレクトリを自動登録する。

### CSS Variable Pattern

すべてのテーマは以下のCSS変数を定義する:

```css
section {
  --color-primary: #XXXXXX;
  --color-secondary: #XXXXXX;
  --color-dark: #XXXXXX;
  --color-medium: #XXXXXX;
  --color-light: #XXXXXX;
  --color-bg: #XXXXXX;
  --color-bg-alt: #XXXXXX;
  --color-gradient: linear-gradient(...);
  font-family: "Noto Sans JP", "Hiragino Sans", "Meiryo", sans-serif;
}
```

テーマ変更時はfrontmatterの`theme:`値を変更するだけでよい。レイアウトCSSは共通ベーステーマ（`_base.css`）で定義されており、`var(--color-*)`を参照するため、テーマとレイアウトは自由に組み合わせ可能。

### Available Themes

| Theme | CSS File | Primary Color | Design Concept | Use Case |
|-------|----------|---------------|----------------|----------|
| Corporate | `corporate.css` | #0984e3 (Blue) | クリーンなライン、構造的ボーダー | ビジネス、クライアント向け |
| Creative | `creative.css` | #667eea (Purple) | グラデーション装飾、丸みのあるシェイプ | マーケティング、カンファレンス |
| Tech | `tech.css` | #89b4fa (Dark+Blue) | グロー効果、ターミナル風コード | 技術プレゼン、開発者向け |
| Minimal | `minimal.css` | #1a1a2e (Dark) | タイポグラフィ重視、余白活用 | 汎用、シンプルな発表 |

テーマ詳細（カラーパレット、推奨用途）は`references/themes/`の各`.md`ファイルを参照。

## Layout Patterns

全16レイアウトは共通ベーステーマ（`_base.css`）でCSS変数ベースに定義。どのテーマとも組み合わせ可能。

### Basic（`references/layouts/basic.md`）

| Layout | Class | Description |
|--------|-------|-------------|
| Title Slide | `title-slide` | 全画面タイトル（flexbox中央揃え） |
| Section Divider | `section-divider` | セクション区切り（アクセントバー付き） |
| Content Slide | `content-slide` | 標準コンテンツ（見出し+本文+箇条書き） |
| Two Column | `two-column` | 2カラム分割（CSS Grid 1fr 1fr） |
| Image Slide | `image-slide` | 背景画像+オーバーレイテキスト |

### Business（`references/layouts/business.md`）

| Layout | Class | Description |
|--------|-------|-------------|
| Comparison Table | `comparison-table` | Before/After比較グリッド |
| Stats Grid | `stats-grid` / `stat-card` | KPIダッシュボード |
| Timeline | `timeline` / `timeline-item` | タイムライン/プロセスフロー |
| Org Chart | `org-chart` / `org-card` | 組織図 |
| Quote Slide | `quote-slide` | 引用スライド |

### Tech & General（`references/layouts/tech.md`）

| Layout | Class | Description |
|--------|-------|-------------|
| Code Block | `code-block` | コード+説明の2カラム |
| Architecture | `arch-diagram` / `arch-box` | CSS箱矢印図 |
| Demo Slide | `demo-slide` | スクリーンショット+注釈 |
| Asymmetric | `asymmetric` | 70/30分割（メイン+サイドバー） |
| Icon Grid | `icon-grid` / `icon-item` | 4列アイコングリッド |
| Summary Slide | `summary-slide` | まとめスライド |

各レイアウトのHTMLテンプレートはリファレンスファイルを参照。

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

**重要**: プレビュー用の一時ファイル（HTML出力等）はscratchpadディレクトリに出力し、プロジェクトディレクトリを汚さないこと。

### Step 1: HTML出力

scratchpadディレクトリにHTMLを出力する:

```bash
bash skills/create-marp-slides/scripts/marp_export.sh <input.md> --format html --output <scratchpad>/preview.html
```

### Step 2: HTTPサーバー起動

**重要**: `file://`プロトコルはplaywright-cliでブロックされるため、HTTPサーバー経由でプレビューする。

Bashツールの`run_in_background`パラメータを使って起動する（シェルの`&`ではなく）:

```bash
# Bashツールで run_in_background: true を指定して実行
cd <scratchpad> && python -m http.server 8765
```

### Step 3: ブラウザプレビュー

```bash
playwright-cli open http://localhost:8765/preview.html
```

### Step 4: スクリーンショット確認

`playwright-cli screenshot --filename <path>`で各スライドをキャプチャし、`Read`ツールで画像を確認する。

**重要**: `--filename`オプションでscratchpadディレクトリ内にパスを指定すること。指定しないとカレントディレクトリに自動命名で保存される。

```bash
# スクリーンショット取得 → Readツールで確認
playwright-cli screenshot --filename <scratchpad>/slide-1.png
```

確認観点（発生しやすい問題）:
- **レイアウト崩れ**: グリッドレイアウト（two-column, stats-grid等）が縦積みになっていないか
- **グラデーション背景**: summary-slideの背景が白のままになっていないか
- **h1の不要なborder-bottom**: テーマ側のborder設定が残っていないか
- **テキストの切れ・はみ出し**: スライド領域を超えていないか
- **余白・間隔のバランス**

スライド間の遷移（**キー名は大文字小文字を区別する**）。`&&`でチェーンすると効率的:

```bash
playwright-cli press ArrowRight && playwright-cli screenshot --filename <scratchpad>/slide-2.png
```

特定スライドへのジャンプ:

```bash
playwright-cli goto "http://localhost:8765/preview.html#<N>"
```

修正後は再エクスポートしてリロード:

```bash
playwright-cli reload
```

### Step 5: 修正と再検証

問題発見時はMarkdown/CSSを修正し、再度HTML生成→リロード→スクリーンショットを繰り返す。

### Step 6: クリーンアップ

検証完了後、ブラウザを閉じ、バックグラウンドのHTTPサーバーを`TaskStop`ツールで停止する:

```bash
playwright-cli close
```

HTTPサーバーはBashツールの`run_in_background`で起動しているため、`TaskStop`ツールでタスクIDを指定して停止する。

### playwright-cli Command Reference

| コマンド | 説明 |
|----------|------|
| `playwright-cli open [url]` | ブラウザを開く（URL省略可。他コマンドの前に必要） |
| `playwright-cli goto <url>` | URLに遷移（`#N`でスライド指定可） |
| `playwright-cli reload` | ページをリロード |
| `playwright-cli screenshot [ref]` | スクリーンショット取得（`--filename <path>` でパス指定、`--full-page` でフルページ） |
| `playwright-cli press <key>` | キーボード操作（`ArrowRight`, `ArrowLeft`等、大文字小文字区別あり） |
| `playwright-cli close` | ブラウザを閉じる |

## Export

`scripts/marp_export.sh`でエクスポート（marp-cliに依存）。スクリプトは自動的に`--theme-set`でテーマディレクトリを登録する。

```bash
bash skills/create-marp-slides/scripts/marp_export.sh <input.md> --format <format> [--output path] [--allow-local]
```

| Format | Description |
|--------|-------------|
| `html` | HTMLプレゼンテーション（デフォルト） |
| `pdf` | PDF出力 |
| `pptx` | PowerPoint出力 |
| `png` | 単一PNG画像（最初のスライド） |
| `images` | 全スライドをPNG画像として出力 |

marp-cli未インストール時: `npm install -g @marp-team/marp-cli`（npx経由のフォールバックも対応）

## Anti-patterns

- **インラインCSS（`style:`）を使わない** — `theme:` で外部テーマを指定する
- **ハードコードされた色を使わない** — 必ずCSS変数`var(--color-*)`を使用
- **1スライドに情報を詰め込みすぎない** — 1メッセージの原則を守る
- **HTML要素だけのスライドを作らない** — Markdownの見出し・リストを優先し、HTMLは構造が必要な場合のみ
- **`--html`フラグを忘れない** — div要素が表示されなくなる（エクスポートスクリプトは自動付与）
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

## Resources

### scripts/
- `marp_export.sh` — marp-cliラッパー。全形式（PDF/HTML/PPTX/PNG）のエクスポートに使用。`--theme-set`でテーマディレクトリを自動登録

### references/themes/
テーマ定義。CSSファイル（外部テーマ）とMarkdownファイル（カラーパレット・推奨用途のリファレンス）:
- `_base.css` — 共通ベーステーマ（全16レイアウトのCSS定義、内部使用）
- `corporate.css` / `corporate.md` — ビジネス向けブルーテーマ
- `creative.css` / `creative.md` — グラデーション系クリエイティブテーマ
- `tech.css` / `tech.md` — ダークモードテックテーマ
- `minimal.css` / `minimal.md` — ミニマルデザインテーマ

### references/layouts/
レイアウトパターン定義。HTMLテンプレート＋使用例を収録:
- `basic.md` — 基本5レイアウト（title, section, content, two-column, image）
- `business.md` — ビジネス5レイアウト（comparison, stats, timeline, org-chart, quote）
- `tech.md` — テック6レイアウト（code, architecture, demo, asymmetric, icon-grid, summary）
