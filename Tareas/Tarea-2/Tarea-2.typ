#import "../config.typ": template

#show: doc => template([Tarea 2], doc)

La meta de esta tarea es explorar otro clasificador: _El clasificador por regresión logística_.
La regresión logística se trata de regresar  una función de probabilidad de pertenencia condicional
$p_i (x) = PP(Y = i | X =x)$ de la forma: $ p_i (x) approx sigma(a_i^T x + a_(i, 0)), $
donde $sigma$ es un mapeo continuo y creciente de $RR$ a $[0, 1]$. En general se toma la función sigmoidea
$sigma(t) = 1/(1 + e^(-t))$.

+ Suponiendo que tenemos acceso a las regresiones logísticas $hat(p)_i$ de los $p_i$. Describir el clasificador
  optimo $g$ basado en los $hat(p)_i$.
+ Mostrar que las fronteras entre las diferentes clases son subconjuntos de hiperplanos (Es un clasificador lineal).
+ Usar el script siguiente para cargar los datos de `iris`. 
  ```python 
    from sklearn import datasets
    iris = datasets.load_iris()
    X = iris.data[: , :2]
    Y = iris.target
  ```
+ De la librería `sklearn`, usar las funciones `DecisionBoundaryDisplay` para visualizar las $R_i$ de la 
  clasificación y `LogisticRegression` par definir el modelo por regresión logística.
  ```python
    from sklearn.inspection import DecisionBoundaryDisplay
    from sklearn.linear_model import LogisticRegression
  ```
  Producir un plot que permita visualizar las regiones $R_i$ del clasificador. Superponer los datos de entrenamiento.
+ ¿Cuantos datos están mal clasificados?

*Solución:*
Supongamos que tenemos $k$ clases.
+ Sabemos que el clasificador optimo $g^*$ equivale a encontrar las regiones $R_i^*$.
  Por definición, tenemos que 
  $ R_i^* = {x in RR^p : forall j,  hat(p)_i (x) >= hat(p)_j (x)}. $
+ Recordemos que las fronteras están dadas por la intersección de dos regiones. Por definición la 
  intersección se da en la igualdad. Entonces dados $i, j$ distintos, su frontera esta dada por: 
  $ R_i^* sect R_j^* &= {x in RR^p : hat(p)_i (x)  = hat(p)_j (x)} \
                     &= { x in RR^p : sigma(a_i^T x + a_(i, 0)) = sigma(a_j^T x + a_(j, 0))}, $
  dado que  $sigma$ es creciente y continua es una biyección, por lo cual si 
  $ sigma(a_i^T x + a_(i, 0)) = sigma(a_j^T x + a_(j, 0)), $  se sigue que $a_i^T x + a_(i, 0) = a_j^T x + a_(j, 0)$, lo 
  cual se puede reescribir como $ (a_i - a_j)^T x + (a_(i, 0) - a_(j, 0)) = 0, $ el cual es un pedazo de hiperplano.
  Por lo tanto $ R_i^* sect R_j^* = {x in RR^p : (a_i - a_j)^T x + (a_(i, 0) - a_(j, 0)) = 0}, $
  como queremos.
+ Ver el código adjunto. #footnote[Créditos parciales a #link("https://chatgpt.com/")[ChatGPT].]
+
+ Del Notebook podemos ver que clasifico mal $25$ datos.
