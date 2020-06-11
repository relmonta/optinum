"""
###################################################################################################
	Algorithme_de_Newton: donne le minimum de la fonction f suivant l'algorithme de Newton
###################################################################################################

#################################################################################
#Entrées :
    * f               : la fonction à minimiser
    * gradf           : le gradient de la fonction f
    * hessf           : la Hessienne de la fonction f
    * x0              : première approximation de la solution cherchée
    * option          :
                * eps             : pour fixer les conditions d'arrêt
                * nb_iters_max    : le nombre maximal d'iterations
                * tol             : pour les condition d'arrêts


#################################################################################
#Sorties:
    * x_min           : le point minimisant la fonction f
    * fx_min          : la valeur de f en x_min
    * flag            : entier indiquant le critère sur lequel le programme à arrêter
	        	    0 : Convergence
	        	    1 : stagnation du xk
	        	    2 : stagnation du f
	        	    3 : nombre maximal d'itération dépassé
    * nb_iters        : le nombre d'itérations faites par le programme
#################################################################################
"""

function Algorithme_de_Newton(f::Function,gradf::Function,hessf::Function,x0,option)

        "# Si option est vide on initialise les 3 paramètres par défaut"       
        if option == []
                eps = 1e-8
                nb_iters_max = 100
                tol = 1e-15
        else
                eps = option[1]
                nb_iters_max = option[2]
                tol = option[3]

        end

        xk = x0
        flag = 0
        nb_iters = 1
        gradZero = gradf(x0)
        dk = hessf(x0)\(-gradf(x0))
        xk1 = xk + dk

        while true
        xk = xk1

        "#direction de Newton"
        dk = hessf(xk)\(-gradf(xk))

        "# mise à jour du xk"
        xk1 = xk + dk

        "# le gradient du xk courant"
        grad = gradf(xk)

        "
        ###########################################################
        #                       Tests d'arrêt                     #
        ###########################################################
        "

        "# la CN1"
        if norm(grad)<(tol*norm(gradZero) +eps)
                flag = 0
                break

        "# la stagnation du xk"
        elseif norm(dk) < (tol*norm(xk) + eps)
                flag = 1
                break

        "# la stagnation du f"
        elseif abs(f(xk1)-f(xk))< (tol*abs(f(xk)) + eps)
                flag = 2
                break

        "# le nombre d'itérations dépasse le max"
        elseif nb_iters > nb_iters_max
                flag = 3
                break
        end

        nb_iters = nb_iters +1
        end

        fx_min = f(xk)
        return xk,fx_min,flag,nb_iters
end
