"""
###################################################################################################
	Gradient_Conjugue_Tronque : minimise le problème : min q(s) avec ||s||< deltak
                                pour l'itération k de l'algorithme des regions de confiance
###################################################################################################

#################################################################################
# Entrées :
    * fk               : la fonction à minimiser appliqué au point xk
    * gradfk           : le gradient de la fonction f appliqué au point xk
    * hessfk           : la Hessienne de la fonction f appliqué au point xk
    * option           :
            * delta            : le rayon de la région de confiance
            * max_iter         : le nombre maximal d'iterations
            * tol              : la tolerance pour la condition d'arrêt sur le gradient

#################################################################################
# Sorties:
    * s                : le pas s qui approche la solution du problème : min q(s) avec ||s||< deltak
#################################################################################
# Exemple d'appel:
    * >> include("fonctions_de_tests.jl")
    * >> s_min1=Gradient_Conjugue_Tronque(fct1([10;0;3]),grad_fct1([10;0;3]),hess_fct1([10;0;3]),1,[10;0;3],100,1e-15)
"""
function Gradient_Conjugue_Tronque(fk,gradfk,hessfk,option)

    "# Si option est vide on initialise les 3 paramètres par défaut"       
    if option == []
        deltak = 2
        max_iter = 1000
        tol = 1e-6
    else 
        deltak = option[1]
        max_iter = option[2]
        tol = option[3]
    end

   "#pj est le vecteur de direction"
   n = length(gradfk)
   pj = -gradfk
   sj = zeros(n)
   gj = gradfk
   iter = 0
   s = zeros(n)
   
   while  iter <= max_iter
        kappa_j = (pj') * hessfk * pj

        if kappa_j <= 0
        
            "# on écrit l'équation ||sj +x*pj|| = delta sous forme a*x^2 + b*x + c = 0 avec :"
            a = norm(pj)^2
            b = 2 * (sj') * pj
            c = norm(sj)^2 - deltak^2
            sqrt_determinant = sqrt(b^2 -4 * a * c)
            
            "# les racines de l'équation sont"
            racine1 = (- b - sqrt_determinant) / (2 * a)
            racine2 = (- b + sqrt_determinant) / (2 * a)
            
            "# calcul de q(sj + racine1*pj)"
            q_racine1 = (gj')*(sj + racine1*pj) +(1 / 2) * ((sj + racine1*pj)') * hessfk * (sj + racine1 * pj)
            "# calcul de q(sj + racine2*pj)"
            q_racine2 = (gj')*(sj + racine2*pj) +(1 / 2) * ((sj + racine2*pj)') * hessfk * (sj + racine2 * pj)
            
            "# on garde le s pour lequel la valeur de q est la plus petite"
            if q_racine1 < q_racine2
                sigma = racine1
            else
                sigma = racine2
            end
            s = sj + sigma * pj
            break
        end

       alphaj = norm(gj,2)^2 / kappa_j
       if norm(sj + alphaj * pj,2) >= deltak
       
            "# sigmaj est la racine positive de l’equation ‖sj+σpj‖ = ∆k"
            sigmaj = - norm(sj,2) + deltak / norm(pj,2)
            s = sj + sigmaj * pj
            break
       end
       
       "# Mise à jour des paramétres"
       sj = sj + alphaj*pj
       gjplus1 = gj + alphaj * hessfk * pj
       betaj = (norm(gjplus1,2) / norm(gj,2))^2
       pj = -gjplus1 + betaj * pj
       gj = gjplus1
       if (norm(gj,2)<tol*norm((gradfk),2))
            s = sj
            break
       end
       iter = iter + 1
   end
   return s
end
