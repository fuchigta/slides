# Basic Layouts

基本的な5つのレイアウトパターン。すべてのスライドデッキで使用する汎用レイアウト。

---

## 1. title-slide

全画面タイトルスライド。プレゼンテーションの表紙に使用。

CSSクラス: `.title-slide`

### Template

```markdown
<!-- _class: title-slide -->

# Presentation Title

Subtitle or description text

Author Name / Date
```

---

## 2. section-divider

セクション区切りスライド。章の切り替えに使用。

CSSクラス: `.section-divider`

### Template

```markdown
<!-- _class: section-divider -->

# Section Title

Brief description of this section
```

---

## 3. content-slide

標準コンテンツスライド。見出し＋本文＋箇条書きの基本構成。

CSSクラス: `.content-slide`

### Template

```markdown
<!-- _class: content-slide -->

## Slide Title

Body text explaining the main point.

- Key point 1
- Key point 2
- Key point 3
```

---

## 4. two-column

2カラム分割レイアウト。比較や並列情報の表示に使用。

CSSクラス: `.two-column`, `.col`

### Template

```markdown
<!-- _class: two-column -->

## Slide Title

<div class="col">

### Left Column

- Item A
- Item B

</div>
<div class="col">

### Right Column

- Item C
- Item D

</div>
```

---

## 5. image-slide

背景画像＋オーバーレイテキスト。ビジュアルインパクトのあるスライドに。

CSSクラス: `.image-slide`

### Template

```markdown
<!-- _class: image-slide -->
![bg](https://example.com/image.jpg)

# Visual Title

Description overlaid on the image
```
