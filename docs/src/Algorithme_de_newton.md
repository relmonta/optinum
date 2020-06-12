# Algorithme de Newton local

<<<<<<< HEAD
# Principe

``\hspace*{0.7}`` La fonction ``f`` étant ``C^{2}`` , on peut remplacer ``f`` au voisinage de l’itéré courant ``x_{k} par son développement de Taylor au second ordre, soit :

``\hspace*{0.7} f(y) \sim q(y)=f\left(x_{k}\right)+\nabla f\left(x_{k}\right)^{T}\left(y-x_{k}\right)+\frac{1}{2}\left(y-x_{k}\right)^{T} \nabla^{2} f\left(x_{k}\right)\left(y-x_{k}\right)\\ ``
On choisit alors comme point ``x_{k+1}`` le minimum de la quadratique q lorsqu’il existe et
est unique, ce qui n’est le cas que si ``\nabla^{2} f (x)`` est définie positive. Or le minimum de q est
réalisé par x k+1 solution de : ``\nabla^{2} f (x_{k+1}) = 0``, soit :
``\hspace*{1.7} \nabla f\left(x_{k}\right)+\nabla^{2} f\left(x_{k}\right)\left(x_{k+1}-x_{k}\right)=0 \\``
ou encore, en supposant que ``\nabla^{2} f (x_{k})``est définie positive :

``\hspace*{1.7} x_{k+1}=x_{k}-\nabla^{2} f\left(x_{k}\right)^{-1} \nabla f\left(x_{k}\right).\\``
``\hspace*{0.7}``La méthode ne doit cependant jamais être appliquée en utilisant une inversion de la
matrice Hessienne (qui peut être de très grande taille et mal conditionnée), mais plutôt en utilisant :

``\hspace*{1.7} x_{k+1}=x_{k}+d_{k},\\``
où ``d_{k}`` est l’unique solution du système linéaire

``\hspace*{1.7} \nabla^{2} f\left(x_{k}\right) d_{k}=-\nabla f\left(x_{k}\right), \\``
``d_{k}`` étant appelée direction de Newton.
``\hspace*{0.7}`` Cette méthode est bien définie si à chaque itération, la matrice hessienne ``\nabla^{2} f (x_{k})`` est
définie positive : ceci est vrai en particulier au voisinage de la solution`` x_{k}`` cherchée si on
suppose que ``\nabla^{2} f (x_{*})`` est définie positive (par continuité de ``\nabla^{2} f ``).

# Algorithme

# Données:

f , ``x_{0}`` première approximation de la solution cherchée, ``\epsilon > 0`` précision demandée.

# Sorties

une approximation de la solution du problème ``\min _{x \in \mathbb{R}^{m}} f(x)``.

# 1.Tant que le test de convergence est non satisfait 
  a. Calculer d k solution du système : ``\nabla^{2} f (x_{k}) d_{k} = −\nabla f (x_{k})``,
  b. Mise à jour : ``x_{k+1} = x_{k}+ d_{k} , k = k + 1``,
# Retourner ``x_{k}``.




=======
## Principe

La fonction ``f`` étant ![C^{2}](https://render.githubusercontent.com/render/math?math=C%5E%7B2%7D) , on peut remplacer ``f`` au voisinage de l’itéré courant ![x_{k}](https://render.githubusercontent.com/render/math?math=x_%7Bk%7D) par son développement de Taylor au second ordre, soit :

![f(y) \sim q(y)=f\left(x_{k}\right)+\nabla f\left(x_{k}\right)^{T}\left(y-x_{k}\right)+\frac{1}{2}\left(y-x_{k}\right)^{T} \nabla^{2} f\left(x_{k}\right)\left(y-x_{k}\right)](https://render.githubusercontent.com/render/math?math=f(y)%20%5Csim%20q(y)%3Df%5Cleft(x_%7Bk%7D%5Cright)%2B%5Cnabla%20f%5Cleft(x_%7Bk%7D%5Cright)%5E%7BT%7D%5Cleft(y-x_%7Bk%7D%5Cright)%2B%5Cfrac%7B1%7D%7B2%7D%5Cleft(y-x_%7Bk%7D%5Cright)%5E%7BT%7D%20%5Cnabla%5E%7B2%7D%20f%5Cleft(x_%7Bk%7D%5Cright)%5Cleft(y-x_%7Bk%7D%5Cright))

On choisit alors comme point ![x_{k+1}](https://render.githubusercontent.com/render/math?math=x_%7Bk%2B1%7D) le minimum de la quadratique q lorsqu’il existe et
est unique, ce qui n’est le cas que si ![\nabla^{2} f (x)](https://render.githubusercontent.com/render/math?math=%5Cnabla%5E%7B2%7D%20f%20(x)) est définie positive. Or le minimum de q est
réalisé par ![x_{k+1}](https://render.githubusercontent.com/render/math?math=x_%7Bk%2B1%7D) solution de : ![\nabla^{2} f (x_{k+1}) = 0](https://render.githubusercontent.com/render/math?math=%5Cnabla%5E%7B2%7D%20f%20(x_%7Bk%2B1%7D)%20%3D%200) , soit :
![\nabla f\left(x_{k}\right)+\nabla^{2} f\left(x_{k}\right)\left(x_{k+1}-x_{k}\right)=0 ](https://render.githubusercontent.com/render/math?math=%5Cnabla%20f%5Cleft(x_%7Bk%7D%5Cright)%2B%5Cnabla%5E%7B2%7D%20f%5Cleft(x_%7Bk%7D%5Cright)%5Cleft(x_%7Bk%2B1%7D-x_%7Bk%7D%5Cright)%3D0%20)

ou encore, en supposant que ![\nabla^{2} f (x_{k})](https://render.githubusercontent.com/render/math?math=%5Cnabla%5E%7B2%7D%20f%20(x_%7Bk%7D)) est définie positive :

![x_{k+1}=x_{k}-\nabla^{2} f\left(x_{k}\right)^{-1} \nabla f\left(x_{k}\right)](https://render.githubusercontent.com/render/math?math=x_%7Bk%2B1%7D%3Dx_%7Bk%7D-%5Cnabla%5E%7B2%7D%20f%5Cleft(x_%7Bk%7D%5Cright)%5E%7B-1%7D%20%5Cnabla%20f%5Cleft(x_%7Bk%7D%5Cright))

La méthode ne doit cependant jamais être appliquée en utilisant une inversion de la
matrice Hessienne (qui peut être de très grande taille et mal conditionnée), mais plutôt en utilisant :

   ![x_{k+1}=x_{k}+d_{k}](https://render.githubusercontent.com/render/math?math=x_%7Bk%2B1%7D%3Dx_%7Bk%7D%2Bd_%7Bk%7D)
où ![d_{k}](https://render.githubusercontent.com/render/math?math=d_%7Bk%7D) est l’unique solution du système linéaire :

   ![\nabla^{2} f\left(x_{k}\right) d_{k}=-\nabla f\left(x_{k}\right)](https://render.githubusercontent.com/render/math?math=%5Cnabla%5E%7B2%7D%20f%5Cleft(x_%7Bk%7D%5Cright)%20d_%7Bk%7D%3D-%5Cnabla%20f%5Cleft(x_%7Bk%7D%5Cright)) ,
![d_{k}](https://render.githubusercontent.com/render/math?math=d_%7Bk%7D)
étant appelée direction de Newton.

Cette méthode est bien définie si à chaque itération, la matrice hessienne ![\nabla^{2} f (x_{k})](https://render.githubusercontent.com/render/math?math=%5Cnabla%5E%7B2%7D%20f%20(x_%7Bk%7D)) est
définie positive : ceci est vrai en particulier au voisinage de la solution ![x_{k}](https://render.githubusercontent.com/render/math?math=x_%7Bk%7D) cherchée si on
suppose que ![\nabla^{2} f (x_{*})](https://render.githubusercontent.com/render/math?math=%5Cnabla%5E%7B2%7D%20f%20(x_%7B*%7D)) 
est définie positive (par continuité de ![\nabla^{2} f](https://render.githubusercontent.com/render/math?math=%5Cnabla%5E%7B2%7D%20f)).

## Algorithme

###### Données:

f , ![x_{0}](https://render.githubusercontent.com/render/math?math=x_%7B0%7D) première approximation de la solution cherchée, ![\epsilon > 0](https://render.githubusercontent.com/render/math?math=%5Cepsilon%20%3E%200) précision demandée.

###### Sorties

une approximation de la solution du problème ![\min _{x \in \mathbb{R}^{m}} f(x)](https://render.githubusercontent.com/render/math?math=%5Cmin%20_%7Bx%20%5Cin%20%5Cmathbb%7BR%7D%5E%7Bm%7D%7D%20f(x)) .

###### 1.Tant que le test de convergence est non satisfait 
  a. Calculer d k solution du système : ![\nabla^{2} f (x_{k}) d_{k} = - \nabla f (x_{k})](https://render.githubusercontent.com/render/math?math=%5Cnabla%5E%7B2%7D%20f%20(x_%7Bk%7D)%20d_%7Bk%7D%20%3D%20-%20%5Cnabla%20f%20(x_%7Bk%7D))
  
  b. Mise à jour : ![x_{k+1} = x_{k}+ d_{k} , k = k + 1](https://render.githubusercontent.com/render/math?math=x_%7Bk%2B1%7D%20%3D%20x_%7Bk%7D%2B%20d_%7Bk%7D%20%2C%20k%20%3D%20k%20%2B%201)
###### 2.Retourner ![x_{k}](https://render.githubusercontent.com/render/math?math=x_%7Bk%7D) .
>>>>>>> 1ed6fad691fbcd515100743f97d4b49761add08a



