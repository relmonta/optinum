# Sujet TP-Projet Optimisation numérique 2A-ENSEEIHT

La première partie de ce TP-projet concerne les problèmes d’optimisation sans
contraintes. On étudie la méthode de Newton et sa globalisation par l’algorithme des
régions de confiance. La résolution du sous-problème des régions de confiance sera
réalisée de deux façons, soit à l’aide du point de Cauchy, soit par l’algorithme du Gra-
dient Conjugué Tronqué.
La seconde partie du projet exploite la partie précédente pour résoudre des problèmes
d’optimisation avec contraintes par l’algorithme du Lagrangien augmenté.

# Optimisation sans contraintes

Dans cette partie, on s’intéresse à la résolution du problème

``\hspace*{2.5} \min _{x \in \mathbb{R}^{m}} f(x) \\``
où la fonction ``f`` est de classe ``C^{2}`` sur ``R^{n}`` . On cherche donc à exploiter l’information fournie
par ses dérivées première et seconde, que l’on représente en tout point x par le vecteur
gradient ``\nabla f (x) \in R^{n} ``et la matrice Hessienne ``\nabla^{2} f (x) \in R^{nxn} ``.

[1/- Algorithme de Newton local] (../src/Algorithme_de_newton.md)

[2/- Région de confiance-Partie 1: Avec le pas de cauchy] (../src/Region_de_confiance_avec_pas_de_cauchy.md)

[3/- Région de confiance-Partie 2: Avec l'agorithme du Gradient Conjugué Tronqué] (../src/Region_de_confiance_avec_gradient_conjugue_tronque.md)
