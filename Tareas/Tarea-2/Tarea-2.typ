#import "../config.typ": template

#show: doc => template([Tarea 2], doc)

La meta de esta tarea es explorar otro clasificador: _El clasificador por regresión logística_.
La regresión logística se trata de regresar  una función de probabilidad de pertenencia condicional
$p_i(x) = PP(Y = i | X =x)$ de la forma: $ p_i(x) approx sigma(a_i^T X + a_(i, 0)), $
donde $sigma$ es un mapeo continuo y creciente de $RR$ a $[0, 1]$. En general se toma la función sigmoidea
$sigma(t) = 1/(1 + e^(-t))$.

+ Suponiendo que tenemos acceso a las regresiones logísticas $hat(p)_i$ de los $p_i$. Describir el clasificador
  optimo $g$ basado en los $hat(p)_i$.
+ Mostrar que las fronteras entre las diferentes clases son subconjuntos de hiperplanos (Es un clasificador lineal).
+ Usar el script siguiente para cargar los datos de `iris`. 
  ```python 
    from sklearn import datasets
    iris = datasets . load _ iris ()
    X = iris . data [: , :2]
    Y = iris . target
  ```
+ De la librería `sklearn`, usar las funciones `DecisionBoundaryDisplay` para visualizar las $R_i$ de la 
  clasificación y `LogisticRegression` par definir el modelo por regresión logística.
  ```python
    from sklearn . inspection import DecisionBoundaryDisplay
    from sklearn . linear _ model import LogisticRegression
  ```
  Producir un plot que permita visualizar las regiones $R_i$ del clasificador. Superponer los datos de entrenamiento.
+ ¿Cuantos datos están mal clasificados?