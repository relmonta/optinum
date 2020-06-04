"""
Pas_De_Cauchy: Calcule le pas de Cauchy
paramètres:
    * g: le gradient
    * H: la matrice hessienne
    * delta: le rayon de la région de confiance
sorties:
    * s: le point s solution sous containte de la quadratique qk(s) = s'g + (1/2)s'Hs
    * e: indice indiquant l'état de sortie:
            si g != 0
                si on ne sature pas la boule
                  e <- 1
                sinon
                  e <- -1
            sinon
                e <- 0
"""

function Pas_De_Cauchy(g,H,delta)

        g_norm = norm(g);

        # si g n'est pas le vecteur null
        if g_norm > 0
            t = g_norm^2/(g'*H*g);     #t = -b/2a
            s = -t*g;
            e = 1;

            #  si on sature la boule on change le s par le point limite
            if norm(s) > delta
                    s = - (delta/g_norm)*g;
                    e = -1;
            end
            #sinon on a deja calculer le s

        # si g est le vecteur null
        else
            t = 0;
            s = t*g;
            e = 0;
        end

        return s, e

end
