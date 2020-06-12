var documenterSearchIndex = {"docs":
[{"location":"fct_index.html#Documentation-des-fonctions-1","page":"Documentation des fonctions","title":"Documentation des fonctions","text":"","category":"section"},{"location":"fct_index.html#","page":"Documentation des fonctions","title":"Documentation des fonctions","text":"Documentation de toute les fonctions du package Optinum","category":"page"},{"location":"fct_index.html#","page":"Documentation des fonctions","title":"Documentation des fonctions","text":"Pages = [\"fct_index.md\"]","category":"page"},{"location":"fct_index.html#","page":"Documentation des fonctions","title":"Documentation des fonctions","text":"Modules = [Optinum]\nOrder   = [:function, :type]","category":"page"},{"location":"fct_index.html#Optinum.Gradient_Conjugue_Tronque-NTuple{4,Any}","page":"Documentation des fonctions","title":"Optinum.Gradient_Conjugue_Tronque","text":"Minimise le problème : min_s delta_k q_k(s) = s^tg + (12)s^tHs                         pour la k^ème itération de l'algorithme des régions de confiance\n\nSyntaxe\n\nsk = Gradient_Conjugue_Tronque(fk,gradfk,hessfk,option)\n\nEntrées :\n\nfk               : la fonction à minimiser appliqué au point xk\ngradfk           : le gradient de la fonction f appliqué au point xk\nhessfk           : la Hessienne de la fonction f appliqué au point xk\noptions\ndelta    : le rayon de la région de confiance\nmax_iter : le nombre maximal d'iterations\ntol      : la tolerance pour la condition d'arrêt sur le gradient\n\nSorties:\n\ns : le pas s qui approche la solution du problème : min_s delta_k q(s)\n\nExemple d'appel:\n\nf(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2\ngradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]\nhessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]\nxk = [1; 0]\noptions = []\ns = Gradient_Conjugue_Tronque(f(xk),gradf(xk),hessf(xk),options)\n\n\n\n","category":"method"},{"location":"fct_index.html#Optinum.Lagrangien_Augmente-Tuple{Any,Function,Function,Function,Function,Function,Function,Function,Function,Function,Any,Any}","page":"Documentation des fonctions","title":"Optinum.Lagrangien_Augmente","text":"Resolution des problèmes de minimisation sous contraintes d'égalités\n\nSyntaxe\n\nLagrangien_Augmente(algo,fonc,contrainte,gradfonc,hessfonc,grad_contrainte,\n\t\t\thess_contrainte,norm_contrainte,jac_contrainte,phi,x0,option)\n\nEntrées\n\nalgo \t\t   : l'algorithme sans contraintes à utiliser:\n\"newton\"  : pour l'algorithme de Newton\n\"cauchy\"  : pour le pas de Cauchy\n\"gct\"     : pour le gradient conjugué tronqué\nfonc \t\t   : la fonction à minimiser\ncontrainte\t   : la contrainte [x est dans le domaine des contraintes ssi c(x)=0]\ngradfonc       : le gradient de la fonction\nhessfonc \t   : la hessienne de la fonction\ngrad_contrainte : le gradient de la contrainte\nhess_contrainte : la hessienne de la contrainte\nnorm_contrainte : la norme de la contrainte\njac_contrainte : la jacobienne de la contrainte\nx0 \t\t\t   : la première composante du point de départ du Lagrangien\noptions\nepsilon \t   : utilisé dans les critères d'arrêt\ntol         : la tolérance utilisée dans les critères d'arrêt\nitermax \t   : nombre maximal d'itération dans la boucle principale\nlambda0\t   : la deuxième composante du point de départ du Lagrangien\nmu0,tho \t   : valeurs initiales des variables de l'algorithme\n\nSorties\n\nxmin\t\t   : une approximation de la solution du problème avec contraintes\nfxmin \t   : f(x_min)\nflag\t\t   : indicateur du déroulement de l'algorithme\n0    : Convergence\n1    : nombre maximal d'itération atteint\n(-1) : une erreur s'est produite\nniters \t   : nombre d'itérations réalisées\n\nExemple d'appel\n\n\n\n\n\n","category":"method"},{"location":"fct_index.html#Optinum.Regions_De_Confiance-Tuple{Any,Function,Function,Function,Any,Any}","page":"Documentation des fonctions","title":"Optinum.Regions_De_Confiance","text":"Minimise une fonction en utilisant l'algorithme des régions de confiance avec     - le pas de Couchy ou     - le pas issu de l'algorithme du gradient conjugue tronqué\n\nSyntaxe\n\nxk, nb_iters, f(xk), flag = Regions_De_Confiance(algo,f,gradf,hessf,x0,option)\n\nEntrées :\n\nalgo        : string indicant la méthode à utiliser pour calculer le pas\n\"gct\"   : pour l'algorithme du gradient conjugué tronqué\n\"cauchy\": pour le pas de Cauchy\nf           : la fonction à minimiser\ngradf       : le gradient de la fonction f\nhessf       : la hessiene de la fonction à minimiser\nx0          : point de dapart\noptions\ndeltaMax      : utile pour les m-à-j de la region de confiance                R_k=leftx_k+s s leq Delta_kright\ngamma1,gamma2 : 0  gamma_1  1  gamma_2 pour les m-à-j de R_k\neta1,eta2     : 0  eta_1  eta_2  1 pour les m-à-j de R_k\ndelta0        : le rayon de départ de la région de confiance\nmax_iter      : le nombre maximale d'iterations\ntol           : la tolérence pour les critères d'arrêt\n\nSorties:\n\nxmin    : une approximation de la solution du problème : min_x in mathbbR^n f(x)\nfxmin   : f(x_min)\nflag    : un entier indiquant le critère sur lequel le programme à arrêter\n0    : Convergence\n1    : stagnation du x\n2    : stagnation du f\n3    : nombre maximal d'itération dépassé\nnb_iters : le nombre d'iteration qu'à fait le programme\n\nExemple d'appel\n\nalgo=\"gct\"\nf(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2\ngradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]\nhessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]\nx0 = [1; 0]\noption = []\nxmin, fxmin, flag,nb_iters = Regions_De_Confiance(algo,f,gradf,hessf,x0,option)\n\n\n\n","category":"method"},{"location":"mise_en_place.html#Mise-en-place-de-Julia-1","page":"Mise en place","title":"Mise en place de Julia","text":"","category":"section"},{"location":"mise_en_place.html#","page":"Mise en place","title":"Mise en place","text":"Les étapes permettant d'installer Julia ainsi que les programmes nécessaires afin d'obtenir une interface de type IDE avec l'éditeur Atom sont décrites dans cette section.","category":"page"},{"location":"mise_en_place.html#Installation-de-Julia-1","page":"Mise en place","title":"Installation de Julia","text":"","category":"section"},{"location":"mise_en_place.html#","page":"Mise en place","title":"Mise en place","text":"Le langage de programmation Julia peut être téléchargée sur le site web Download Julia. La version v1 ou une version plus récente doit être téléchargée.","category":"page"},{"location":"mise_en_place.html#Lancement-des-tests-1","page":"Mise en place","title":"Lancement des tests","text":"","category":"section"},{"location":"mise_en_place.html#","page":"Mise en place","title":"Mise en place","text":"Dans le dossier tests faire :","category":"page"},{"location":"mise_en_place.html#","page":"Mise en place","title":"Mise en place","text":"include(\"runtests.jl\") ","category":"page"},{"location":"mise_en_place.html#lancement-d'un-seul-test-1","page":"Mise en place","title":"lancement d'un seul test","text":"","category":"section"},{"location":"mise_en_place.html#","page":"Mise en place","title":"Mise en place","text":"faire include du fichier contenant la fonction de test  et exécuter cette fonction avec le paramétre 'true' pour l'affichage","category":"page"},{"location":"mise_en_place.html#exemple-(tester-l'algorithme-du-Lagrangien-augmenté-)-:-1","page":"Mise en place","title":"exemple (tester l'algorithme du Lagrangien augmenté ) :","text":"","category":"section"},{"location":"mise_en_place.html#","page":"Mise en place","title":"Mise en place","text":"include(\"test_Lagrangien_Augmente.jl\") ","category":"page"},{"location":"mise_en_place.html#","page":"Mise en place","title":"Mise en place","text":"test_Lagrangien_Aug(true) ","category":"page"},{"location":"generate_pdf.html#Génération-d'un-fichier-pdf-1","page":"Génération du rapport","title":"Génération d'un fichier pdf","text":"","category":"section"},{"location":"generate_pdf.html#","page":"Génération du rapport","title":"Génération du rapport","text":"Le package Weave permet de générer un rapport sous format pdf d'un script Julia.","category":"page"},{"location":"generate_pdf.html#","page":"Génération du rapport","title":"Génération du rapport","text":"Le fichier gabarit_rapport.jl est un gabarit de rapport. Après avoir édité votre script, vous pouvez publier votre script en format pdf (avec pdflatex) avec la commande:","category":"page"},{"location":"generate_pdf.html#","page":"Génération du rapport","title":"Génération du rapport","text":"using Weave\nweave(\"gabarit_rapport.jl\", doctype = \"md2pdf\")","category":"page"},{"location":"generate_pdf.html#","page":"Génération du rapport","title":"Génération du rapport","text":"ou en format HTML avec la commande:","category":"page"},{"location":"generate_pdf.html#","page":"Génération du rapport","title":"Génération du rapport","text":"using Weave\nweave(\"gabarit_rapport.jl\", doctype = \"md2html\")","category":"page"},{"location":"generate_pdf.html#","page":"Génération du rapport","title":"Génération du rapport","text":"Il est important d'imprimer ensuite le fichier HTML en format pdf pour la remise sur Moodle.","category":"page"},{"location":"generate_pdf.html#","page":"Génération du rapport","title":"Génération du rapport","text":"warning: Avertissement\nLes lignes de code précédentes ne doivent pas se retrouver dans votre script. Vous devez les éxécuter dans la console de Julia en vous assurant d'être dans le dossier contenant le fichier gabarit_rapport.jl.","category":"page"},{"location":"Regions_de_confiance.html#Région-de-confiance-1","page":"Les Régions de Confiance","title":"Région de confiance","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"L’introduction d’une région de confiance dans la méthode de Newton permet de garantir la convergence globale de celle-ci, i.e. la convergence vers un optimum local quel que soit le point de départ. Cela suppose certaines conditions sur la résolution locale des sous- problèmes issus de la méthode, qui sont aisément imposables.","category":"page"},{"location":"Regions_de_confiance.html#Principe-1","page":"Les Régions de Confiance","title":"Principe","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"L’idée de la méthode des régions de confiance est d’approcher f par une fonction modèle plus simple m_k dans une région R_k=leftx_k+s s leq Delta_kright pour un Delta_k fixé. Cette région dite “de confiance” doit être suffisament petite pour que","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*25cm m_kleft(x_k+sright) sim fleft(x_k+sright)","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"Le principe est que, au lieu de résoudre l’équation : fleft(x_k+1right)=min _x leq Delta_k fleft(x_k+sright) on résout :","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*25cm m_kleft(x_k+1right)=min _x leq Delta_k m_kleft(x_k+sright) hspace*25cm(2.1)","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"Si la différence entre f(x_k+1) et m_k (x_k+1 ) est trop grande, on diminue le _k (et donc la région de confiance) et on résout le modèle (2.1) à nouveau. Un avantage de cette méthode est que toutes les directions sont prises en compte. Par contre, il faut faire attention à ne pas trop s’éloigner de x_k ; en général, la fonction m_k n’approche proprement f que sur une région proche de x_k .","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"Exemple de modèle : l’approximation de Taylor à l’ordre 2 (modèle quadratique) :","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*15cm\tm_kleft(x_k+sright)=q_k(s)=fleft(x_kright)+g_k^top s+frac12 s^top H_k s hspace*15cm(2.2)","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"avec g_k=nabla fleft(x_kright) text  et  H_k=nabla^2 fleft(x_kright)","category":"page"},{"location":"Regions_de_confiance.html#Algorithme-1","page":"Les Régions de Confiance","title":"Algorithme","text":"","category":"section"},{"location":"Regions_de_confiance.html#Algorithme-2-1","page":"Les Régions de Confiance","title":"Algorithme 2","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"Méthode des régions de confiance (algo général)     ","category":"page"},{"location":"Regions_de_confiance.html#Données:-1","page":"Les Régions de Confiance","title":"Données:","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"Delta_max   0 Delta_0  in(0 Delta_max) 0  gamma_1  1  gamma_2  0  eta_1  eta_2  1","category":"page"},{"location":"Regions_de_confiance.html#Sorties:-1","page":"Les Régions de Confiance","title":"Sorties:","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"une approximation de la solution du problème : min _x in mathbbR^n f(x)","category":"page"},{"location":"Regions_de_confiance.html#.Tant-que-le-test-de-convergence-est-non-satisfait:-1","page":"Les Régions de Confiance","title":"1.Tant que le test de convergence est non satisfait:","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*15cm a.Calculer approximativement s_k solution du sous-problème (2.1);","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*15cm b.Evaluer fleft(x_k+s_kright) et rho_k=fracfleft(x_kright)-fleft(x_k+s_kright)m_kleft(x_kright)-m_kleft(x_k+s_kright)","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*15cm c. Mettre à jour l’itéré courant :","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*25cm   x_k+1=leftbeginarrayll x_k+s_k  text  si  rho_k geq eta_1  x_k  text  sinon  endarrayright","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*15cm d. Mettre à jour la région de confiance : ","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*25cm    Delta_k+1=leftbeginarrayccmin gamma_2 Delta_k Delta_max   operatornamesi rho_k geq eta_2  Delta_k  text si  rho_k in eta_1 eta_2 gamma_1 Delta_k  text  sinon  endarrayright","category":"page"},{"location":"Regions_de_confiance.html#.Retourner-![x_{k}](https://render.githubusercontent.com/render/math?mathx_%7Bk%7D)-.-1","page":"Les Régions de Confiance","title":"2.Retourner (Image: x_{k}) .","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"Cet algorithme  est un cadre générique. On va s’intéresser à deux raffinages possibles de l’étape a.","category":"page"},{"location":"Regions_de_confiance.html#Le-pas-de-cauchy-1","page":"Les Régions de Confiance","title":"Le pas de cauchy","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*05cmOn considère ici le modèle quadratique q_k(s). Le sous-problème de régions de confiance correspondant peut se révéler difficile à résoudre (parfois autant que le problème de départ).","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"Il est donc intéressant de se restreindre à une résolution approchée de ce problème.","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*05cmLe pas de Cauchy appartient à la catégorie des solutions approchées. Il s’agit de se restreindre au sous-espace engendré par le vecteur g_k ; le sous-problème s’écrit alors","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*25cm leftbeginarraycl min  q_k(s)  s  t   s=-t g_k   t0   s leq Delta_k endarrayright  hspace*15cm   (2.3)","category":"page"},{"location":"Regions_de_confiance.html#Algorithme-du-Gradient-Conjugué-Tronqué-1","page":"Les Régions de Confiance","title":"Algorithme du Gradient Conjugué Tronqué","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"On s’intéresse maintenant à la résolution approchée du problème (2.1) à l’itération k de l’algorithme 2 des Régions de Confiance. On considère pour cela l’algorithme du Gradient Conjugué Tronqué (vu en cours), rappelé ci-après :","category":"page"},{"location":"Regions_de_confiance.html#Algorithme-3-1","page":"Les Régions de Confiance","title":"Algorithme 3","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"Algorithme du gradient conjugué tronqué","category":"page"},{"location":"Regions_de_confiance.html#Données:-2","page":"Les Régions de Confiance","title":"Données:","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"Delta_k  0 x_k g=nabla fleft(x_kright) H=nabla^2 fleft(x_kright)","category":"page"},{"location":"Regions_de_confiance.html#Sorties:-2","page":"Les Régions de Confiance","title":"Sorties:","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"le pas s qui approche la solution du problème : min_s  leq Delta_k q(s)","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"où q(s)=g^top s+frac12 s^top H_k s","category":"page"},{"location":"Regions_de_confiance.html#Initialisations-:-1","page":"Les Régions de Confiance","title":"Initialisations :","text":"","category":"section"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"s_0=0 g_0=g p_0=-g","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"1. Pour j = 0, 1, 2, . . . , faire :","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*15cm a. hspace*04cm kappa_j=p_j^T H p_j","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*15cm b.hspace*04cm Si kappa_j leq 0 alors  hspace*25cm déterminer sigma_j la racine de l’équation lefts_j+sigma p_jright_2=Delta_k  hspace*27cm pour laquelle la valeur de qleft(s_j+sigma p_jright) est la plus petite.","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*25cm Poser s=s_j+sigma_j p_j et sortir de la boucle. hspace*15cm Fin Si","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*15cm c. hspace*04cm alpha_j=g_j^T g_j  kappa_j","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*15cm d.hspace*04cm Si lefts_j+alpha_j p_jright_2 geq Delta_k alors","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*25cm déterminer sigma_j la racine positive de l’équation lefts_j+sigma p_jright_2=Delta_k","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*25cm Poser s=s_j+sigma_j p_j et sortir de la boucle. hspace*15cm Fin Si","category":"page"},{"location":"Regions_de_confiance.html#","page":"Les Régions de Confiance","title":"Les Régions de Confiance","text":"hspace*15cm e. hspace*04cm s_j+1=s_j+alpha_j p_j hspace*15cm f. hspace*04cm g_j+1=g_j+alpha_j H p_j  hspace*15cm g. hspace*04cm beta_j=g_j+1^T g_j+1  g_j^T g_j hspace*15cm h. hspace*04cm p_j+1=-g_j+1+beta_j p_j hspace*15cm i. hspace*04cm Si la convergence est suffisante, poser s=s_j+1 et sortir de la boucle.","category":"page"},{"location":"Regions_de_confiance.html#Retourner-s.-1","page":"Les Régions de Confiance","title":"Retourner s.","text":"","category":"section"},{"location":"Sujet.html#Sujet-TP-Projet-Optimisation-numérique-2A-ENSEEIHT-1","page":"Sujet","title":"Sujet TP-Projet Optimisation numérique 2A-ENSEEIHT","text":"","category":"section"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"La première partie de ce TP-projet concerne les problèmes d’optimisation sans contraintes. On étudie la méthode de Newton et sa globalisation par l’algorithme des régions de confiance. La résolution du sous-problème des régions de confiance sera réalisée de deux façons, soit à l’aide du point de Cauchy, soit par l’algorithme du Gra- dient Conjugué Tronqué. La seconde partie du projet exploite la partie précédente pour résoudre des problèmes d’optimisation avec contraintes par l’algorithme du Lagrangien augmenté.","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"<<<<<<< HEAD","category":"page"},{"location":"Sujet.html#Optimisation-sans-contraintes-1","page":"Sujet","title":"Optimisation sans contraintes","text":"","category":"section"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"Dans cette partie, on s’intéresse à la résolution du problème","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"hspace*25 min _x in mathbbR^m f(x)  où la fonction f est de classe C^2 sur R^n . On cherche donc à exploiter l’information fournie par ses dérivées première et seconde, que l’on représente en tout point x par le vecteur gradient nabla f (x) in R^net la matrice Hessienne nabla^2 f (x) in R^nxn.","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"1/- Algorithme de Newton local","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"2/- Région de confiance-Partie 1: Avec le pas de cauchy","category":"page"},{"location":"Sujet.html#[3/-Région-de-confiance-Partie-2:-Avec-l'agorithme-du-Gradient-Conjugué-Tronqué](../src/Region_de_confiance_avec_gradient_conjugue_tronque.md)-1","page":"Sujet","title":"3/- Région de confiance-Partie 2: Avec l'agorithme du Gradient Conjugué Tronqué","text":"","category":"section"},{"location":"Sujet.html#Optimisation-sans-contraintes-2","page":"Sujet","title":"Optimisation sans contraintes","text":"","category":"section"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"Dans cette partie, on s’intéresse à la résolution du problème","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"(Image: \\min _{x \\in \\mathbb{R}^{n}} f(x) )","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"où la fonction f est de classe (Image: C^{2}) sur (Image: R^{n}) . On cherche donc à exploiter l’information fournie par ses dérivées première et seconde, que l’on représente en tout point x par le vecteur gradient (Image: \\nabla f (x) \\in R^{n}) et la matrice Hessienne (Image: \\nabla^{2} f (x) \\in R^{nxn}).","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"1) Algorithme de Newton local","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"2) Région de confiance","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"3) Région de confiance-Partie 2: Avec l'agorithme du Gradient Conjugué Tronqué","category":"page"},{"location":"Sujet.html#Optimisation-avec-contraintes-1","page":"Sujet","title":"Optimisation avec contraintes","text":"","category":"section"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"Dans cette partie, nous nous intéressons à la résolution des problèmes sous contraintes.Le problème se présente donc sous la forme suivante :","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"(Image: \\min _{x \\in \\mathbb{R}^{n}} f(x)) sous la contrainte (Image: x \\in C)","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"où C est un sous-ensemble non vide de (Image: \\mathbb{R}^{n})","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"Lagrangien Augmenté","category":"page"},{"location":"Sujet.html#","page":"Sujet","title":"Sujet","text":"1ed6fad691fbcd515100743f97d4b49761add08a","category":"page"},{"location":"Lagrangien_augmente.html#Principe-1","page":"Lagrangien augmenté","title":"Principe","text":"","category":"section"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"La méthode du lagrangien augmenté appartient à une classe d'algorithme qui permettent la résolution des problèmes avec contraintes.Elle s'apparente aux méthodes de pénalisation, dans lesquelles on résout le problème avec contraintes à travers une suite de problèmes sans contraintes.","category":"page"},{"location":"Lagrangien_augmente.html#Algorithme-du-Lagrangien-augmenté-pour-contraintes-d'égalité-1","page":"Lagrangien augmenté","title":"Algorithme du Lagrangien augmenté pour contraintes d'égalité","text":"","category":"section"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"On s'intéresse ici au cas où l'ensemble C est défini par un ensemble des contraintes d'égalités.   Le problème se met ainsi sous la forme :","category":"page"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"min_x in mathbbR^n f(x)","category":"page"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"c  mathbbR^n rightarrow  mathbbR^m . L'algorithme suivant est obtenu de  Bierlaire, Introduction à l'optimisation différentiable.","category":"page"},{"location":"Lagrangien_augmente.html#Données-:-1","page":"Lagrangien augmenté","title":"Données :","text":"","category":"section"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"(Image: \\mu_{0} > 0, \\tau > 0, \\hat{\\eta}_{0}=0.1258925 ,  \\alpha=0.1, \\beta=0.9, \\epsilon_{0}=1 ,  \\mu_{0}, \\eta_{0}=\\hat{\\eta}_{0} / \\mu_{0}^{\\alpha})  , et un point de départ du Lagrangien (Image: (x_{0},\\lambda_{0})) . On pose (Image: k = 0)","category":"page"},{"location":"Lagrangien_augmente.html#Sorties-:-1","page":"Lagrangien augmenté","title":"Sorties :","text":"","category":"section"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"une approximation de la solution du problème avec contraintes.","category":"page"},{"location":"Lagrangien_augmente.html#.-Tant-qu'il-n'y-a-pas-convergence,-répéter-1","page":"Lagrangien augmenté","title":"1. Tant qu'il n'y a pas convergence, répéter","text":"","category":"section"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"a. Calculer approximation un minimiseur (Image: x_{k+1}) du problème sans contraintes suivant :","category":"page"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"(Image: \\min _{x \\in \\mathbb{R}^{n}} L_{A}\\left(x, \\lambda_{k}, \\mu_{k}\\right)=f(x)+\\lambda_{k}^{T} c(x)+\\frac{\\mu_{k}}{2}\\|c(x)\\|^{2})","category":"page"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"avec (Image: x_{k}) comme point de départ ,en terminant lorsque (Image: \\| \\nabla_{x} L_{A}\\left(x, \\lambda_{k}, \\mu_{k}\\right) \\| \\leq \\epsilon_{k}) . Si convergence de l'algorithme global, s'arrêter , sinon aller en b","category":"page"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"b. Si (Image: \\|c(x_{k+1})\\| \\leq \\eta_{k}) , mettre à jour (entre autres) les multiplicateurs :","category":"page"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"leftbeginarrayllambda_k+1=lambda_k+mu_k cleft(x_k+1right) mu_k+1=mu_k epsilon_k+1=epsilon_k  mu_k eta_k+1=eta_k  mu_k^beta k=k+1endarrayright","category":"page"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"c. Autrement, mettre à jour (entre autres) le paramétre de pénalité :","category":"page"},{"location":"Lagrangien_augmente.html#","page":"Lagrangien augmenté","title":"Lagrangien augmenté","text":"(Image: \\left\\{\\begin{array}{l}\\lambda_{k+1} =\\lambda_{k} \\\\\\mu_{k+1} =\\tau \\mu_{k} \\\\\\epsilon_{k+1} =\\epsilon_{0} / \\mu_{k+1} \\\\\\eta_{k+1} =\\hat{\\eta}_{0} / \\mu_{k+1}^{\\alpha} \\\\k=k+1\\end{array}\\right.)","category":"page"},{"location":"Lagrangien_augmente.html#.-Retourner-![x_{k},\\lambda_{k},\\mu_{k}](https://render.githubusercontent.com/render/math?mathx_%7Bk%7D%2C%5Clambda_%7Bk%7D%2C%5Cmu_%7Bk%7D)-.-1","page":"Lagrangien augmenté","title":"2. Retourner (Image: x_{k},\\lambda_{k},\\mu_{k}) .","text":"","category":"section"},{"location":"index.html#Optinum-Optimisation-Numérique-1","page":"Accueil","title":"Optinum - Optimisation Numérique","text":"","category":"section"},{"location":"index.html#","page":"Accueil","title":"Accueil","text":"Le package Optinum contient tous les algorithmes vus en cours d'Optimisation de l'École INP-ENSEEIHT.","category":"page"},{"location":"Algorithme_de_newton.html#Algorithme-de-Newton-local-1","page":"Algorithme de Newton","title":"Algorithme de Newton local","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"<<<<<<< HEAD","category":"page"},{"location":"Algorithme_de_newton.html#Principe-1","page":"Algorithme de Newton","title":"Principe","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"hspace*07 La fonction f étant C^2 , on peut remplacer f au voisinage de l’itéré courant ``x_{k} par son développement de Taylor au second ordre, soit :","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"hspace*07 f(y) sim q(y)=fleft(x_kright)+nabla fleft(x_kright)^Tleft(y-x_kright)+frac12left(y-x_kright)^T nabla^2 fleft(x_kright)left(y-x_kright) On choisit alors comme point x_k+1 le minimum de la quadratique q lorsqu’il existe et est unique, ce qui n’est le cas que si nabla^2 f (x) est définie positive. Or le minimum de q est réalisé par x k+1 solution de : nabla^2 f (x_k+1) = 0, soit : hspace*17 nabla fleft(x_kright)+nabla^2 fleft(x_kright)left(x_k+1-x_kright)=0  ou encore, en supposant que nabla^2 f (x_k)est définie positive :","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"hspace*17 x_k+1=x_k-nabla^2 fleft(x_kright)^-1 nabla fleft(x_kright) hspace*07La méthode ne doit cependant jamais être appliquée en utilisant une inversion de la matrice Hessienne (qui peut être de très grande taille et mal conditionnée), mais plutôt en utilisant :","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"hspace*17 x_k+1=x_k+d_k où d_k est l’unique solution du système linéaire","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"hspace*17 nabla^2 fleft(x_kright) d_k=-nabla fleft(x_kright)  d_k étant appelée direction de Newton. hspace*07 Cette méthode est bien définie si à chaque itération, la matrice hessienne nabla^2 f (x_k) est définie positive : ceci est vrai en particulier au voisinage de la solutionx_k cherchée si on suppose que nabla^2 f (x_*) est définie positive (par continuité de nabla^2 f).","category":"page"},{"location":"Algorithme_de_newton.html#Algorithme-1","page":"Algorithme de Newton","title":"Algorithme","text":"","category":"section"},{"location":"Algorithme_de_newton.html#Données:-1","page":"Algorithme de Newton","title":"Données:","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"f , x_0 première approximation de la solution cherchée, epsilon  0 précision demandée.","category":"page"},{"location":"Algorithme_de_newton.html#Sorties-1","page":"Algorithme de Newton","title":"Sorties","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"une approximation de la solution du problème min _x in mathbbR^m f(x).","category":"page"},{"location":"Algorithme_de_newton.html#.Tant-que-le-test-de-convergence-est-non-satisfait-1","page":"Algorithme de Newton","title":"1.Tant que le test de convergence est non satisfait","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"a. Calculer d k solution du système : nabla^2 f (x_k) d_k = nabla f (x_k),   b. Mise à jour : x_k+1 = x_k+ d_k  k = k + 1,","category":"page"},{"location":"Algorithme_de_newton.html#Retourner-x_{k}.-1","page":"Algorithme de Newton","title":"Retourner x_k.","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"=======","category":"page"},{"location":"Algorithme_de_newton.html#Principe-2","page":"Algorithme de Newton","title":"Principe","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"La fonction f étant (Image: C^{2}) , on peut remplacer f au voisinage de l’itéré courant (Image: x_{k}) par son développement de Taylor au second ordre, soit :","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"(Image: f(y) \\sim q(y)=f\\left(x_{k}\\right)+\\nabla f\\left(x_{k}\\right)^{T}\\left(y-x_{k}\\right)+\\frac{1}{2}\\left(y-x_{k}\\right)^{T} \\nabla^{2} f\\left(x_{k}\\right)\\left(y-x_{k}\\right))","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"On choisit alors comme point (Image: x_{k+1}) le minimum de la quadratique q lorsqu’il existe et est unique, ce qui n’est le cas que si (Image: \\nabla^{2} f (x)) est définie positive. Or le minimum de q est réalisé par (Image: x_{k+1}) solution de : (Image: \\nabla^{2} f (x_{k+1}) = 0) , soit : (Image: \\nabla f\\left(x_{k}\\right)+\\nabla^{2} f\\left(x_{k}\\right)\\left(x_{k+1}-x_{k}\\right)=0 )","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"ou encore, en supposant que (Image: \\nabla^{2} f (x_{k})) est définie positive :","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"(Image: x_{k+1}=x_{k}-\\nabla^{2} f\\left(x_{k}\\right)^{-1} \\nabla f\\left(x_{k}\\right))","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"La méthode ne doit cependant jamais être appliquée en utilisant une inversion de la matrice Hessienne (qui peut être de très grande taille et mal conditionnée), mais plutôt en utilisant :","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"(Image: x_{k+1}=x_{k}+d_{k}) où (Image: d_{k}) est l’unique solution du système linéaire :","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"(Image: \\nabla^{2} f\\left(x_{k}\\right) d_{k}=-\\nabla f\\left(x_{k}\\right)) , (Image: d_{k}) étant appelée direction de Newton.","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"Cette méthode est bien définie si à chaque itération, la matrice hessienne (Image: \\nabla^{2} f (x_{k})) est définie positive : ceci est vrai en particulier au voisinage de la solution (Image: x_{k}) cherchée si on suppose que (Image: \\nabla^{2} f (x_{*}))  est définie positive (par continuité de (Image: \\nabla^{2} f)).","category":"page"},{"location":"Algorithme_de_newton.html#Algorithme-2","page":"Algorithme de Newton","title":"Algorithme","text":"","category":"section"},{"location":"Algorithme_de_newton.html#Données:-2","page":"Algorithme de Newton","title":"Données:","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"f , (Image: x_{0}) première approximation de la solution cherchée, (Image: \\epsilon > 0) précision demandée.","category":"page"},{"location":"Algorithme_de_newton.html#Sorties-2","page":"Algorithme de Newton","title":"Sorties","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"une approximation de la solution du problème (Image: \\min _{x \\in \\mathbb{R}^{m}} f(x)) .","category":"page"},{"location":"Algorithme_de_newton.html#.Tant-que-le-test-de-convergence-est-non-satisfait-2","page":"Algorithme de Newton","title":"1.Tant que le test de convergence est non satisfait","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"a. Calculer d k solution du système : (Image: \\nabla^{2} f (x_{k}) d_{k} = - \\nabla f (x_{k}))","category":"page"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"b. Mise à jour : (Image: x_{k+1} = x_{k}+ d_{k} , k = k + 1)","category":"page"},{"location":"Algorithme_de_newton.html#.Retourner-![x_{k}](https://render.githubusercontent.com/render/math?mathx_%7Bk%7D)-.-1","page":"Algorithme de Newton","title":"2.Retourner (Image: x_{k}) .","text":"","category":"section"},{"location":"Algorithme_de_newton.html#","page":"Algorithme de Newton","title":"Algorithme de Newton","text":"1ed6fad691fbcd515100743f97d4b49761add08a","category":"page"}]
}
