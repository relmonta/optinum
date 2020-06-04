"""
 Fonction qui calcule Le sous-problème du règion de confiance avec la mèthode de descente de gradien
 % (P):    min‖s‖≤∆k q(s) = (g')*s+(0.5)*(s')*Hk*s

#Syntaxe
#Entrée
#Sortie
#Exemple d'appel

%la méthode prend en paramétres :
%la fonction : f
%le gradient de la fonction : gradf
%la hessienne de la fonction : hessf
%le rayon de la boule : deltak
%le point xk est tel que :
        % g=∇f(xk) et H=∇2f(xk)
%l sortie s est la solution du (P)
"""
function Gradient_Conjugue_Tronque(f::Function,gradf::Function,hessf::Function,deltak,xk,max_iter,tol)

   #pj est le vecteur de direction
   pj = -gradf(xk)
   sj = 0
   fk = f(xk)
   gj = gradf(xk)
   iter = 0
   s = zeros(size(gj))

    while  iter <= max_iter
        kj = (pj')*hessf(xk)*pj
        println(kj)
        if (kj <=0)
            # sigmaj est la solution de l'équation de ‖sj+σpj‖= ∆k
            x1 = -(norm(sj,2)+deltak)/norm(pj,2)
            x2 = (-norm(sj,2)+deltak)/norm(pj,2)
            q1 = fk + (gj')*(sj + x1*pj) + 0.5*((sj + x1*pj)')*hessf(xk)*(sj + x1*pj)
            q2 = fk + (gj')*(sj + x2*pj) + 0.5*((sj + x2*pj)')*hessf(xk)*(sj + x2*pj)

            if (q1 < q2)
             sigmaj = x1
            else
             sigmaj = x2
            end
            s = sj + sigmaj*pj
            return
       end
       alphaj = (gj')*gj/kj;
       if norm(sj .+alphaj*pj,2) >= deltak
              #sigmaj est la solution positive de l’equation ‖sj+σpj‖ = ∆k
              sigmaj = -norm(sj,2)+deltak/norm(pj,2);
              s = sj .+ sigmaj*pj;
              break
       end
       #Mise à jourdes paramétres
       sj = sj .+ alphaj*pj
       gj1 = gj .+ alphaj*hessf(xk)*pj
       betaj = (norm(gj1,2)/norm(gj,2))^2
       gj = gj1
       pj = -gj .+ betaj*pj
       if (norm(gj,2)<tol*norm((gradf(xk)),2))
           s = sj
           return
       end
        iter = iter + 1
   end
   return s
end
