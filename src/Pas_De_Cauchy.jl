"""

Minimise la quadratique ``q_k(s) = s^{t}g + (1/2)s^{t}Hs`` sous la contrainte ``||s||< deltak``
                        et dans la direction opposée au gradient pour l'itération k de l'algorithme des regions de confiance

# Syntaxe
```julia 
s1, e1 = Pas_De_Cauchy(gradient,Hessienne,delta)
```

# Entrées 
    * gradfk           : le gradient de la fonction f appliqué au point xk
    * hessfk           : la Hessienne de la fonction f appliqué au point xk
    * delta            : le rayon de la région de confiance

# Sorties
    * s                : le point s solution sous containte de la quadratique qk(s) = s'g + (1/2)s'Hs
    * e                : indice indiquant l'état de sortie:
                            si g != 0
                                si on ne sature pas la boule
                                  e <- 1
                                sinon
                                  e <- -1
                            sinon
                                e <- 0

# Exemple d'appel
```julia
g1 = [0; 0]
H1 = [7 0 ; 0 2]
delta1 = 1
s1, e1 = Pas_De_Cauchy(g1,H1,delta1)
```
"""

function Pas_De_Cauchy(g,H,delta)

    norme_de_g = norm(g);

    "# si le gradient est non nul "
    if norme_de_g > 0
        t = norme_de_g^2 / (g' * H * g)     #t = -b/2a
        s = -t*g
        e = 1

        "# si on sature la boule on change le s par le point limite"
        if norm(s) > delta
                s = - (delta / norme_de_g) * g
                e = -1
        end
        "# sinon on a deja calculer le s"

    "# si le gradient est nul"
    else
        t = 0
        s = t*g
        e = 0
    end
    return s, e
end
