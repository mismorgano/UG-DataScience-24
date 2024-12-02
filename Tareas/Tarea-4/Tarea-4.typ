#import "../config.typ": template,

#import "@preview/ctheorems:1.1.3": *

#let exercise = thmbox("exercise", "Problema", base_level: 0, stroke: 1pt)
#let solution = thmplain("solution", "Solución").with(numbering: none)
#show: doc => template([Tarea 4], doc)
#show: thmrules.with(qed-symbol: $square$)



#exercise[
  Retomamos el conjunto de datos de Iris que podemos llamar gracias a la función `load_iris` del paquete `sklearn.datasets`.
  En estudios de datos anteriores vimos que las dos variables `petal length` y  `petal width` son muy correlaciones 
  con la categoría de las plantas.
  + Usando los datos bidimensionales correspondientes a `petal length` y `petal width` de cada planta, 
    observar el resultado del _clustering_ $k$-medias de los datos con $2, 3$ y $4$ clases.
    Se usara la función `KMeans` de `sklearn.cluster`.
  + Escribir una función ```python Riesgo(X, y, C)``` que toma los datos $X$, las categorías correspondientes $y$ y los centroidess $C$ y que 
    responde el valor de la función $G$ (definida en el curso).
  + Gráfica el resultado de ``` Riesgo``` para $k$ que varia entre $2$ y $10$.
  + Para elegir el mejor $k$ una técnica famosa es la *Elbow Method*. Hacer una búsqueda de referencias que explican la técnica. 
    Implementar la técnica para la gráfica del inciso anterior.
]

*Solución:*

Para los primeros tres incisos ver el código adjunto.

#enum.item(4)[
  El *Elbow Method* es una heurística usada en _clustering_ para determinar el numero de clusters en un conjunto de datos.
  La idea es muy sencilla, dada una medición en función del numero de clusters (error, precisión, etc) la podemos graficar
  y entonces el codo de la gráfica  nos dirá el numero de clusters, pues un numero mayor de clusters no mejora substancialmente 
  el modelo.

  También lo podemos interpretar desde e punto de vista del calculo como un "estancamiento" en la pendiente de la grafica, 
  lo cual nos dice que su razón de cambio es poca.
  #footnote()[La implementación esta en el código adjunto.]
]

