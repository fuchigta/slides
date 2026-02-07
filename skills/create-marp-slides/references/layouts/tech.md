# Tech & General Layouts

テック・汎用の6つのレイアウトパターン。

---

## 1. code-block

コード＋説明の2カラム。技術解説に使用。

CSSクラス: `.code-block`, `.code-panel`, `.explain-panel`

### Template

```markdown
<!-- _class: code-block -->

## API Example

<div class="code-panel">

\`\`\`python
def hello(name: str) -> str:
    return f"Hello, {name}!"
\`\`\`

</div>
<div class="explain-panel">

### Explanation

- Function takes a name parameter
- Returns formatted greeting
- Type hints for clarity

</div>
```

---

## 2. architecture-diagram

CSS箱矢印図。システムアーキテクチャの可視化に使用。

CSSクラス: `.arch-diagram`, `.arch-row`, `.arch-box`, `.arch-arrow`

### Template

```html
## System Architecture

<div class="arch-diagram">
  <div class="arch-row">
    <div class="arch-box primary">Client</div>
  </div>
  <div class="arch-arrow">↓</div>
  <div class="arch-row">
    <div class="arch-box secondary">API Gateway</div>
  </div>
  <div class="arch-arrow">↓</div>
  <div class="arch-row">
    <div class="arch-box neutral">Service A</div>
    <div class="arch-box neutral">Service B</div>
    <div class="arch-box neutral">Service C</div>
  </div>
</div>
```

---

## 3. demo-slide

スクリーンショット＋注釈。デモ画面の説明に使用。

CSSクラス: `.demo-slide`, `.demo-image`, `.demo-notes`

### Template

```html
## Feature Demo

<div class="demo-image">

![Screenshot](screenshot.png)

</div>
<div class="demo-notes">

### Key Points

1. Step one explanation
2. Step two explanation
3. Step three explanation

</div>
```

---

## 4. asymmetric

70/30分割レイアウト。メインコンテンツ＋サイドバーに使用。

CSSクラス: `.asymmetric`, `.main-content`, `.sidebar`

### Template

```html
## Main Topic

<div class="asymmetric">
  <div class="main-content">
    <h3>Details</h3>
    <p>Main content with detailed explanation.</p>
    <ul>
      <li>Point 1</li>
      <li>Point 2</li>
    </ul>
  </div>
  <div class="sidebar">
    <h3>Key Takeaway</h3>
    <p>Important supplementary info.</p>
  </div>
</div>
```

---

## 5. icon-grid

4列アイコングリッド。機能一覧やサービス紹介に使用。

CSSクラス: `.icon-grid`, `.icon-item`, `.icon-circle`

### Template

```html
## Features

<div class="icon-grid">
  <div class="icon-item">
    <div class="icon-circle">🔐</div>
    <h4>Security</h4>
    <p>End-to-end encryption</p>
  </div>
  <div class="icon-item">
    <div class="icon-circle">⚡</div>
    <h4>Speed</h4>
    <p>Instant response</p>
  </div>
  <div class="icon-item">
    <div class="icon-circle">🌐</div>
    <h4>Global</h4>
    <p>Available worldwide</p>
  </div>
  <div class="icon-item">
    <div class="icon-circle">📱</div>
    <h4>Mobile</h4>
    <p>Access anywhere</p>
  </div>
</div>
```

---

## 6. summary-slide

まとめスライド。プレゼンテーションの締めくくりに使用。

CSSクラス: `.summary-slide`, `.key-points`, `.key-point`, `.key-point-number`, `.key-point-text`

### Template

```html
<!-- _class: summary-slide -->

# Summary

<div class="key-points">
  <div class="key-point">
    <div class="key-point-number">1</div>
    <div class="key-point-text">First key takeaway</div>
  </div>
  <div class="key-point">
    <div class="key-point-number">2</div>
    <div class="key-point-text">Second key takeaway</div>
  </div>
  <div class="key-point">
    <div class="key-point-number">3</div>
    <div class="key-point-text">Third key takeaway</div>
  </div>
</div>
```
