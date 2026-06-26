# Zerui Chen — Site Design Language

The fixed design system for zeruic.me. Keep all future pages/components consistent with this.
Source of truth for tokens: `site/styles.css` (`:root` block). This doc is the rationale + rules.

---

## 1. Mood & principles

- **Reference:** NieR: Automata settings UI — "paperback terminal." Desaturated, harmonious, organic, quietly futuristic.
- **Minimal, low-fatigue.** One muted palette at a time + a single accent. Never multiple vibrant colors.
- **Restraint over decoration.** Generous negative space, hairline rules, small mono labels, corner ticks. Every element earns its place; no filler.
- **Motion is sparing.** Hover/focus feedback only. NO entrance or exit animations. Respect `prefers-reduced-motion`.
- **Responsive always.** Must look intentional on both desktop and mobile.
- **No heavy dependencies.** Static HTML + CSS, no JS unless truly required, no large bundles (Google Fonts only).

## 2. Color templates

Two schemes only — **Terminal** (dark, default) and **Rust** (light). Set via `<html data-theme="…">`. Both share the same token structure: `--bg`, `--ink` (primary text), `--sub` (muted text/labels/hairline-ink, ~62% ink), `--line` (hairlines, ~18–22% ink), `--accent`. The light theme sets texture blend to `multiply`; Terminal uses `normal`.

- **Terminal** (default, dark) — bg `#1f211c`, ink `#cfc9b2`, accent `#b98b3e` (amber)
- **Rust** (light) — bg `#ddd5c5`, ink `#413c33`, accent `#a4552f`

**Accent usage:** one word / one element at a time (e.g. *intelligence* in the headline, link hover underline, the editorial rule). Never as a fill or for large areas.

## 3. Typography

- **Display** (`--font-display`) = **Jost**, weight **300**, tight tracking (name `-0.02em`, question `-0.01em`). Used for the name and the big question.
- **Body** (`--font-body`) = Jost 300. Running text, links.
- **Label** (`--font-label`) = **Space Mono**, uppercase, wide tracking (`0.16–0.3em`). All micro-text: eyebrows, index/meta, contact labels, "More — soon".
- **Scale is fluid** (`clamp`), tokenized as `--fs-*`. Don't hardcode sizes — reference tokens. Floor ≈ 10–11px for labels only; body never below ~15px. Text measures, column widths, and per-element spacing are tokens too (`--measure-*`, `--gap*`, `--pad`) — reference them rather than setting widths inline.
- Weights in play: 300 (light, dominant), 400, 500. No bold display text.

## 4. Texture & surface

- Default texture = **scanlines** (`repeating-linear-gradient`, 3px period) at very low opacity (`--tex-op: .05` on Terminal). Fixed full-viewport, `pointer-events:none`, behind content (z-0).
- **Corner ticks** (`.frame`) — 13px L-shaped hairlines in each viewport corner, `--sub` at 50%. A signature element; keep on full-screen views.
- Portrait/empty slots use a faint diagonal hatch placeholder until filled.

## 5. Layout

- Page = full-height flex column: **meta header → hero (flex:1, centered) → footer links**, padding `--pad` (fluid).
- Hero = text column beside the **portrait** (3:4, `--portrait-w`). Constrain prose with `--measure-*` tokens for readable line lengths.
- **Mobile (<820px):** hero stacks `column-reverse` (portrait above, becomes 1:1), padding tightens.
- Links: inline row, hairline underline, mono `↗` arrow; right-aligned mono note.

## 6. Interaction

- **Links:** underline color → `--accent` + `translateY(-2px)` on hover, 0.2s `cubic-bezier(.2,.6,.2,1)`. Contact rows (editorial) shift `translateX(5px)`.
- Hit targets ≥ ~44px on touch.
- That's the entire motion vocabulary. No scroll/reveal/parallax.

## 7. Working files

- `site/index.html` + `site/styles.css` — canonical static build (no JS). Edit tokens in the `:root` block, not inline.
- `Landing Page.dc.html` — the tweakable design-explorer version (palette/typeface/layout/texture knobs) for trying directions.
- When in doubt, copy an existing element's structure rather than introducing new patterns.
