---
marp: true
theme: tech
paginate: true
---

<!-- _class: title-slide -->

# テクニカルリファレンス

slides プラグインのセットアップとアーキテクチャ

---

<!-- _class: code-block -->

## エクスポートコマンド

<div class="code-panel">

```bash
# HTML エクスポート
bash marp_export.sh slides.md --format html

# PDF エクスポート
bash marp_export.sh slides.md --format pdf

# PPTX エクスポート
bash marp_export.sh slides.md --format pptx

# PNG 画像エクスポート
bash marp_export.sh slides.md --format images
```

</div>
<div class="explain-panel">

### オプション

- `--format` 出力形式を指定
- `--output` 出力先パスを指定
- `--allow-local` ローカル画像を許可

### 対応フォーマット

- HTML / PDF / PPTX / PNG

</div>

---

## ファイル構成

<div class="arch-diagram">
  <div class="arch-row">
    <div class="arch-box primary">SKILL.md</div>
  </div>
  <div class="arch-arrow">↓</div>
  <div class="arch-row">
    <div class="arch-box secondary">references/</div>
    <div class="arch-box secondary">scripts/</div>
  </div>
  <div class="arch-arrow">↓</div>
  <div class="arch-row">
    <div class="arch-box neutral">themes/ (CSS)</div>
    <div class="arch-box neutral">layouts/ (テンプレート)</div>
    <div class="arch-box neutral">marp_export.sh</div>
  </div>
</div>

---

<!-- _class: demo-slide -->

## ワークフロー

<div class="demo-image">

```
ユーザー
  ↓  "スライドを作って"
Claude Code
  ↓  テーマ・レイアウト選択
Markdown ファイル生成
  ↓  marp_export.sh
PDF / HTML / PPTX / PNG
```

</div>
<div class="demo-notes">

### 処理の流れ

1. ユーザーが原稿やトピックを指示
2. プラグインがテーマとレイアウトを選択
3. Markdown ファイルを自動生成
4. エクスポートスクリプトで変換

</div>

---

## カスタマイズ方法

<div class="asymmetric">
  <div class="main-content">
    <h3>テーマの拡張</h3>
    <p>既存テーマの CSS を継承し、独自のスタイルを追加できます。</p>
    <ul>
      <li>カラーパレットの CSS 変数をオーバーライド</li>
      <li>新しいレイアウトクラスを追加</li>
      <li>フォントやスペーシングの調整</li>
    </ul>
  </div>
  <div class="sidebar">
    <h3>Tips</h3>
    <p><code>_base.css</code> を継承すると全テーマ共通のレイアウトが使えます。</p>
  </div>
</div>
