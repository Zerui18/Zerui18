// Zerui Chen — resume layout. Content lives in content.yaml.
// Build:  typst compile --input variant=research resume.typ out/zerui-chen-research.pdf
//         typst compile --input variant=quant    resume.typ out/zerui-chen-quant.pdf

#let variant = sys.inputs.at("variant", default: "research")
#let data = yaml("content.yaml")

// ---- page & type (matches the Pages original: A4, Times, 1 cm side margins) ----
#set page(paper: "a4", margin: (left: 1cm, right: 0.9cm, top: 0.45cm, bottom: 0.6cm))
#set text(font: ("Times New Roman", "Liberation Serif"), size: 11pt, lang: "en")

// ---- vertical rhythm (tune these to fill the page) ----
#let leading = 0.55em      // between wrapped lines of one paragraph / bullet
#let bullet-gap = 0.5em    // between bullets
#let entry-gap = 1.1em     // above each entry header
#let heading-gap = 0.8em   // above each section heading
#let rule-gap = 0.55em     // below the heading rule

#set par(leading: leading, spacing: 0.45em, justify: false)
#show link: it => underline(text(fill: black, it))   // links are black and underlined, as in the Pages original
#let cjk(body) = text(font: ("STSongti-SC-Regular", "Songti SC", "Noto Serif CJK SC", "Noto Sans CJK SC"), body)

// ---- helpers ----
#let m(s) = eval(s, mode: "markup")            // YAML string -> Typst markup
#let on(item) = {                                // is this item in the current variant?
  if type(item) == dictionary and "variants" in item { variant in item.variants } else { true }
}
#let heading-rule(title) = {
  v(heading-gap)
  block(below: rule-gap)[
    #text(size: 14pt, weight: "bold", title)
    #v(0.05em)
    #line(length: 100%, stroke: 0.6pt)
  ]
}
#let bullets(items) = {
  let shown = items.filter(on)
  if shown.len() > 0 {
    set list(marker: [•], indent: 0.15em, body-indent: 0.5em, spacing: bullet-gap)
    list(..shown.map(b => m(b.text)))
  }
}
#let entry(e) = {
  let head = if "authors" in e {
    [#text(weight: "bold", m(e.org))]
  } else {
    [#text(weight: "bold", m(e.org)) | #m(e.role) | #emph(m(e.location))]
  }
  block(above: entry-gap, below: 0.4em)[
    #grid(columns: (1fr, auto), column-gutter: 1em, align: (left, right),
      head, [#text(weight: "bold", m(e.dates))],
    )
    #if "authors" in e [
      #v(0.15em) #m(e.authors) #if "venue" in e [ #h(0.4em)|#h(0.4em) #emph(m(e.venue)) ]
    ]
  ]
  if "lines" in e { for l in e.lines { par(m(l)) } }
  if "bullets" in e { bullets(e.bullets) }
}
#let section(key) = {
  let s = data.at(key)
  heading-rule(s.title)
  if "entries" in s { for e in s.entries.filter(on) { entry(e) } }
  if "bullets" in s { bullets(s.bullets) }
}

// ---- header ----
#align(center)[
  #block(below: 0.7em)[#text(size: 30pt, data.name) #text(size: 30pt)[ | ] #text(size: 26pt, cjk(data.name_zh))]
  #block(below: 0.25em)[#text(size: 11pt, data.contact.map(c => link(c.url, c.text)).join(" | "))]
  #text(size: 11pt, style: "italic", data.availability.at(variant))
]

// ---- body ----
#for key in data.order.at(variant) { section(key) }
