#import "@preview/transl:0.2.0": transl

#let _title(title) = {
  align(center + horizon)[
    #text(size: 17pt, weight: "bold")[#title]
  ]
}

#let _author(name, formation, year, mail) = {
  align(center)[
    #name \
    #emph(formation) \
    #year \
    #link("mailto:" + mail)
  ]
}

#let _company(logo) = {
  if logo != none {
    align(center)[
      #logo  
    ]
    v(2.5em)  
  }
}

#let _supervisor(name, role, company, mail) = {
  align(center)[
    #name \
    #emph(role) \
    #company \
    #link("mailto:" + mail)
  ]
}

#let _supervisors(supervisors) = {
  align(center)[
    #line(length: 60%)
    #v(0.3em)
    #text(size: 12pt, weight: "bold")[#transl("Supervisors")]
    #v(0.3em)
    #grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      ..supervisors.map(s => _supervisor(..s))
    )
  ]
}

#let _university_logo(logo) = {
  align(center)[
    #image(logo)  
  ]
}

#let _title_page(title, author, company-logo, supervisors) = {
  align(center + horizon)[
    #_title(title)
    #_author(..author)
  ]

 
  place(bottom + center, float: true)[
    #_company(company-logo)
    #_supervisors(supervisors)
    #_university_logo("assets/fst-ulille.png")
  ]
}

#let _acknowledgments_page(acknowledgments) = {
  align(left)[
    = #transl("Acknowledgments")
    #acknowledgments
  ]
}

#let report(
  lang: "en",
  title: "",
  author: (),
  company-logo: none,
  supervisors: (),
  acknowledgments: none,
  body
) = {
  set text(lang: lang)
  set page(paper: "a4")

  transl(data: toml("lang.toml"))

  _title_page(title, author, company-logo, supervisors)

  pagebreak(weak: false)
  pagebreak(weak: false)

  if acknowledgments != none {
    _acknowledgments_page(acknowledgments)
    pagebreak(weak: false)
  }

  outline(
    title: transl("Table-of-contents"),
    depth: 3,
    indent: auto,
  )

  pagebreak(weak: false)

  body
}
