#import "../config.typ": template

#import "@preview/ctheorems:1.1.3": *
#show: thmrules.with(qed-symbol: $square$)

#let exercise = thmbox("exercise", "Problema", base_level: 0, stroke: 1pt)
#let solution = thmplain("solution", "Solución").with(numbering: none)
#show: doc => template([Tarea 3], doc)

#exercise[
  Sea $A = a b^T$ tal que $a, b$ son vectores $n$-dimensionales.
  + Dar una descomposición SVD de esa matriz en la forma $A = U D V^T$ y en la forma $A = sum lambda_i u_i v_i^T$.
    Se expresara los $lambda_i$ en función de $a$ y $b$.
  + En estas dos mismas formas dar la descomposición de la matriz $A^2 - A$.
  + Mostrar que cuando $angle.l a, b angle.r = 1$,
    $A$ es una matriz de proyección sobre un espacio que se describirá.
]
#solution[

  + Podemos notar que $A$ es de rango $1$, pues sus columnas son un múltiplo de $a$, por lo cual solo tiene un valor singular.
    Notemos que $ A^T A = (a b^T)^T (a b^T) = b a^T a b^T =b norm(a)^2 b^T = norm(a)^2 b b^T, $
    por lo cual si $lambda$ es un valor propio asociado al vector propio $v$ se debe cumplir que
    $ A^T A v = norm(a)^2 b b^T v = norm(a)^2 (b^T v) b = lambda v, $
    para que esta ultima igualdad pase se debe cumplir que $v$ tenga la misma dirección que $b$, sin perdida de
    generalidad sea $v = b$, entonces $ norm(a)^2 norm(b)^2 b = lambda b$, de donde se puede ver que $lambda = norm(a)^2 norm(b)^2$.
    De lo anterior tenemos que el único valor singular de $A$ es $sigma_1 =sqrt(lambda) = norm(a)norm(b)$, luego $v_1  = b /norm(b)$
    es su único vector singular derecho y por tanto $ A b/norm(b) = a (b^T b)/norm(b) = sigma_1 u_1 = norm(a)norm(b)u_1,   $
    implica que $u_1 = a /norm(a)$ es su único valor singular izquierdo.
    Entonces tenemos que $ A = lambda_1 u_1 v_1^T = norm(a)norm(b) a/norm(a) b^T /norm(b). $
    Por otro lado para obtener $U, V$ simplemente completamos con un proceso de Gram-Schmidt y tenemos que
    $
      A = U D V^T = mat(;a/norm(a), u_2, dots.c , u_n; ;) mat(norm(a)norm(b), dots.c ,0; dots.v , dots.down; 0,dots.c ,0; ) mat(;b/norm(b), v_2, dots.c, v_n; ;)^T.
    $
  + De manera similar notemos que
    $
      A^2 -A &= (a b^T)(a b^T) -a b^T = a (b^T a) b^T - a b^T = (b^T a) a b^T - a b^T \
      &= (b^T a -1) a b^T = (b^T a -1) A,
    $
    de donde se puede ver que $A^2 - A$ es un múltiplo de $A$ por lo cual descomposición SVD es similar la de $A$, pero
    con el valor singular escalado por $b^T a -1$, por lo cual obtenemos que
    $ A^2 -A = (b^T a -1) norm(a)norm(b) a / norm(a) b^T / norm(b), $
    y
    $
      A^2 - A &= U D V^T \
      &= mat(;a/norm(a), u_2, dots.c , u_n; ;) mat((b^T a -1)norm(a)norm(b), dots.c ,0; dots.v , dots.down; 0,dots.c ,0; ) mat(;b/norm(b), v_2, dots.c, v_n; ;)^T.
    $
  + Si $angle.l a, b angle.r = 1$ entonces se cumple que $b^T a - 1= 0$, luego, del inciso anterior tenemos que $A^2 -A = 0$
    por lo cual $A^2 = A$, es decir, $A$ es una matriz de proyección.
    Mas aun notemos que dado $x in RR^n$ tenemos que $A x = a b^T x = a(b^T x)$, por lo cual $A$ es una matriz de proyección sobre
    sobre $op("span")(a)$.
]

#exercise[
  Sea $A$ una matriz de $n times m$ de rango $r$. Consideremos su descomposición SVD, $A = U D V^T$ con
  $ D = mat(Lambda, 0 ;
               0, 0) $
  y $Lambda$ es una matriz diagonal de valores propios positivos.
  Definamos $A^- = V D^- U^T$, donde
  $ D^- = mat(Lambda^(-1), 0 ;
              0, 0). $
  + Mostrar que $A^-$ es tal que $A A^- A = A$ y $A^- A A^- = A^-$ y que las matrices $AA^-$ y $A^-A$ son simétricas.
  + Para un $b in RR^m$, consideremos el problema de regresión lineal siguiente
    $ op(arg min, limits: #true)_(x in RR^n) norm(A x - b)^2 $
    donde $norm(dot)$ es la norma euclidiana.
    Supongamos que no existe un $x in RR^n$ tal que $A x = b$.
    Mostrar que el problema se resuelve con la solución: $x^* = A^- b$ (Hint: Usar la descomposición $x = x^* + h$ y descomponer $norm(A x - b)^2$)
]

#solution[
  + Simplemente recodemos que $U$ y $V$ son unitarias y reales por lo cual $U U^T = U^T U = I_(n)$
    ademas $V V^T = V^T V = I_(m)$ y notemos que
    $
      A A^- A &= (U D V^T) (V D^- U^T) (U D V^T) = U D (V^T V) D^- (U^T U) D V^T \
      &= U D I_(m) D^- I_(n) D V^T \
      &= U D D^- D V^T\
      &= U mat(Lambda, 0; 0, 0) mat(Lambda^(-1), 0; 0, 0) mat(Lambda, 0; 0, 0) V^T \
      &= U mat(I_(r), 0; 0, 0) mat(Lambda, 0; 0, 0) V^T \
      &= U mat(Lambda, 0; 0, 0) V^T \
      &= U D V^T \
      &= A.
    $
    De manera similar, notemos que
    $
      A^- A A^- &= (V D^- U^T)(U D V^T)(V D^- U^T) = V D^- (U^T U) D (V^T V)D^- U^T \
      &= V D^- (D D^-) U^T \
      &= V D^- U^T\
      &= A^-.
    $

    Ahora notemos que
    $
      (A A^-)^T &= A^-^T A^T = (V D^- U^T)^T (U D V^T)^T = (U D^-^T V^T) (V D^T U^T ) \
      &= U D^-^T D^T U^T \
      &= U mat((Lambda^(-1)) ^T, 0; 0, 0) mat(Lambda^T, 0; 0, 0) U^T \
      &= U mat(I_(r), 0; 0, 0) U^T \
      &= U mat(Lambda, 0; 0, 0) mat(Lambda^(-1), 0; 0, 0) U^T \
      &= (U D V^T) (V D^- U^T)\
      &= A A^-,
    $
    por lo cual $A A^-$ es simétrica. De manera similar obtenemos que
    $
      (A^- A)^T &= A^T A^-^T = (U D V^T)^T (V D^- U^T)^T = (V D^T U^T) (U D^-^T V^T) \
      &= V D^T D^-T V^T \
      &= V (D^- D)^T V^T \
      &= V D^- D V^T \
      &= (V D^- U^T) (U D V^T) \
      &= A^- A,
    $
    lo anterior implica que $A^- A$ es simétrica.
  + Sea $ x^* = A^- b$ y notemos que $ A x - b = A(x - A^- b) + (A A^-b -b), $
    mas aun, podemos ver que $ A(x - A^- b), (A A^-b -b)$ son ortogonales, en efecto, usando el inciso anterior tenemos que
    $  A(x - A^- b)^T (A A^-b -b) &= (A x - A A^- b)^T (A A^- b - b)  \
                                    &= (x^T A^T - b^T A A^-) (A A^- b - b ) \
                                    &= x^T A^T A A^- b - x^T A^T b -b^T A A^- A A^- b + b^T A A^- b \
                                    &= x^T A^T (A A^-)^T b - x^T A^T b -b^T (A A^- A) A^- b + b^T A A^- b\
                                    &= x^T (A A^- A)^T b - x^T A^T b -b^T A A^- b + b^T A A^- b\ 
                                    &= x^T A^T b - x^T A^T b\
                                    &= 0. $
    Por lo anterior se cumple que 
    $ norm(A x - b)^2&= norm(A(x - A^- b))^2 + norm(A A^-b -b)^2 \ 
                    &= norm(A (x - x^*))^2 + norm(A x^*  - b)^2 \
                    &>=norm(A x^*  - b)^2, $                    
    y es claro que $ x^* = A^- b = op(arg min, limits: #true)_(x in RR^n) norm(A x - b)^2, $                
    como queremos.
]
