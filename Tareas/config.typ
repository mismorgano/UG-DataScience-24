
// #import "@preview/ctheorems:1.1.3": *
// #show: thmrules.with(qed-symbol: $square$)

// #let exercise = thmbox("exercise", "Problema", base_level: 0, stroke: 1pt)
// #let solution = thmplain("solution", "Solución").with(numbering: none)

// #set text(font: "New Computer Modern", size: 12pt)
// #set enum(numbering: "(a)")
// #set par(justify: true)

// // // header

// #set page(header: [
//   _Introducción a ciencia de datos_ #h(1fr) Maestría 2024
//   #line(start: (0pt, -0.8em), length: 100%)
// ])
// #set par(justify: true)
#let template(title, doc) = {
  set text(font: "New Computer Modern", size: 12pt)
  set enum(numbering: "(a)")
  set par(justify: true)
  // header
  
  set page(header: [
    _Introducción a ciencia de datos_ #h(1fr)
    Maestría 2024
    #line(start: (0pt, -0.8em), length: 100%)
  ])

  set page(numbering: "1/1")
  
  // Title 

   align(center)[
    #text(19pt)[#title]
    #text(12pt)[
      #grid(
        columns: (1fr, 1fr),
        align(center)[
          Emilien Joly \
          #link("mailto:emilien.joly@cimat.mx")
        ],
        align(center)[
          Antonio Barragán Romero. \ 
          #link("mailto:antonio.barragan@cimat.mx")
        ]
      )
    ]

  ]


  doc
}
