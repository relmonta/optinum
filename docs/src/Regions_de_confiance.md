# Région de confiance

  L’introduction d’une région de confiance dans la méthode de Newton permet de garantir
la convergence globale de celle-ci, i.e. la convergence vers un optimum local quel que soit
le point de départ. Cela suppose certaines conditions sur la résolution locale des sous-
problèmes issus de la méthode, qui sont aisément imposables.

## Principe
  L’idée de la méthode des régions de confiance est d’approcher f par une fonction
modèle plus simple ![``m_{k}``](https://render.githubusercontent.com/render/math?math=m_%7Bk%7D) dans une région ![``R_{k}=\left\{x_{k}+s ;\|s\| \leq \Delta_{k}\right\}``](https://render.githubusercontent.com/render/math?math=R_%7Bk%7D%3D%5Cleft%5C%7Bx_%7Bk%7D%2Bs%20%3B%5C%7Cs%5C%7C%20%5Cleq%20%5CDelta_%7Bk%7D%5Cright%5C%7D) pour un ![\Delta_{k}](https://render.githubusercontent.com/render/math?math=%5CDelta_%7Bk%7D) fixé.
Cette région dite “de confiance” doit être suffisament petite pour que

``\hspace*{2.5cm}``![``m_{k}\left(x_{k}+s\right) \sim f\left(x_{k}+s\right)``](https://render.githubusercontent.com/render/math?math=m_%7Bk%7D%5Cleft(x_%7Bk%7D%2Bs%5Cright)%20%5Csim%20f%5Cleft(x_%7Bk%7D%2Bs%5Cright))

   Le principe est que, au lieu de résoudre l’équation : ![``f\left(x_{k+1}\right)=\min _{\|x\| \leq \Delta_{k}} f\left(x_{k}+s\right)``](https://render.githubusercontent.com/render/math?math=f%5Cleft(x_%7Bk%2B1%7D%5Cright)%3D%5Cmin%20_%7B%5C%7Cx%5C%7C%20%5Cleq%20%5CDelta_%7Bk%7D%7D%20f%5Cleft(x_%7Bk%7D%2Bs%5Cright))
on résout :

``\hspace*{2.5cm}``![``m_{k}\left(x_{k+1}\right)=\min _{\|x\| \leq \Delta_{k}} m_{k}\left(x_{k}+s\right)``](https://render.githubusercontent.com/render/math?math=m_%7Bk%7D%5Cleft(x_%7Bk%2B1%7D%5Cright)%3D%5Cmin%20_%7B%5C%7Cx%5C%7C%20%5Cleq%20%5CDelta_%7Bk%7D%7D%20m_%7Bk%7D%5Cleft(x_%7Bk%7D%2Bs%5Cright)) ``\hspace*{2.5cm}``(2.1)

Si la différence entre ``f(x_{k+1})`` et ``m_{k} (x_{k+1} )`` est trop grande, on diminue le ``∆_{k}`` (et
donc la région de confiance) et on résout le modèle (2.1) à nouveau. Un avantage de cette
méthode est que toutes les directions sont prises en compte. Par contre, il faut faire attention
à ne pas trop s’éloigner de ``x_{k}`` ; en général, la fonction ``m_{k}`` n’approche proprement ``f`` que
sur une région proche de ``x_{k}`` .

 Exemple de modèle : l’approximation de Taylor à l’ordre 2 (modèle quadratique) :

``\hspace*{1.5cm}``	![m_{k}\left(x_{k}+s\right)=q_{k}(s)=f\left(x_{k}\right)+g_{k}^{\top} s+\frac{1}{2} s^{\top} H_{k} s](https://render.githubusercontent.com/render/math?math=m_%7Bk%7D%5Cleft(x_%7Bk%7D%2Bs%5Cright)%3Dq_%7Bk%7D(s)%3Df%5Cleft(x_%7Bk%7D%5Cright)%2Bg_%7Bk%7D%5E%7B%5Ctop%7D%20s%2B%5Cfrac%7B1%7D%7B2%7D%20s%5E%7B%5Ctop%7D%20H_%7Bk%7D%20s)  ``\hspace*{1.5cm}``(2.2)

avec ![g_{k}=\nabla f\left(x_{k}\right) \text { et } H_{k}=\nabla^{2} f\left(x_{k}\right)](https://render.githubusercontent.com/render/math?math=g_%7Bk%7D%3D%5Cnabla%20f%5Cleft(x_%7Bk%7D%5Cright)%20%5Ctext%20%7B%20et%20%7D%20H_%7Bk%7D%3D%5Cnabla%5E%7B2%7D%20f%5Cleft(x_%7Bk%7D%5Cright))

## Algorithme

###### Algorithme 2  

*Méthode des régions de confiance (algo général)*     

###### Données:

![\Delta_{\max } > 0, \Delta_{0}  \in(0, \Delta_{\max}), 0 < \gamma_{1} < 1 < \gamma_{2} , 0 < \eta_{1} < \eta_{2} < 1](https://render.githubusercontent.com/render/math?math=%5CDelta_%7B%5Cmax%20%7D%20%3E%200%2C%20%5CDelta_%7B0%7D%20%20%5Cin(0%2C%20%5CDelta_%7B%5Cmax%7D)%2C%200%20%3C%20%5Cgamma_%7B1%7D%20%3C%201%20%3C%20%5Cgamma_%7B2%7D%20%2C%200%20%3C%20%5Ceta_%7B1%7D%20%3C%20%5Ceta_%7B2%7D%20%3C%201)

###### Sorties: 
une approximation de la solution du problème : ![\min _{x \in \mathbb{R}^{n}} f(x) ](https://render.githubusercontent.com/render/math?math=%5Cmin%20_%7Bx%20%5Cin%20%5Cmathbb%7BR%7D%5E%7Bm%7D%7D%20f(x)%20)


###### 1.Tant que le test de convergence est non satisfait:

``\hspace*{1.5cm}`` a.Calculer approximativement ``s_{k}`` solution du sous-problème (2.1);

``\hspace*{1.5cm}`` b.Evaluer ![f\left(x_{k}+s_{k}\right)](https://render.githubusercontent.com/render/math?math=f%5Cleft(x_%7Bk%7D%2Bs_%7Bk%7D%5Cright)) et ![``\rho_{k}=\frac{f\left(x_{k}\right)-f\left(x_{k}+s_{k}\right)}{m_{k}\left(x_{k}\right)-m_{k}\left(x_{k}+s_{k}\right)}``](https://render.githubusercontent.com/render/math?math=%5Crho_%7Bk%7D%3D%5Cfrac%7Bf%5Cleft(x_%7Bk%7D%5Cright)-f%5Cleft(x_%7Bk%7D%2Bs_%7Bk%7D%5Cright)%7D%7Bm_%7Bk%7D%5Cleft(x_%7Bk%7D%5Cright)-m_%7Bk%7D%5Cleft(x_%7Bk%7D%2Bs_%7Bk%7D%5Cright)%7D)

``\hspace*{1.5cm}`` c. Mettre à jour l’itéré courant :

``\hspace*{2.5cm}``   ![x_{k+1}=\left\{\begin{array}{ll} x_{k}+s_{k} & \text { si } \rho_{k} \geq \eta_{1} \\ x_{k} & \text { sinon. } \end{array}\right.](https://render.githubusercontent.com/render/math?math=x_%7Bk%2B1%7D%3D%5Cleft%5C%7B%5Cbegin%7Barray%7D%7Bll%7D%20x_%7Bk%7D%2Bs_%7Bk%7D%20%26%20%5Ctext%20%7B%20si%20%7D%20%5Crho_%7Bk%7D%20%5Cgeq%20%5Ceta_%7B1%7D%20%5C%5C%20x_%7Bk%7D%20%26%20%5Ctext%20%7B%20sinon.%20%7D%20%5Cend%7Barray%7D%5Cright.)

``\hspace*{1.5cm}`` d. Mettre à jour la région de confiance : 

``\hspace*{2.5cm}``    ![\Delta_{k+1}=\left\{\begin{array}{ll}\min \left\{\gamma_{2} \Delta_{k}, \Delta_{\max }\right\} & \operatorname{si} \rho_{k} \geq \eta_{2} \\\Delta_{k} & \operatorname{si} \rho_{k} \in\left\[\eta_{1}, \eta_{2}\right\]. \\\gamma_{1} \Delta_{k} & \text { sinon. }\end{array}\right.](https://render.githubusercontent.com/render/math?math=%5CDelta_%7Bk%2B1%7D%3D%5Cleft%5C%7B%5Cbegin%7Barray%7D%7Bll%7D%5Cmin%20%5Cleft%5C%7B%5Cgamma_%7B2%7D%20%5CDelta_%7Bk%7D%2C%20%5CDelta_%7B%5Cmax%20%7D%5Cright%5C%7D%20%26%20%5Coperatorname%7Bsi%7D%20%5Crho_%7Bk%7D%20%5Cgeq%20%5Ceta_%7B2%7D%20%5C%5C%5CDelta_%7Bk%7D%20%26%20%5Coperatorname%7Bsi%7D%20%5Crho_%7Bk%7D%20%5Cin%5Cleft%5B%5Ceta_%7B1%7D%2C%20%5Ceta_%7B2%7D%5Cright%5D.%20%5C%5C%5Cgamma_%7B1%7D%20%5CDelta_%7Bk%7D%20%26%20%5Ctext%20%7B%20sinon.%20%7D%5Cend%7Barray%7D%5Cright.)



###### 2.Retourner ![x_{k}](https://render.githubusercontent.com/render/math?math=x_%7Bk%7D) .

Cet algorithme  est un cadre générique. On va s’intéresser à deux raffinages possibles de l’étape a.

## Le pas de cauchy 

``\hspace*{0.5cm}``On considère ici le modèle quadratique ![q_{k}(s)](https://render.githubusercontent.com/render/math?math=q_%7Bk%7D(s)). Le sous-problème de régions de confiance correspondant peut se révéler difficile à résoudre (parfois autant que le problème de départ).

Il est donc intéressant de se restreindre à une résolution approchée de ce problème.

``\hspace*{0.5cm}``Le pas de Cauchy appartient à la catégorie des solutions approchées. Il s’agit de se
restreindre au sous-espace engendré par le vecteur ![g_{k}](https://render.githubusercontent.com/render/math?math=g_%7Bk%7D) ; le sous-problème s’écrit alors

``\hspace*{2.5cm}`` ![\left\{\begin{array}{cl} \min & q_{k}(s) \\ s . t . & s=-t g_{k} \\ & t>0 \\ & \|s\| \leq \Delta_{k} \end{array}\right.](https://render.githubusercontent.com/render/math?math=%5Cleft%5C%7B%5Cbegin%7Barray%7D%7Bcl%7D%20%5Cmin%20%26%20q_%7Bk%7D(s)%20%5C%5C%20s%20.%20t%20.%20%26%20s%3D-t%20g_%7Bk%7D%20%5C%5C%20%26%20t%3E0%20%5C%5C%20%26%20%5C%7Cs%5C%7C%20%5Cleq%20%5CDelta_%7Bk%7D%20%5Cend%7Barray%7D%5Cright.) ``\hspace*{1.5cm}``   (2.3)

## Algorithme du Gradient Conjugué Tronqué

On s’intéresse maintenant à la résolution approchée du problème (2.1) à l’itération k de l’algorithme 2 des Régions de Confiance. On considère pour cela l’algorithme du Gradient Conjugué Tronqué (vu en cours), rappelé ci-après :


###### Algorithme 3

*Algorithme du gradient conjugué tronqué*

###### Données:

![\Delta_{k} > 0, x_{k}, g=\nabla f\left(x_{k}\right), H=\nabla^{2} f\left(x_{k}\right)](https://render.githubusercontent.com/render/math?math=%5CDelta_%7Bk%7D%20%3E%200%2C%20x_%7Bk%7D%2C%20g%3D%5Cnabla%20f%5Cleft(x_%7Bk%7D%5Cright)%2C%20H%3D%5Cnabla%5E%7B2%7D%20f%5Cleft(x_%7Bk%7D%5Cright))

###### Sorties:

le pas s qui approche la solution du problème : ![\min_{\|s \| \leq \Delta_{k}} q(s)](https://render.githubusercontent.com/render/math?math=%5Cmin_%7B%5C%7Cs%20%5C%7C%20%5Cleq%20%5CDelta_%7Bk%7D%7D%20q(s))

où ![q(s)=g^{\top} s+\frac{1}{2} s^{\top} H_{k} s](https://render.githubusercontent.com/render/math?math=q(s)%3Dg%5E%7B%5Ctop%7D%20s%2B%5Cfrac%7B1%7D%7B2%7D%20s%5E%7B%5Ctop%7D%20H_%7Bk%7D%20s)

###### Initialisations :

![s_{0}=0, g_{0}=g, p_{0}=-g](https://render.githubusercontent.com/render/math?math=s_%7B0%7D%3D0%2C%20g_%7B0%7D%3Dg%2C%20p_%7B0%7D%3D-g)


**1. Pour** j = 0, 1, 2, . . . , **faire** :

``\hspace*{1.5cm}`` a. ``\hspace*{0.4cm}`` ![\kappa_{j}=p_{j}^{T} H p_{j}](https://render.githubusercontent.com/render/math?math=%5Ckappa_%7Bj%7D%3Dp_%7Bj%7D%5E%7BT%7D%20H%20p_%7Bj%7D)

``\hspace*{1.5cm}`` b.``\hspace*{0.4cm}`` Si ![\kappa_{j} \leq 0](https://render.githubusercontent.com/render/math?math=%5Ckappa_%7Bj%7D%20%5Cleq%200) alors

``\hspace*{2.5cm}`` déterminer ![\sigma_{j}](https://render.githubusercontent.com/render/math?math=%5Csigma_%7Bj%7D) la racine de l’équation ![\left\|s_{j}+\sigma p_{j}\right\|_{2}=\Delta_{k}](https://render.githubusercontent.com/render/math?math=%5Cleft%5C%7Cs_%7Bj%7D%2B%5Csigma%20p_%7Bj%7D%5Cright%5C%7C_%7B2%7D%3D%5CDelta_%7Bk%7D) pour laquelle la valeur de ![q\left(s_{j}+\sigma p_{j}\right)](https://render.githubusercontent.com/render/math?math=q%5Cleft(s_%7Bj%7D%2B%5Csigma%20p_%7Bj%7D%5Cright)) est la plus petite.

``\hspace*{2.5cm}`` Poser ![s=s_{j}+\sigma_{j} p_{j}](https://render.githubusercontent.com/render/math?math=s%3Ds_%7Bj%7D%2B%5Csigma_%7Bj%7D%20p_%7Bj%7D) et sortir de la boucle.

``\hspace*{1.5cm}`` Fin Si

``\hspace*{1.5cm}`` c. ``\hspace*{0.4cm}`` ![\alpha_{j}=g_{j}^{T} g_{j} / \kappa_{j}](https://render.githubusercontent.com/render/math?math=%5Calpha_%7Bj%7D%3Dg_%7Bj%7D%5E%7BT%7D%20g_%7Bj%7D%20%2F%20%5Ckappa_%7Bj%7D)

``\hspace*{1.5cm}`` d.``\hspace*{0.4cm}`` Si ![\left\|s_{j}+\alpha_{j} p_{j}\right\|_{2} \geq \Delta_{k}](https://render.githubusercontent.com/render/math?math=%5Cleft%5C%7Cs_%7Bj%7D%2B%5Calpha_%7Bj%7D%20p_%7Bj%7D%5Cright%5C%7C_%7B2%7D%20%5Cgeq%20%5CDelta_%7Bk%7D) alors

``\hspace*{2.5cm}`` déterminer ![\sigma_{j}](https://render.githubusercontent.com/render/math?math=%5Csigma_%7Bj%7D) la racine de l’équation ![\left\|s_{j}+\sigma p_{j}\right\|_{2}=\Delta_{k}](https://render.githubusercontent.com/render/math?math=%5Cleft%5C%7Cs_%7Bj%7D%2B%5Csigma%20p_%7Bj%7D%5Cright%5C%7C_%7B2%7D%3D%5CDelta_%7Bk%7D) pour laquelle la valeur de ![q\left(s_{j}+\sigma p_{j}\right)](https://render.githubusercontent.com/render/math?math=q%5Cleft(s_%7Bj%7D%2B%5Csigma%20p_%7Bj%7D%5Cright)) est la plus petite.

``\hspace*{2.5cm}`` Poser ![s=s_{j}+\sigma_{j} p_{j}](https://render.githubusercontent.com/render/math?math=s%3Ds_%7Bj%7D%2B%5Csigma_%7Bj%7D%20p_%7Bj%7D) et sortir de la boucle.

``\hspace*{1.5cm}`` Fin Si


``\hspace*{1.5cm}`` e. ``\hspace*{0.4cm}`` ![s_{j+1}=s_{j}+\alpha_{j} p_{j}](https://render.githubusercontent.com/render/math?math=s_%7Bj%2B1%7D%3Ds_%7Bj%7D%2B%5Calpha_%7Bj%7D%20p_%7Bj%7D)

``\hspace*{1.5cm}`` f. ``\hspace*{0.4cm}`` ![g_{j+1}=g_{j}+\alpha_{j} H p_{j}](https://render.githubusercontent.com/render/math?math=g_%7Bj%2B1%7D%3Dg_%7Bj%7D%2B%5Calpha_%7Bj%7D%20H%20p_%7Bj%7D)

``\hspace*{1.5cm}`` g. ``\hspace*{0.4cm}`` ![\beta_{j}=g_{j+1}^{T} g_{j+1} / g_{j}^{T} g_{j}](https://render.githubusercontent.com/render/math?math=%5Cbeta_%7Bj%7D%3Dg_%7Bj%2B1%7D%5E%7BT%7D%20g_%7Bj%2B1%7D%20%2F%20g_%7Bj%7D%5E%7BT%7D%20g_%7Bj%7D)

``\hspace*{1.5cm}`` h. ``\hspace*{0.4cm}`` ![p_{j+1}=-g_{j+1}+\beta_{j} p_{j}](https://render.githubusercontent.com/render/math?math=p_%7Bj%2B1%7D%3D-g_%7Bj%2B1%7D%2B%5Cbeta_%7Bj%7D%20p_%7Bj%7D)

``\hspace*{1.5cm}`` i. ``\hspace*{0.4cm}`` Si la convergence est suffisante, poser ![s=s_{j+1}](https://render.githubusercontent.com/render/math?math=s%3Ds_%7Bj%2B1%7D) et sortir de la boucle.

###### Retourner s.









