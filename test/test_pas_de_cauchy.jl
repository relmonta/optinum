include("../src/Pas_De_Cauchy.jl")


"#test de l'algorithme de pas de cauchy :
 #on test : la saturation/non satiration de la boule et la nullité du gradient"

"""
   #Entrées :
	#affichage : boolean , si true on affiche les sorties de chaque test
	
"""

function test_pas_de_cauchy(affichage)


"# Pour la quadratique 1"
g1 = [0; 0]
H1 = [7 0 ; 0 2]
delta1 = 1
s1, e1 = Pas_De_Cauchy(g1,H1,delta1)



"# Pour la quadratique 2"
g2 = [6; 2]
H2 = [7 0 ; 0 2]
delta2 =3
s2, e2 = Pas_De_Cauchy(g2,H2,delta2)



"# Pour la quadratique 3"
g3 = [-2; 1]
H3 = [-2 0 ; 0 10]
delta3 = 10
s3, e3 = Pas_De_Cauchy(g3,H3,delta3)


res = @testset "cauchy" begin 
           @test e1 == 0
           @test e2 == 1
           @test e3 == 1
end
println("\n")

return 

end
