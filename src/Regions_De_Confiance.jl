@doc doc"""
Minimise une fonction en utilisant l'algorithme des régions de confiance avec
    - le pas de Cauchy
ou
    - le pas issu de l'algorithme du gradient conjugue tronqué

# Syntaxe
```julia
xk, nb_iters, f(xk), flag = Regions_De_Confiance(algo,f,gradf,hessf,x0,option)
```

# Entrées :

   * **algo**        : string indicant la méthode à utiliser pour calculer le pas
        - **"gct"**   : pour l'algorithme du gradient conjugué tronqué
        - **"cauchy"**: pour le pas de Cauchy
   * **f**           : la fonction à minimiser
   * **gradf**       : le gradient de la fonction f
   * **hessf**       : la hessiene de la fonction à minimiser
   * **x0**          : point de départ
   * **options**
     * **deltaMax**      : utile pour les m-à-j de la région de confiance
                      ``R_{k}=\left\{x_{k}+s ;\|s\| \leq \Delta_{k}\right\}``
     * **gamma1,gamma2** : ``0 < \gamma_{1} < 1 < \gamma_{2}`` pour les m-à-j de ``R_{k}``
     * **eta1,eta2**     : ``0 < \eta_{1} < \eta_{2} < 1`` pour les m-à-j de ``R_{k}``
     * **delta0**        : le rayon de départ de la région de confiance
     * **max_iter**      : le nombre maximale d'iterations
     * **tol**           : la tolérence pour les critères d'arrêt
     * **eps**           : epsilon pour les critères d'arrêt


# Sorties:

   * **xmin**    : une approximation de la solution du problème : ``min_{x \in \mathbb{R}^{n}} f(x)``
   * **fxmin**   : ``f(x_{min})``
   * **flag**    : un entier indiquant le critère sur lequel le programme à arrêter
      - **0**    : Convergence
      - **1**    : stagnation du ``x``
      - **2**    : stagnation du ``f``
      - **3**    : nombre maximal d'itération dépassé
   * **nb_iters** : le nombre d'iteration qu'à fait le programme

# Exemple d'appel
```julia
algo="gct"
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
x0 = [1; 0]
options = []
xmin, fxmin, flag,nb_iters = Regions_De_Confiance(algo,f,gradf,hessf,x0,options)
```
"""
function Regions_De_Confiance(algo,f::Function,gradf::Function,hessf::Function,x0,options,epsk)

    if options == []
        deltaMax = 10
        gamma1 = 0.5
        gamma2 = 2.00
        eta1 = 0.25
        eta2 = 0.75
        delta0 = 2
        max_iter = 1000
        tol = 1e-10            	
    else
        deltaMax = options[1]
        gamma1 = options[2]
        gamma2 = options[3]
        eta1 = options[4]
        eta2 = options[5]
        delta0 = options[6]
        max_iter = options[7]
        tol = options[8]    
    end
    # Initialisation des variables
    nb_iters = 1
    max_iter_gct = max_iter
    grad0 = gradf(x0)
    xk = x0
    deltak = delta0
    flag = 0
    eps = 1e-8
    ###
    #                        Début                            #
    ###
    while true
        gradk = gradf(xk)
        hessk = hessf(xk)

        # calcul du point sk avec l'algorithme du point de cauchy
        if algo=="cauchy"
            sk, ~ = Pas_De_Cauchy(gradk,hessk,deltak)
        elseif algo=="gct"
            sk = Gradient_Conjugue_Tronque(f(xk),gradk,hessk,[deltak,max_iter_gct,tol])
        else
            error("Pas d'algorithme portant le nom de "*algo*" !, Veuillez choisir \"gct\" ou \"cauchy\"")
        end

        decroissance_de_f = -(gradk') * sk - 0.5 * (sk') * hessk * sk
        # le ratio de la réduction observée sur f par rapport à réduction prédite sur mk
        rho_k = (f(xk)-f(xk + sk)) / decroissance_de_f
        # on garde la val de xk avant de la mettre à jour
        xk_moins_1 = xk
        # si on réalise une décroissance > eta1 on met à jour de l'itéré courant
        # sinon on garde xk
        if rho_k >= eta1
            xk = xk + sk
        end
        # mise à jour du rayon de la région de confiance
        # si on réalise une décroissance (rho_k) > eta2 on augmente le rayon de la région de confiance
        if rho_k >= eta2
            deltak = min(gamma2*deltak,deltaMax)
        # si eta1 < rho_k < eta2 on garde le même rayon
        elseif (rho_k >= eta1 && rho_k <= eta2)
            deltak = deltak
        # sinon on diminue le rayon de la région de confiance
        else
            deltak = gamma1*deltak
        end
        """
        ###
        #                       Tests d'arrêt                     #
        ###
        """
        # condition 1 : la CN1
        if norm(gradk,2)<=tol*(norm(grad0,2) + eps) 
           flag = 0
           break
        end
        # condition 2 : la stagnation de x (et le x courant a été changé)
        if (norm(sk,2) <= tol*(norm(xk,2) +eps )) && xk_moins_1 != xk
           flag = 1
           break
        end
        # condition 3 : la stagnation de f (et le x courant a été changé)
        if (abs(f(xk_moins_1)-f(xk)) <= tol*( abs(f(xk))+eps )) && xk != xk_moins_1
            flag = 2
            break
        end
        # condition 4 : le max des itérations a été dépassé
        if nb_iters >= max_iter
            flag = 3
            break
        end
        #condition 5 : la condition du lagrangien augmente ||gradf(xk)||<epsk
        if norm(gradk,2)<epsk+eps
            flag = 4
            break
        end
        nb_iters = nb_iters +1
    end
    xmin = xk
    fxmin = f(xmin)
    return xmin, fxmin, flag, nb_iters
end
