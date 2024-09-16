#import "../config.typ": template, 
#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)

#let exercise = thmbox("exercise", "Problema", base_level: 0, stroke: 1pt)
#let solution = thmplain("solution", "Solución").with(numbering: none)
#show: doc => template([Tarea 1], doc)

// #import "@preview/ctheorems:1.1.2": *
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

#exercise[
Considere tres poblaciones Poisson, con parámetros $lambda_1 = 10$, $lambda_2 = 15$ y $lambda_3 = 20$ respectivamente.
+ Establezca la regla optima de clasificación, basándose en una sola observación, $x$.
+ Calcule la probabilidad de error asociado a esta regla optima.
+ escriba un programa (`R` o `Python`) para validar, via simulación, el nivel de
  error encontrado en el inciso anterior.
]
#solution[
  Supondremos que las tres poblaciones tienen la misma proporción: $1/3$. Entonces
  tenemos que $pi_1 = pi_2 = pi_3 = 1/3$ y las $f_i 's$ son funciones de masa de
  probabilidad.
  + Recordemos que encontrar la regla optima de clasificación es encontrar $g^*$ y
    esta a su vez es equivalente a encontrar las regiones $R_i^*$ lo cual equivale a
    comparar las $pi_i f_i$
    Dado que las tres poblaciones son Poisson, su soporte es $NN union {0}$. Luego,
    se cumple que 
    $ R_1^* &= {k in NN union {0}: pi_1 f_1(k) >= pi_2 f_2(k) " y " pi_1 f_1(k) >= pi_3 f_3(k)} \
          &= {k in NN union {0}: PP(X_1 =k) >= PP(X_2 =k) " y " PP(X_1 = k) >= PP(X_3=k) } \
          &= {k in NN union {0}: (10^k e^(-10))/k! >= (15^k e^(-15))/k! " y " (10^k e^(-10))/k! >= (20^k e^(-20))/k!} \
          &= {k in NN union {0}: 10^k e^(-10) >= 15^k e^(-15) " y " 10^k e^(-10) >= 20^k e^(-20)} \
          &= {k in NN union {0}: k ln(10) -10 >= k ln(15) - 15 " y " k ln(10) -10 >= k ln(20) -20} \
          &= {k in NN union {0}: 5/(ln(15/10)) >= k " y " 10/(ln(20/10)) >= k } \ 
          &= {k in NN union {0}: k <= min(5/(ln(15/10)), 10/(ln(20/10)))} \
          &= {k in NN union {0}: k <= #calc.floor(calc.min(5 / calc.ln(15 / 10), 10 / calc.ln(20 / 10))) }. $
    De manera similar obtenemos que:
    $ R_2^* = {k in NN union {0}: k>= #calc.ceil(5 / calc.ln(15 / 10)) " y " k <= #calc.floor(5 / calc.ln(20 / 15)) } $
    y que 
    $ R_3^* = {k in NN union {0}: k>= #calc.ceil(calc.max(10 / calc.ln(20 / 10), 5 / calc.ln(20 / 15)))} $
    Por lo cual se cumple que $g^* $ es:
    $ g^*(k) = cases(1 " si " 0 <= k <= 12, 2 " si " 13 <= k <= 17, 3 " si " k >= 18) $
  + Por lo visto en clase tenemos que la probabilidad de error es:
    $ PP(g^*(X) != Y) &= 1 - sum_(i=1)^3 pi_i integral_(R_i^*) f_i(x) d x \ 
                    &= 1 - sum_(i=1)^3 pi_i sum(x in R_i^*) f_i(x) \ 
                    &= 1 - 1/3 (PP(0 <= X_1 <= 12) + PP(13 <= X_2 <= 17) + PP(X_3 >= 18)) \
                    &approx 0.3414081 $
  // + Dado $X = k$ tenemos que 
  //   $ h_(g^*)(k) &= bb(1)_({g^*(k) = 1}) PP(Y=1bar.v X = k) +  \ 
  //                                 & space space space bb(1)_({g^*(k) = 2})PP(Y=2 bar.v X = k) + bb(1)_({g^*(k) = 3})PP(Y=3 bar.v X = k) $ 
  //   y que $ PP(X = k) &= sum_(k=1)^3 pi_i f_i = 1/3(PP(X_1 = k) + PP(X_2 = k) + PP(X_3 = k)) \ 
  //                     &= 1/3( (10^k e^(-10))/k! + (15^k e^(-15))/k! +  (20^k e^(-20))/k!). $ 
  //   Por lo anterior tenemos que la probabilidad de error es:
  //   $ PP(g^*(X) != Y) &= 1 - PP(g^*(X) = Y ) \
  //                     &= 1 - sum_(k=0)^infinity PP(X = k) h_(g^*)(k) \
  //                     &= 1- sum(k=0)^12 1/3( (10^k e^(-10))/k! + (15^k e^(-15))/k! +  (20^k e^(-20))/k!) 
  //                     $
  //   luego solo basta con sumar sobre todos los valores de $x$ para obtener que :
  //   $ PP(g^*(X) != Y) = 1 - sum_(x=0)^infinity  $
]

#exercise[ 
  Descarga la base de datos llamada Wine.
  + Basados en las características químicas de los vinos, construya un clasificador
    para determinar el origen de los mismos.
  + ¿Cuantos vinos están mal clasificados por este clasificador?
]

#solution[
  + En este caso vamos a usar un clasificador ingenuo de Bayes. Vamos a suponer que 
    cada atributo se distribuye normal, por lo cual vamos estimar $mu$ y $sigma$ 
    para cada atributo en todas las clases. #footnote[Ver el código adjunto.]
    Sin embargo, para cada atributo podemos utilizar otra distribución que se adecue 
    mejor a los datos lo caul podría ser muy tedioso si es que se tiene demasiados atributos.
  + Del Notebook podemos ver que que el clasificador clasifico dos datos mal.
]
