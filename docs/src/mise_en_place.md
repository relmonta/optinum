# Mise en place de Julia
## Julia
Julia est un langage très récent : sa première version date de 2012 et il est actuellement en version 1.4. 
Il est de plus en plus utilisé de par le monde, avec un public assez divers : quelques programmeurs bien sûr, 
mais surtout des scientifiques, des ingénieurs, des analystes financiers, des statisticiens qui développent 
les bibliothèques de fonctions qui leur sont utiles. 
## Installation de Julia

Le langage de programmation Julia peut être téléchargé sur le site web
[Download Julia](https://julialang.org/downloads/). La version v1 ou une
version plus récente doit être téléchargée.


## Éditeur à utiliser 

Pour que plus de gens utilisent le langage, il est nécessaire de fournir un environnement de développement
complet et accessible pour ce public, avec de l’autocomplétion intelligente, l’intégration de graphiques, le débogage, etc. 
Cet environnement prend le nom de [Juno](http://junolab.org/). 
Le développement est parti d’un composant proposé par GitHub, [Atom](https://atom.io/), un éditeur de texte prévu pour être facile à personnaliser.
Donc nous recommandons d'utiliser l'environnement Juno installé sur l'éditeur de texte Atom.

## Installation de l'éditeur Atom

### Sous Linux
Vous pouvez installer Atom sur Linux en téléchargeant ce fichier [.deb](https://atom.io/download/deb), ensuite allez au dossier contenant le fichier,
ouvrez un terminal, puis installez l’éditeur Atom avec la commande suivante : `sudo dpkg -i atom-amd64.deb` 

### Sous Windows
- Téléchargez [Julia](https://julialang.org/downloads/)
- Téléchargez [Atom](https://atom.io/)
  
## Installation de Juno

Pour installer Juno, une fois Atom ouvert, suivez les étapes suivantes:

1. Il faut aller dans `Packages -> Settings View -> Open` ou avec la commande `Ctrl + Virgule`
1. Une fois dans `Setting`, sélectionnez l'onglet `Install à gauche`
1. Installez le package `uber-juno`
1. Ouvrez les `Settings` du package `uber-juno` et assurez vous que l'option *Disable - Don't run installation when Atom boots* est déselectionné.
1. Redémarrez l'éditeur Atom. Atom devrait alors installer de nouveaux packages.
1. Redémarrez une dernière fois l'éditeur Atom.

Une nouvelle barre d'outils devrait apparaître sur l'interface d'Atom. Si cette
barre n'est pas visible, vous pouvez la faire apparaître/disparaître avec la
commande `Ctrl+Alt+T`. De plus, sous le menu Packages d'Atom, une entrée Julia
devrait maintenant être présente. Si vous rencontrez des problèmes, assurez vous
que les packages suivants d'Atom sont installés:

- latex-completion
- indent-detective
- ink
- julia-client
- language-julia
- tool-bar

Besoin d'aide ? Consultez notre [F.A.Q.](FAQ.md)

## Lancement des tests

Dans le dossier `optinum/` faire :

```julia
(@v1.) pkg> activate .
(Optinum) pkg> test
```

## Lancement d'un seul test

faire include du fichier contenant la fonction de test 
et exécuter cette fonction avec le paramètre 'true' pour l'affichage

#### Exemple (tester l'algorithme du Lagrangien augmenté ):

```julia
include("test/test_Lagrangien_Augmente.jl") 
```

```julia
test_Lagrangien_Augmente(true) 
```