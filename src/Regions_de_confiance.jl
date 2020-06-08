
include("Pas_De_Cauchy.jl")
include("Gradient_Conjugue_Tronque.jl")

"""
###########################################################################
Region_De_Confiance: minimiser la fonction f
en utilisant l'algorithme des régions de confiance avec
    - un pas de Couchy
ou
    - un pas calculé avec l'algorithme du gradient conjugue tronque
###########################################################################

#################################################################################
#Entrées :
    * algo        : string indicant la méthode à utiliser pour calculer le pas
                        - "gct" : pour l'algorithme du gradient conjugué tronqué
                        - "cauchy": pour le pas de Cauchy
    * f           : la fonction à minimiser
    * gradf       : le gradient de la fonction f
    * hessf       : la hessiene de la fonction à minimiser
    * x0          : point de dapart
    * deltaMax, 0 < gamma1 < 1, 1 < gamma2, 0 < eta1, eta1 < eta2 < 1  : utile pour les m-à-j de la region de confiance
    * delta0      : le rayon de départ
    * nb_itersMax : le nombre maximale d'iterations
    * tol         : la tolérence pour les critères d'arrêt

###############################################################################
#Sorties:

    * x_min    : le point minimisant la fonction f
    * fx_min   : la valeur minimale de la fonction f
    * nb_iters : le nombre d'iteration qu'à fait le programme
    * flag     : le critère d'arrêt
################################################################################
"""
function Regions_De_Confiance(algo,f::Function,gradf::Function,hessf::Function,x0,deltaMax,delta0,gamma1,gamma2,eta1,eta2,max_iter,tol)
    # Initialisation des variables
    nb_iters = 1
    max_iter_gct = max_iter
    grad0 = gradf(x0)
    xk = x0
    deltak = delta0
    eps = 1e-8
    flag = 0
    ###########################################################
    #                        Début                            #
    ###########################################################
    while true
        gradk = gradf(xk)
        hessk = hessf(xk)
        # calcul du point sk avec l'algorithme du point de cauchy
        if algo=="cauchy"
            sk, ~ = Pas_De_Cauchy(gradk,hessk,deltak)
        elseif algo=="gct"
            sk = Gradient_Conjugue_Tronque(f(xk),gradk,hessk,deltak,max_iter_gct,tol)
        else
            error("Pas d'algorithme portant le nom de "*algo*" !, Veuillez choisir \"gct\" ou \"cauchy\"")
        end
        decroissance_de_f = -(gradk') * sk - 0.5 * (sk') * hessk * sk
        # le ratio de la réduction observée sur f par rapport à réduction prédite sur mk
        rho_k = (f(xk)-f(xk + sk)) / decroissance_de_f
        # on garde la val de xk avant de la mettre à jour
        xk_moins_1 = xk
        # si on arrive à réaliser une decroissance > eta1 on met à jour de l'itéré courant
        # sinon on garde xk
        if rho_k >= eta1
            xk = xk + sk
        end
        # mise à jour du rayon de la région de confiance
        # si rho_k > eta2 on augmente le diametre de la region de confiance
        if rho_k >= eta2
            deltak = min(gamma2*deltak,deltaMax)
        # si eta1 < rho_k < eta2 on garde le même diametre
        elseif (rho_k >= eta1 && rho_k <= eta2)
            deltak = deltak
        # sinon on diminue le diametre de la region de confiance
        else
            deltak = gamma1*deltak
        end
        ###########################################################
        #                       Tests d'arrêt                     #
        ###########################################################
        # la CN1
         if norm(gradk,2)<=tol*norm(grad0,2)
            flag = 0
            break
         end
        # la stagnation de x (et le x courant a été changé)
         if (norm(sk,2) <= tol*(norm(xk,2) +eps )) && xk_moins_1 != xk
            flag = 1
            break
         end
         # la stagnation de f (et le x courant a été changé)
         if (abs(f(xk_moins_1)-f(xk)) <= tol*( abs(f(xk))+eps )) && xk != xk_moins_1
             flag = 2
             break
         end
         # le nombre d'itérations dépasse le nombre maximal
         if nb_iters >= max_iter
             flag = 3
             break
         end
         nb_iters = nb_iters +1
    end

    return xk, nb_iters, f(xk), flag
end
