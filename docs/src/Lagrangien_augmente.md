# Principe

La méthode du lagrangien augmenté appartient à une classe d'algorithme qui
permettent la résolution des problèmes avec contraintes.Elle s'apparente aux méthodes de
pénalisation, dans lesquelles on résout le problème avec contraintes à travers une suite de
problèmes sans contraintes.

#  Algorithme du Lagrangien augmenté pour contraintes d'égalité

  On s'intéresse ici au cas où l'ensemble C est défini par un ensemble des contraintes d'égalités.
  Le problème se met ainsi sous la forme :
  
  ![\min _{x \in \mathbb{R}^{n}} f(x)](https://render.githubusercontent.com/render/math?math=%5Cmin%20_%7Bx%20%5Cin%20%5Cmathbb%7BR%7D%5E%7Bn%7D%7D%20f(x))   ;   ![c(x)=0](https://render.githubusercontent.com/render/math?math=c(x)%3D0)
  
où ![c : \mathbb{R}^{n} \rightarrow  \mathbb{R}^{m}](https://render.githubusercontent.com/render/math?math=c%20%3A%20%5Cmathbb%7BR%7D%5E%7Bn%7D%20%5Crightarrow%20%20%5Cmathbb%7BR%7D%5E%7Bm%7D) . L'algorithme suivant est obtenu de  Bierlaire, *Introduction à l'optimisation différentiable*.
  
 
### Données : 
![\mu_{0} > 0, \tau > 0, \hat{\eta}_{0}=0.1258925 ,  \alpha=0.1, \beta=0.9, \epsilon_{0}=1 ,  \mu_{0}, \eta_{0}=\hat{\eta}_{0} / \mu_{0}^{\alpha}](https://render.githubusercontent.com/render/math?math=%5Cmu_%7B0%7D%20%3E%200%2C%20%5Ctau%20%3E%200%2C%20%5Chat%7B%5Ceta%7D_%7B0%7D%3D0.1258925%20%2C%20%20%5Calpha%3D0.1%2C%20%5Cbeta%3D0.9%2C%20%5Cepsilon_%7B0%7D%3D1%20%2C%20%20%5Cmu_%7B0%7D%2C%20%5Ceta_%7B0%7D%3D%5Chat%7B%5Ceta%7D_%7B0%7D%20%2F%20%5Cmu_%7B0%7D%5E%7B%5Calpha%7D)  , et un point de départ du Lagrangien ![(x_{0},\lambda_{0})](https://render.githubusercontent.com/render/math?math=(x_%7B0%7D%2C%5Clambda_%7B0%7D)) . On pose ![k = 0](https://render.githubusercontent.com/render/math?math=k%20%3D%200)

### Sorties :
une approximation de la solution du problème avec contraintes.

### 1. Tant qu'il n'y a pas convergence, répéter
   a. Calculer approximation un minimiseur ![x_{k+1}](https://render.githubusercontent.com/render/math?math=x_%7Bk%2B1%7D) du problème sans contraintes suivant :
   
   ![\min _{x \in \mathbb{R}^{n}} L_{A}\left(x, \lambda_{k}, \mu_{k}\right)=f(x)+\lambda_{k}^{T} c(x)+\frac{\mu_{k}}{2}\|c(x)\|^{2}](https://render.githubusercontent.com/render/math?math=%5Cmin%20_%7Bx%20%5Cin%20%5Cmathbb%7BR%7D%5E%7Bn%7D%7D%20L_%7BA%7D%5Cleft(x%2C%20%5Clambda_%7Bk%7D%2C%20%5Cmu_%7Bk%7D%5Cright)%3Df(x)%2B%5Clambda_%7Bk%7D%5E%7BT%7D%20c(x)%2B%5Cfrac%7B%5Cmu_%7Bk%7D%7D%7B2%7D%5C%7Cc(x)%5C%7C%5E%7B2%7D)
   
avec ![x_{k}](https://render.githubusercontent.com/render/math?math=x_%7Bk%7D) comme point de départ ,en terminant lorsque ![\| \nabla_{x} L_{A}\left(x, \lambda_{k}, \mu_{k}\right) \| \leq \epsilon_{k}](https://render.githubusercontent.com/render/math?math=%5C%7C%20%5Cnabla_%7Bx%7D%20L_%7BA%7D%5Cleft(x%2C%20%5Clambda_%7Bk%7D%2C%20%5Cmu_%7Bk%7D%5Cright)%20%5C%7C%20%5Cleq%20%5Cepsilon_%7Bk%7D) .
Si convergence de l'algorithme global, s'arrêter , sinon aller en b

  b. Si ![\|c(x_{k+1})\| \leq \eta_{k}](https://render.githubusercontent.com/render/math?math=%5C%7Cc(x_%7Bk%2B1%7D)%5C%7C%20%5Cleq%20%5Ceta_%7Bk%7D) , mettre à jour (entre autres) les multiplicateurs :
  
 ![\left\{\begin{array}{l}\lambda_{k+1}=\lambda_{k}+\mu_{k} c\left(x_{k+1}\right) \\\mu_{k+1}=\mu_{k} \\\epsilon_{k+1}=\epsilon_{k} / \mu_{k} \\\eta_{k+1}=\eta_{k} / \mu_{k}^{\beta} \\k_{k}=k+1\end{array}\right.](https://render.githubusercontent.com/render/math?math=%5Cleft%5C%7B%5Cbegin%7Barray%7D%7Bl%7D%5Clambda_%7Bk%2B1%7D%3D%5Clambda_%7Bk%7D%2B%5Cmu_%7Bk%7D%20c%5Cleft(x_%7Bk%2B1%7D%5Cright)%20%5C%5C%5Cmu_%7Bk%2B1%7D%3D%5Cmu_%7Bk%7D%20%5C%5C%5Cepsilon_%7Bk%2B1%7D%3D%5Cepsilon_%7Bk%7D%20%2F%20%5Cmu_%7Bk%7D%20%5C%5C%5Ceta_%7Bk%2B1%7D%3D%5Ceta_%7Bk%7D%20%2F%20%5Cmu_%7Bk%7D%5E%7B%5Cbeta%7D%20%5C%5Ck_%7Bk%7D%3Dk%2B1%5Cend%7Barray%7D%5Cright.)
  
  c. Autrement, mettre à jour (entre autres) le paramétre de pénalité :
  
![\left\{\begin{aligned}\lambda_{k+1} &=\lambda_{k} \\\mu_{k+1} &=\tau \mu_{k} \\\epsilon_{k+1} &=\epsilon_{0} / \mu_{k+1} \\\eta_{k+1} &=\hat{\eta}_{0} / \mu_{k+1}^{\alpha} \\k &=k+1\end{aligned}\right.](https://render.githubusercontent.com/render/math?math=%5Cleft%5C%7B%5Cbegin%7Baligned%7D%5Clambda_%7Bk%2B1%7D%20%26%3D%5Clambda_%7Bk%7D%20%5C%5C%5Cmu_%7Bk%2B1%7D%20%26%3D%5Ctau%20%5Cmu_%7Bk%7D%20%5C%5C%5Cepsilon_%7Bk%2B1%7D%20%26%3D%5Cepsilon_%7B0%7D%20%2F%20%5Cmu_%7Bk%2B1%7D%20%5C%5C%5Ceta_%7Bk%2B1%7D%20%26%3D%5Chat%7B%5Ceta%7D_%7B0%7D%20%2F%20%5Cmu_%7Bk%2B1%7D%5E%7B%5Calpha%7D%20%5C%5Ck%20%26%3Dk%2B1%5Cend%7Baligned%7D%5Cright.)
  
### 2. Retourner ![x_{k},\lambda_{k},\mu_{k}](https://render.githubusercontent.com/render/math?math=x_%7Bk%7D%2C%5Clambda_%7Bk%7D%2C%5Cmu_%7Bk%7D) . 
