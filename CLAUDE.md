# slides — Marp スライド作成プラグイン for Claude Code

## プロジェクト構造

```
skills/create-marp-slides/
  SKILL.md                          # スキル定義（スライド作成ワークフロー）
  scripts/marp_export.sh            # エクスポートスクリプト
  scripts/marp_preview.sh           # プレビュースクリプト
  references/themes/_base.css       # 共通レイアウト定義（16パターン）
  references/themes/{corporate,creative,tech,minimal}.css  # テーマCSS
  references/themes/*.md            # テーマ詳細リファレンス
  references/layouts/*.md           # レイアウト使用例リファレンス
examples/                           # テーマ別サンプルスライド
```

## アーキテクチャ

- **`_base.css`**: 16種のレイアウトクラスをCSS変数ベースで定義。テーマ非依存
- **テーマCSS** (`corporate.css`等): `@import "_base"` + 8つのCSS変数で色・フォントを定義
- **スクリプト**: `--theme-set` でテーマディレクトリ全体を渡し、ディレクトリ内の全CSSを自動読込

## CSS変数

各テーマは以下の8変数を`section`セレクタ内で定義する:

| 変数 | 用途 |
|---|---|
| `--color-primary` | メインカラー（見出し、アクセント） |
| `--color-secondary` | サブカラー（グラデーション端点等） |
| `--color-dark` | 本文テキスト色 |
| `--color-medium` | 補助テキスト色（日付、キャプション等） |
| `--color-light` | ボーダー、区切り線 |
| `--color-bg` | スライド背景色 |
| `--color-bg-alt` | カード・引用の背景色 |
| `--color-gradient` | `linear-gradient(135deg, primary, secondary)` |

## 新規テーマ追加

1. `references/themes/<name>.css` を作成（`@import "_base"` + 8変数 + 見出し・リスト等のスタイル）
2. `references/themes/<name>.md` にテーマリファレンスを作成
3. `examples/` にサンプルスライドを追加
4. スクリプトの変更は不要（`--theme-set`ディレクトリスキャンで自動認識）

## 新規レイアウト追加

1. `references/themes/_base.css` にレイアウトクラスを追加
2. `references/layouts/<name>.md` に使用例リファレンスを作成
3. `SKILL.md` のレイアウト一覧を更新

## Marp CSS セレクタルール（IMPORTANT）

Marpは全CSSセレクタにプレフィックスを付与して変換する。`<!-- _class: xxx -->`はクラスを`<section>`要素自体に付けるため:

- `section.title-slide { ... }` — 正しい。sectionへのクラスマッチ
- `.title-slide { ... }` — 誤り。`section .title-slide`（子孫セレクタ）に変換されマッチしない

子レベルのクラス（`.col`, `.stat-card`等）は通常の`.class-name`セレクタで問題ない。

## CSS Tips

- `border: none`は`border-bottom`を上書きしない場合がある。明示的に`border-bottom: none`も指定する
- Marpのページ番号は`section::after`で制御される

## プレビュー・検証

CSS/テーマ/レイアウト変更後は必ず視覚確認する:

```bash
bash skills/create-marp-slides/scripts/marp_preview.sh <input.md> --output-dir <scratchpad>
```

1. 上記コマンドでscratchpadにPNG出力
2. `Read`ツールで各スライド画像を確認
3. 問題があれば修正して再出力→再確認

確認観点: レイアウト崩れ、CSS変数の反映漏れ、border残り、テキストの切れ・はみ出し
