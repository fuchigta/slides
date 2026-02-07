# Business Layouts

ビジネスプレゼンテーション向けの5つのレイアウトパターン。

---

## 1. comparison-table

Before/After比較グリッド。新旧比較、競合比較に使用。

CSSクラス: `.comparison-table`, `.comparison-header`, `.comparison-item`

### Template

```html
## Before vs After

<div class="comparison-table">
  <div class="comparison-header left">Before</div>
  <div class="comparison-header right">After</div>
  <div class="comparison-item left">Old approach description</div>
  <div class="comparison-item right">New approach description</div>
  <div class="comparison-item left">Old limitation</div>
  <div class="comparison-item right">New advantage</div>
</div>
```

---

## 2. stats-grid

KPIダッシュボード。数値実績の強調表示に使用。

CSSクラス: `.stats-grid`, `.stat-card`, `.stat-number`, `.stat-label`

### Template

```html
## Key Metrics

<div class="stats-grid">
  <div class="stat-card">
    <div class="stat-number">150%</div>
    <div class="stat-label">Growth Rate</div>
  </div>
  <div class="stat-card">
    <div class="stat-number">10K+</div>
    <div class="stat-label">Active Users</div>
  </div>
  <div class="stat-card">
    <div class="stat-number">99.9%</div>
    <div class="stat-label">Uptime</div>
  </div>
</div>
```

---

## 3. timeline

タイムライン/プロセスフロー。時系列イベントやステップ表示に使用。

CSSクラス: `.timeline`, `.timeline-item`

### Template

```html
## Project Roadmap

<div class="timeline">
  <div class="timeline-item">
    <h4>Q1 2025 - Planning</h4>
    <p>Requirements gathering and design</p>
  </div>
  <div class="timeline-item">
    <h4>Q2 2025 - Development</h4>
    <p>Core feature implementation</p>
  </div>
  <div class="timeline-item">
    <h4>Q3 2025 - Launch</h4>
    <p>Public release and marketing</p>
  </div>
</div>
```

---

## 4. org-chart

組織図。チーム構成やレポートラインの表示に使用。

CSSクラス: `.org-chart`, `.org-level`, `.org-card`, `.org-connector`

### Template

```html
## Team Structure

<div class="org-chart">
  <div class="org-level">
    <div class="org-card head">
      <h4>CEO</h4>
      <p>Name</p>
    </div>
  </div>
  <div class="org-connector"></div>
  <div class="org-level">
    <div class="org-card">
      <h4>CTO</h4>
      <p>Name</p>
    </div>
    <div class="org-card">
      <h4>COO</h4>
      <p>Name</p>
    </div>
  </div>
</div>
```

---

## 5. quote-slide

引用スライド。インパクトのある引用や重要メッセージの強調に使用。

CSSクラス: `.quote-slide`, `.quote-text`, `.quote-author`

### Template

```html
<!-- _class: quote-slide -->

<div class="quote-text">
Your inspiring quote goes here
</div>
<div class="quote-author">— Author Name</div>
```
