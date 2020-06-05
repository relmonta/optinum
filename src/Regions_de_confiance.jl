
include("Pas_De_Cauchy.jl")
include("Gradient_Conjugue_Tronque.jl")

"""
Region_De_Confiance: minimiser la fonction f
en utilisant l'algorithme des régions de confiance avec
    - un pas de Couchy
ou
    - un pas calculé avec l'algorithme du gradient conjugue tronque

Paramètres:
    * x0 : point de dapart
    * deltaMax, gamma1, gamma2, n1, n2 : utile pour les mise à jour de delta
    * delta0 : le rayon de départ
    * f : la fonction à minimiser
    * gradf : le gradient de la fonction f
    * hessf : la hessiene de la fonction à minimiser
    * nb_itersMax : le nombre maximale d'iterations
    * tol : la tolérence pour les critères d'arrêt
Sorties:

    * x_min : le point minimisant la fonction f
    * fx_min : la valeur minimale de la fonction f
    * nb_iters : le nombre d'iteration qu'à fait le programme
    * flag : le critère d'arrêt

"""
function Regions_De_Confiance(algo,f::Function,gradf::Function,hessf::Function,x0,deltaMax,delta0,gamma1,gamma2,n1,n2,max_iter,tol)
    # Initialisation des variables
    nb_iters = 0
    gradZero = gradf(x0)
    xk = x0
    deltak = delta0
    eps = 1e-8
    flag = 0
    ###########################################################
    #                        Début                            #
    ###########################################################
    while true
        gk = gradf(xk)
        Hk = hessf(xk)
        # calcul du point sk avec l'algorithme du point de cauchy
        if algo=="cauchy"
            sk, e = Pas_De_Cauchy(gk,Hk,deltak)
        else
            sk = Gradient_Conjugue_Tronque(f,gradf,hessf,deltak,xk,max_iter,tol)
            e = 0
        end
        decroi = -(gk')*sk + -0.5*(sk')*Hk*sk
        # le ratio de la réduction observée sur f par rapport à réduction prédite sur mk
        rho_k = (f(xk)-f(xk + sk))/(decroi)
        # on garde la val de xk avant de la mettre à jour
        xk_moins_1 = xk
        # mise à jour de l'itéré courant
        if rho_k >= n1
            xk = xk + sk
        end
        # mise à jour du rayon de la région de confiance
        if rho_k >= n2
            deltak = min(gamma2*deltak,deltaMax)
        elseif (rho_k >= n1 && rho_k <= n2)
            deltak = deltak
        else
            deltak = gamma1*deltak
        end
        ###########################################################
        #                       Tests d'arrêt                     #
        ###########################################################
        # la CN1
         if norm(gk,2)<tol*norm(gradZero,2)
            flag = 0
            break
         end
        # la stagnation de x (et le x courant a été changé)
         if (norm(sk,2) <= tol*(norm(xk,2) +eps ) && xk_moins_1 != xk)
            flag = 1
            break
         end
         # la stagnation de f (et le x courant a été changé)
         if (abs(f(xk_moins_1)-f(xk)) <= tol*( abs(f(xk))+eps ) && xk != xk_moins_1)
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
    x_min = xk
    fx_min = f(xk)
    return x_min, nb_iters, fx_min, flag
end
