# Zerui Chen — Site Design Language

The fixed design system for zeruic.me. Keep all future pages/components consistent with this.
Source of truth for tokens: `site/styles.css` (`:root` block). This doc is the rationale + rules.

---

## 1. Mood & principles

- **Reference:** NieR: Automata settings UI — "paperback terminal." Desaturated, harmonious, organic, quietly futuristic.
- **Minimal, low-fatigue.** One muted palette at a time + a single accent. Never multiple vibrant colors.
- **Restraint over decoration.** Generous negative space, hairline rules, small mono labels, corner ticks. Every element earns its place; no filler.
- **Motion is sparing.** Hover/focus feedback, plus one small looping affordance (the scroll-cue chevron). NO entrance/exit/scroll-reveal animations. Everything is gated by `prefers-reduced-motion`.
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
- **Scale is fluid** (`clamp`), tokenized as `--fs-*`. Don't hardcode sizes — reference tokens. Preferred values are **`rem + vw`** (not pure `vw`) so text keeps a comfortable floor and doesn't shrink toward the clamp minimum as the viewport narrows. Floor ≈ 10–11px for labels only; body ≈ 15.5px+.
- **Runtime size dials**: `--fs-scale` multiplies the whole system; a per-role multiplier (`--k-name`, `--k-question`, `--k-body`, `--k-project`, `--k-paper`, `--k-note`, `--k-link`, `--k-label`, `--k-langname`) fine-tunes each role. Every `--fs-*` is `calc(base · --fs-scale · --k-role)`, all defaulting to 1. Tune them in the font component (see §8), then bake chosen values into the `:root` defaults.
- Text measures, column widths, and per-element spacing are tokens too (`--measure-*`, `--gap*`, `--pad`) — reference them rather than setting widths inline.
- Weights in play: 300 (light, dominant), 400, 500. No bold display text. Jost is loaded **variable** (`wght@300..500`) so intermediate weights work.
- **Per-scheme readability:** 300-weight prose reads thin, so running copy (`.bio`, `.section__intro`, `.project__desc`, `.lang__note`, `.paper__title`, abstract) is nudged up by theme — **400** in Rust (light), a gentler **350** in Terminal (dark); large display type (name, question) stays 300. Monospace micro-labels can't take an intermediate weight (Space Mono is 400/700 only), so they use a higher-contrast `--label` colour instead of a heavier weight.

## 4. Texture & surface

- Default texture = **scanlines** (`repeating-linear-gradient`, 3px period) at very low opacity (`--tex-op: .05` on Terminal). Fixed full-viewport, `pointer-events:none`, behind content (z-0).
- **Corner ticks** (`.frame`) — 13px L-shaped hairlines, `--sub` at 50%. Absolutely positioned on `body` so they bracket the **whole document** and scroll with it (not viewport-fixed). A signature element; keep them.
- Portrait/empty slots use a faint diagonal hatch placeholder until filled.

## 5. Layout

- **Hero screen** = full-height flex column: **meta header → hero (flex:1, centered) → footer**, padding `--pad` (fluid).
- Hero = text column beside the **portrait** (3:4, `--portrait-w`). Constrain prose with `--measure-*` tokens for readable line lengths.
- **Meta header:** signature far-left (`.meta__sig`), then a right group (`.meta__right`) holding section nav + the theme toggle.
- **Content sections** stack below the hero screen in a centered column (`.sections__inner`, `--measure-sections`, gap `--gap-section`). Each section is a numbered head + intro + body; anchor via `id`.
- **Mobile (<820px):** hero stacks `column-reverse` (portrait above, becomes 1:1), padding tightens.
- Links: inline row, hairline underline, mono `↗` arrow.

## 6. Interaction

**One standardised link feel** (all timing `--dur`/`--ease`). Two variants only:
- **Standalone link** — `.link`, `.nav__link`, `.project__title`, `.paper__link`: persistent hairline underline that turns `--accent` **and lifts `translateY(-2px)`** on hover. Use for any link that stands on its own (nav, profile row, titles, CTAs).
- **Inline link** — `.ilink`: same underline → `--accent`, **no lift** (it sits inside running text, so it must not jump).
- **Theme toggle** (`.theme-toggle`): a 15px half-filled dot; border → `--accent` and a 180° rotate on hover.
- **Scroll cue** (`.scroll-cue`): mono label + chevron that gently bobs (`@keyframes zc-bob`) to signal content below; lives in the hero footer.
- **Non-interactive elements never animate** — no hover transform on cards/containers. Motion is reserved for things you can click.
- Hit targets ≥ ~44px on touch. Respect `prefers-reduced-motion` (transitions off, bob off, no lift). No scroll-reveal / parallax / entrance animations.

## 7. Content rules

- Identity: **Zerui Chen**, framed as deep-learning *theory* ("theory first, validated by experiment"). Interests: ML/AI broadly → frontier architectures, LLMs/multimodal.
- Anchor line: *"What is intelligence? How do we create it — and is human intelligence the only kind?"* (accent on **intelligence**).
- **Keep non-public projects off the site.** Describe current work only in generic, directional terms.
- Links: GitHub `Zerui18` · LinkedIn `in/zerui-chen-241015204` · Google Scholar (`N3_D8QQAAAAJ`) · `hi@zeruic.me`.
- Front page carries three informal sections — **Research · Projects · Languages** (in that order, numbered 01–03). Keep them snippety and warm; they exist to help people connect, not to be exhaustive.
- Use "More — soon" / a hatch placeholder slot only for genuinely unbuilt items. Don't invent content/stats.

## 8. Working files

- `site/index.html` + `site/styles.css` + `site/assets/` — the build (this is the whole site). Edit tokens in the `:root` block and content in the markup; avoid inline styles.
- **JS is intentionally tiny**, inline in `index.html`: one `<head>` snippet restores the saved theme before paint and exposes `toggleTheme` (`zc-theme` in `localStorage`). No build step, no bundles.
- `Landing Page.dc.html` — **font-tuning component**: renders the real site (shares `site/styles.css`) and exposes one Tweak slider per text role (overall + name/question/body/project/paper/note/link/label/langname) wired to `--fs-scale` and the `--k-*` multipliers. It's a tuning sandbox — dial sizes, then copy the values into the `:root` defaults in `styles.css`. (Not deployed; the static `site/` is.)
- Language glyphs come from the **devicon** webfont (CDN `<link>`); use the `-plain` (or `-original`) class so the glyph inherits `currentColor` and stays monochrome. Never hand-draw logos.
- When in doubt, copy an existing element's structure rather than introducing new patterns.

## 9. Reusable patterns

- **Section header** — `.section__head`: mono `NN — Title` label (`--accent`) + a hairline `.section__rule` that fills the row; a `.section__intro` line under it.
- **List row + hairline** — languages and projects are hairline-separated rows (`border-top`/`border-bottom: var(--line)`), not boxed cards.
- **Placeholder slot** — empty/unfilled content uses the 135° diagonal-hatch fill (`.paper__abstract`, portrait) with a mono caption, until real content lands.
- **Signature mark** — `.meta__sig` carries the given name 泽瑞 as a quiet identity marker (no uppercase; CJK falls back gracefully).
- **Text-size control** — fine-grained font sizing is a **Tweak** in `Landing Page.dc.html` (one slider per text role), not on-page UI; it drives `--fs-scale` / `--k-*`.
