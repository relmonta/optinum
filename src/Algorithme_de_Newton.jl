"""
Algorithme_de_Newton: donne le minimum de la fonction f suivant l'algorithme de Newton
parametres:
    * f           : la fonction à minimiser
    * graf        : le gradient de la fonction f
    * hessf       : la Hessienne de la fonction f
    * x0          :  première approximation de la solution cherchée
    * tol1        : la tolérence pour la 1ere condition d'arrêt
    * tol2        : la tolérence pour la 2ere condition d'arrêt
    * tol3        : la tolérence pour la 3ere condition d'arrêt
    * nb_iters_max: le nombre maximal d'iterations
Sorties:
    * x_min           : le point minimisant la fonction f
    * fx_min          : la valeur de f en x_min
    * flag            : entier indiquant le critère sur lequel le programme à arrêter
    * nb_iters        : le nombre d'itérations faites par le programme
"""

function Algorithme_de_Newton(f::Function,gradf::Function,hessf::Function,x0,tol1,tol2,tol3,nb_iters_max)

    # Initialisation des variables
    gradZero = gradf(x0)
    nb_iters = 0
    xk = x0'
    x_k1 = xk
    eps = 1e-6
    flag = 0

    # constante utile pour les conditions d'arrêt
    w = sqrt(eps)


    ###########################################################
    #                        Début                            #
    ###########################################################

    while true

        grad = gradf(xk)   # le gradient du xk courant
        hess = hessf(xk)   # la hessienne du xk courant
        dk = -hess\grad    # la solution du système
        x_k1 = xk
        xk = x_k1 + dk       # mise à jour du xk

        ###########################################################
        #                       Tests d'arrêt                     #
        ###########################################################

        # la CN1
        if norm(grad)<tol1*norm(gradZero)
                flag = 0
                break
        end

        # la stagnation du xk
        if norm(dk) < tol2*(norm(x_k1) +w )
                flag = 1
                break
        end
        # la stagnation du f
        if abs(f(x_k1)-f(xk))< tol3*( abs(f(x_k1))+w )
                flag = 2
                break
        end

        # le nombre d'itérations dépasse le max
        if nb_iters > nb_iters_max
                flag = 3
                break
        end

        nb_iters = nb_iters +1

    end
    x_min = x_k1

    fx_min = f(x_k1)

    return x_min, fx_min, flag, nb_iters
end
