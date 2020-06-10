# optinum
TP d'optimisation numérique 2A SN N7.

| **Documentation** | **Intégration continue** |
|:-----------------:|:------------------------:|
| [![](https://img.shields.io/badge/docs-dev-blue.svg)](https://mathn7.github.io/optinum/dev/accueil) |[![Build Status](https://travis-ci.com/mathn7/optinum.svg?token=7MnuezU9siusbUxpxFBx&branch=master)](https://travis-ci.com/mathn7/optinum)|


## lancement de l'ensemble des tests
dans le dossier tests faire :

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
