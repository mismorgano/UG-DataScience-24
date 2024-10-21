#import "../config.typ": template,

#import "@preview/ctheorems:1.1.2": *
#show: thmrules.with(qed-symbol: $square$)

#let exercise = thmbox("exercise", "Problema", base_level: 0, stroke: 1pt)
#let solution = thmplain("solution", "Solución").with(numbering: none)
#show: doc => template([Tarea 1], doc)

#exercise[
  Sea $A = a b^T$ tal que $a, b$ son vectores $n$-dimesionales.
  + Dar una descomposición SVD de esa matriz en la forma $A = U D V^T$ y en la forma $A = sum lambda_i u_i u_i^T$. 
    Se expresara los $lambda_i$ en función de $a$ y $b$.
  + En estas dos mismas formas dar la descomposición de la matriz $A^2 - A$.
  + Mostrar que cuando $angle.l a, b angle.r = 1$, 
    $A$ es una matriz de proyección sobre un espacio que se describirá.
]

#exercise[
  Sea $A$ una matriz de $n times m$ de rango $r$. Consideremos su descomposición SVD, $A = U D V^T$ con  
  $ D = mat(Lambda, 0 ; 
               0, Lambda) $
  y $Lambda$ es una matriz diagonal de valores propios positivos.
  Definamos $A^- = V D^- U^T$, donde 
  $ D^- = mat(Lambda^(-1), 0 ;
              0, 0). $
  + Mostrar que $A^-$ es tal que $A A^- = A$ y $A^- A A^- = A^-$ y que las matrices $AA^-$ y $A^-A$ son simétricas.
  + Para un $b in RR^m$, consideremos el problema de regresión lineal siguiente
    $ arg min norm(A x - b)^2 $
    donde $norm(dot)$ es la norma euclidiana.
    Supongamos que no existe un $x in RR^n$ tal que $A x = b$.
    Mostrar que el problema se resuelve con la solución: $x* = A^- b$ (Hint: Usar la descomposición $x = x* + h$ y descomponer $norm(A x - b)^2$)
]
