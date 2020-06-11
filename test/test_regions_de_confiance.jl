include("fonctions_de_tests.jl")
include("../src/Regions_de_confiance.jl")


" #test de l'algorithme de la region de confiance "

"""
   #Entrées :
	#affichage : boolean , si true on affiche les sorties de chaque test
   #Sorties :
	#nbTests_reussis : nombre de tests réussis
	#nbTests_total : nombre de tests total effectués
"""

function test_regions_de_confiance(affichage)

"#initialisation des variables de l'algorithme"
tolG = 1e-5
gamma1 = 0.5
gamma2 = 2.00
eta1 = 0.25
eta2 = 0.75
deltaMax = 1
tol = 1e-8
maxits = 5000
delta0_1 = 2
delta0_2 = 1

option1 =[deltaMax,gamma1,gamma2,eta1,eta2,delta0_1,maxits,tol]
option2 =[deltaMax,gamma1,gamma2,eta1,eta2,delta0_2,maxits,tol]

nbTests_reussis = 0
nbTests_total = 0
normerreur = 1e-2

"#test avec la fonction f1 et point initial x01"
RC_x_min11, RC_nb_iters11, RC_fmin11, RC_flag11 = Regions_De_Confiance("cauchy",fct1,grad_fct1,hess_fct1,x011,option1)
#@test norm(RC_x_min11-sol_exacte_fct1,2) < 1e-2
#@test norm(RC_fmin11)<1e-10
if norm(RC_x_min11-sol_exacte_fct1,2) < 1e-2
	nbTests_reussis = nbTests_reussis + 1
end
#printstyled("=",bold=true,color=:white)
nbTests_total = nbTests_total + 1


"#test avec la fonction f1 et point initial x02"
RC_x_min12, RC_nb_iters12, RC_fmin12, RC_flag12 = Regions_De_Confiance("cauchy",fct1,grad_fct1,hess_fct1,x012,option1)
#@test norm(RC_x_min12-sol_exacte_fct1,2) < 1e-2
#@test norm(RC_fmin12)<1e-10
if norm(RC_x_min12-sol_exacte_fct1,2) < 1e-2
	nbTests_reussis = nbTests_reussis + 1
end
#printstyled("=",bold=true,color=:white)
nbTests_total = nbTests_total + 1


"#test avec la fonction f2 et point initial x02"
RC_x_min21, RC_nb_iters21, RC_fmin21, RC_flag21 = Regions_De_Confiance("cauchy",fct2,grad_fct2,hess_fct2,x021,option2)
#@test norm(RC_x_min21-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin21)<1e-5
if norm(RC_x_min21-sol_exacte_fct2,2) < 1e-2
	nbTests_reussis = nbTests_reussis + 1
end
#printstyled("=",bold=true,color=:white)
nbTests_total = nbTests_total + 1


"#test avec la fonction f2 et point initial x022"
RC_x_min22, RC_nb_iters22, RC_fmin22, RC_flag22 = Regions_De_Confiance("cauchy",fct2,grad_fct2,hess_fct2,x022,option2)
#@test norm(RC_x_min22-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin22)<1e-5
if norm(RC_x_min22-sol_exacte_fct2,2) < 1e-2
	nbTests_reussis = nbTests_reussis + 1
end
#printstyled("=",bold=true,color=:white)
nbTests_total = nbTests_total + 1


"#test avec la fonction f2 et point initial x023"
RC_x_min23, RC_nb_iters23, RC_fmin23, RC_flag23 = Regions_De_Confiance("cauchy",fct2,grad_fct2,hess_fct2,x023,option2)
#@test norm(RC_x_min23-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin23)<1e-5
if norm(RC_x_min23-sol_exacte_fct2,2) < 1e-2
	nbTests_reussis = nbTests_reussis + 1
end
#printstyled("=> ",bold=true,color=:white)
nbTests_total = nbTests_total + 1





"#test avec la fonction f1 et point initial x011"
gct_x_min11, RC_nb_iters11, RC_fmin11, RC_flag11 = Regions_De_Confiance("gct",fct1,grad_fct1,hess_fct1,x011,option1)
#@test norm(RC_x_min11-sol_exacte_fct1,2) < 1e-2
#@test norm(RC_fmin11)<1e-10
if norm(gct_x_min11-sol_exacte_fct1,2) < 1e-2
	nbTests_reussis = nbTests_reussis + 1
end
#printstyled("=",bold=true,color=:white)
nbTests_total = nbTests_total + 1


"#test avec la fonction f1 et point initial x012"
gct_x_min12, RC_nb_iters12, RC_fmin12, RC_flag12 = Regions_De_Confiance("gct",fct1,grad_fct1,hess_fct1,x012,option1)
#@test norm(RC_x_min12-sol_exacte_fct1,2) < 1e-2
#@test norm(RC_fmin12)<1e-10
if norm(gct_x_min12-sol_exacte_fct1,2) < 1e-2
	nbTests_reussis = nbTests_reussis + 1
end
#printstyled("=",bold=true,color=:white)
nbTests_total = nbTests_total + 1


"#test avec la fonction f2 et point initial x021"
gct_x_min21, RC_nb_iters21, RC_fmin21, RC_flag21 = Regions_De_Confiance("gct",fct2,grad_fct2,hess_fct2,x021,option2)
#@test norm(RC_x_min21-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin21)<1e-10
if norm(gct_x_min21-sol_exacte_fct2,2) < 1e-2
	nbTests_reussis = nbTests_reussis + 1
end
#printstyled("=",bold=true,color=:white)
nbTests_total = nbTests_total + 1


"#test avec la fonction f2 et point initial x022"
gct_x_min22, RC_nb_iters22, RC_fmin22, RC_flag22 = Regions_De_Confiance("gct",fct2,grad_fct2,hess_fct2,x022,option2)
#@test norm(RC_x_min22-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin22)<1e-10
if norm(gct_x_min22-sol_exacte_fct2,2) < 1e-2
	nbTests_reussis = nbTests_reussis + 1
end
#printstyled("=",bold=true,color=:white)
nbTests_total = nbTests_total + 1


"#test avec la fonction f2 et point initial x023"
gct_x_min23, RC_nb_iters23, RC_fmin23, RC_flag23 = Regions_De_Confiance("gct",fct2,grad_fct2,hess_fct2,x023,option2)
#@test norm(RC_x_min23-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin23)<1e-10
if norm(gct_x_min23-sol_exacte_fct2,2) < 1e-2
	nbTests_reussis = nbTests_reussis + 1
end
#printstyled("=> ",bold=true,color=:white)
nbTests_total = nbTests_total + 1


#printstyled(" Tous les tests sont réussis ! \n",bold=true,color=:green)
"#tester les résultats obtenues"
res = @testset "région de confiance " begin 
	res = @testset "région de confiance avec le pas de cauchy " begin 
           @test isapprox(RC_x_min11,sol_exacte_fct1 ,atol=normerreur)
           @test RC_x_min12 ≈ sol_exacte_fct1 atol=normerreur
           @test RC_x_min21 ≈ sol_exacte_fct2 atol=normerreur
           @test RC_x_min22 ≈ sol_exacte_fct2 atol=normerreur
           @test RC_x_min23 ≈ sol_exacte_fct2 atol=normerreur
	end

	res = @testset "région de confiance avec le gradient conjugué tronqué " begin 
           @test isapprox(gct_x_min11,sol_exacte_fct1 ,atol=normerreur)
           @test gct_x_min12 ≈ sol_exacte_fct1 atol=normerreur
           @test gct_x_min21 ≈ sol_exacte_fct2 atol=normerreur
           @test gct_x_min22 ≈ sol_exacte_fct2 atol=normerreur
           @test gct_x_min23 ≈ sol_exacte_fct2 atol=normerreur
	end
	
end
println("\n")


return 

end
