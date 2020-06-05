include("../src/Pas_De_Cauchy.jl")

printstyled("Lancement des tests sur",bold=true,color=:white)
printstyled(" le pas de cauchy ",bold=true,color=:blue)

# Pour la quadratique 1
g1 = [0; 0]
H1 = [7 0 ; 0 2]
delta1 = 1
s1, e1 = Pas_De_Cauchy(g1,H1,delta1)
@test e1 == 0
printstyled("=",bold=true,color=:white)


# Pour la quadratique 2
g2 = [6; 2]
H2 = [7 0 ; 0 2]
delta2 =3
s2, e2 = Pas_De_Cauchy(g2,H2,delta2)
@test e2 ==1
printstyled("=",bold=true,color=:white)


# Pour la quadratique 3
g3 = [-2; 1]
H3 = [-2 0 ; 0 10]
delta3 = 10
s3, e3 = Pas_De_Cauchy(g3,H3,delta3)
@test e3 == 1
printstyled("=>",bold=true,color=:white)
printstyled(" Tous les tests sont réussis ! \n",bold=true,color=:green)
