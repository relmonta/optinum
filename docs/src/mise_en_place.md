# Mise en place de Julia

Les étapes permettant d'installer [Julia](https://julialang.org/) ainsi que les
programmes nécessaires afin d'obtenir une interface de type *IDE* avec
l'éditeur [Atom](https://atom.io/) sont décrites dans cette section.

## Installation de Julia

Le langage de programmation Julia peut être téléchargée sur le site web
[Download Julia](https://julialang.org/downloads/). La version v1 ou une
version plus récente doit être téléchargée.

## Lancement des tests

Dans le dossier tests faire :

```julia
include("runtests.jl") 
```

## lancement d'un seul test
faire include du fichier contenant la fonction de test 
et exécuter cette fonction avec le paramétre 'true' pour l'affichage
#### exemple (tester l'algorithme du Lagrangien augmenté ) :

```julia
include("test_Lagrangien_Aug.jl") 
```

```julia
test_Lagrangien_Aug(true) 
```
