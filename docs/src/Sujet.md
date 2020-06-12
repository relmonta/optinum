# Sujet TP-Projet Optimisation numérique 2A-ENSEEIHT

La première partie de ce TP-projet concerne les problèmes d’optimisation sans
contraintes. On étudie la méthode de Newton et sa globalisation par l’algorithme des
régions de confiance. La résolution du sous-problème des régions de confiance sera
réalisée de deux façons, soit à l’aide du point de Cauchy, soit par l’algorithme du Gra-
dient Conjugué Tronqué.
La seconde partie du projet exploite la partie précédente pour résoudre des problèmes
d’optimisation avec contraintes par l’algorithme du Lagrangien augmenté.

## Optimisation sans contraintes

Dans cette partie, on s’intéresse à la résolution du problème

![\min _{x \in \mathbb{R}^{n}} f(x) ](https://render.githubusercontent.com/render/math?math=%5Cmin%20_%7Bx%20%5Cin%20%5Cmathbb%7BR%7D%5E%7Bm%7D%7D%20f(x)%20)

où la fonction ``f`` est de classe ![C^{2}](https://render.githubusercontent.com/render/math?math=C%5E%7B2%7D) sur ![R^{n}](https://render.githubusercontent.com/render/math?math=R%5E%7Bn%7D) . On cherche donc à exploiter l’information fournie
par ses dérivées première et seconde, que l’on représente en tout point x par le vecteur
gradient ![\nabla f (x) \in R^{n}](https://render.githubusercontent.com/render/math?math=%5Cnabla%20f%20(x)%20%5Cin%20R%5E%7Bn%7D) et la matrice Hessienne ![\nabla^{2} f (x) \in R^{nxn}](https://render.githubusercontent.com/render/math?math=%5Cnabla%5E%7B2%7D%20f%20(x)%20%5Cin%20R%5E%7Bnxn%7D).

[1) Algorithme de Newton local](../src/Algorithme_de_newton.md)

[2) Région de confiance](../src/Regions_de_confiance.md)

[3) Région de confiance-Partie 2: Avec l'agorithme du Gradient Conjugué Tronqué](../src/Region_de_confiance_avec_gradient_conjugue_tronque.md)


## Optimisation avec contraintes

Dans cette partie, nous nous intéressons à la résolution des problèmes sous contraintes.Le problème se présente donc sous la forme suivante :


![\min _{x \in \mathbb{R}^{n}} f(x)](https://render.githubusercontent.com/render/math?math=%5Cmin%20_%7Bx%20%5Cin%20%5Cmathbb%7BR%7D%5E%7Bn%7D%7D%20f(x)) sous la contrainte ![x \in C](https://render.githubusercontent.com/render/math?math=x%20%5Cin%20C)

où C est un sous-ensemble non vide de ![\mathbb{R}^{n}](https://render.githubusercontent.com/render/math?math=%5Cmathbb%7BR%7D%5E%7Bn%7D)

[Lagrangien Augmenté](../src/Lagrangien_augmente.md)
