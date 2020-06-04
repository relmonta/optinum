include("Pas_De_Cauchy.jl")
"""
Region_De_Confiance_Avec_PasDeCauchy : minimiser la fonction f en utilisant l'algorithme de la région de confiance avec pas de cauchy

Paramètres:
    * x0 : point de dapart
    * deltaMax, gamma1, gamma2, n1, n2 : utile pour les mise à jour de delta
    * delta0 : le rayon de départ
    * f : la fonction à minimiser
    * gradf : le gradient de la fonction f
    * hessf : la hessiene de la fonction à minimiser
    * nb_itersMax : le nombre maximale d'iterations
    * tol1 : la tolérence pour le 1er critère d'arrêt
    * tol2 : la tolérence pour le 2eme critère d'arrêt
    * tol3 : la tolérence pour le 3eme critère d'arrêt

Sorties:

    * x_min : le point minimisant la fonction f
    * fx_min : la valeur minimale de la fonction f
    * nb_iters : le nombre d'iteration qu'à fait le programme
    * flag : le critère d'arrêt

"""


function Region_De_Confiance_Avec_PasDeCauchy(f::Function,gradf::Function,hessf::Function,x0,deltaMax,delta0,gamma1,gamma2,n1,n2,nb_itersMax,tol1,tol2,tol3)


    # Initialisation des variables
    nb_iters = 0
    gradZero = gradf(x0)
    xk = x0
    deltak = delta0
    w = 1e-8
    flag = 0
    ###########################################################
    #                        Début                            #
    ###########################################################

    while true

        gk = gradf(xk)
        Hk = hessf(xk)
        # calcul du point sk avec l'algorithme du point de cauchy
        sk, e = Pas_De_Cauchy(gk,Hk,deltak)
        decroi = -gk'*sk + -(1/2)*sk'*Hk*sk
        x_k1 = xk + sk

        # le ratio de la réduction observée sur f par rapport à réduction
        # prédite sur mk
        pk = (f(xk)-f(x_k1))/(decroi)

        # on garde la val de xk avant de la mettre à jour
        xk_1 = xk

        # mise à jour de l'itéré courant
        if pk >= n1
            xk = x_k1

        end


        # mise à jour du rayon de la région de confiance
        if pk >= n2
            deltak = min(gamma2*deltak,deltaMax)
        elseif (pk >= n1 && pk <= n2)
            deltak = deltak
        else
            deltak = gamma1*deltak
        end


        ###########################################################
        #                       Tests d'arrêt                     #
        ###########################################################

        # la CN1
         if norm(gk)<tol1*norm(gradZero)
            flag = 0
            break
         end
        # la stagnation de x (et le x courant a été changé)
         if (norm(sk) < tol2*(norm(xk) +w ) && xk_1 != xk)
            flag = 1
            break
         end
         # la stagnation de f (et le x courant a été changé)
         if (abs(f(xk_1)-f(xk))< tol3*( abs(f(xk))+w ) && xk != xk_1)
             flag = 2
             break
         end
         # le nombre d'itérations dépasse le nombre maximal
         if nb_iters > nb_itersMax
             flag = 3
             break
         end
         nb_iters = nb_iters +1


    end

    x_min = xk
    fx_min = f(xk)

    return x_min, nb_iters, fx_min, flag

end
