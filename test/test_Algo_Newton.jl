using LinearAlgebra, Test
include("fonctions_de_tests.jl")
include("../src/Algorithme_De_Newton.jl")

"#test de l'algorithme de newton"

"""
   #Entrées :
	#affichage : boolean , si true on affiche les sorties de chaque test
"""

"#afficher_resultats nous affiche les sorties de l'algo"
function afficher_resultats(nom_fct,point_init,xmin,fxmin,flag,sol_exacte,nbiters)
	println("-------------------------------------------------------------------------")
	printstyled("Résultats de l'algorithme de Newton avec la fonction "*nom_fct*" et au point initial "*point_init*" :\n",bold=true,color=:blue)
	println("  * solution trouvée (xsol) = ",xmin)
	println("  * f(xsol) = ",fxmin)
	println("  * nombre d'itération = ",nbiters)
	println("  * flag = ",flag)
	println("  * solution attendue : " , sol_exacte)
end

function test_Algo_Newton(affichage)

eps = 1e-6
maxits = 50
tol = 1e-15

option = [eps;maxits;tol]


normerreur = 1e-2


x_min11, fx_min, flag, nb_iters = Algorithme_De_Newton(fct1,grad_fct1,hess_fct1,x011,option)
if (affichage)
	afficher_resultats("fct1","x011",x_min11,fx_min,flag,sol_exacte_fct1,nb_iters)
end


x_min12, fx_min, flag, nb_iters = Algorithme_De_Newton(fct1,grad_fct1,hess_fct1,x012,[])

if (affichage)
	afficher_resultats("fct1","x012",x_min12,fx_min,flag,sol_exacte_fct1,nb_iters)
end


x_min21, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,x021,[])

if (affichage)
	afficher_resultats("fct2","x021",x_min21,fx_min,flag,sol_exacte_fct2,nb_iters)
end


x_min22, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,x022,[])


if (affichage)
	afficher_resultats("fct2","x022",x_min22,fx_min,flag,sol_exacte_fct2,nb_iters)
	println("\n")
end


#=
x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,x023,eps,maxits)
#@test norm(x_min-sol_exacte_fct2,2) < 1e-2
#@test norm(fx_min)<1e-5
if norm(x_min-sol_exacte_fct2,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=> ",bold=true,color=:white)
nbtest_total = nbtest_total + 1

if (affichage)
	println("-------------------------------------------------------------------------")
	println("Résultats de l'algorithme de Newton avec la fct2 et le point initial x023:")
	println("    * xsol = ",x_min)
	println("    * f(xsol) = ",fx_min)
	println("    * flag = ",flag)
	println("    * nb_iters = ",nb_iters)
end
=#


"# tests avec les annotations de la librairie Test"

res = @testset "L'algorithme de Newton" begin 
           @test isapprox(x_min11, sol_exacte_fct1 ,atol=normerreur)
           @test x_min12 ≈ sol_exacte_fct1 atol=normerreur
           @test x_min21 ≈ sol_exacte_fct2 atol=normerreur
           @test x_min22 ≈ sol_exacte_fct2 atol=normerreur
end
println("\n")

return 

end
