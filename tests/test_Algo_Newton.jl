include("fonctions_de_tests.jl")
include("../src/Algorithme_de_Newton.jl")

"#test de l'algorithme de newton"

"""
   #Entrées :
	#affichage : boolean , si true on affiche les sorties de chaque test
   #Sorties :
	#nbtest_reu : nombre de tests réussis 
	#nbtest_total : nombre de tests total effectués
"""

function test_Algo_Newton(affichage)

eps = 1e-6
maxits = 50
nbtest_reu = 0
nbtest_total = 0



x_min, fx_min, flag, nb_iters = Algorithme_de_Newton(fct1,grad_fct1,hess_fct1,x011,eps,maxits)
#@test norm(x_min-sol_exacte_fct1,2) < 1e-2
#@test norm(fx_min)<1e-10
if norm(x_min-sol_exacte_fct1,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1


if (affichage)
	println("-------------------------------------------------------------------------")
	println("Résultats de l'algorithme de Newton avec la fct1 et le point initial x011:")
	println("    * xsol = ",x_min)
	println("    * f(xsol) = ",fx_min)
	println("    * flag = ",flag)
	println("    * nb_iters = ",nb_iters)
end
x_min, fx_min, flag, nb_iters = Algorithme_de_Newton(fct1,grad_fct1,hess_fct1,x012,eps,maxits)
#@test norm(x_min-sol_exacte_fct1,2) < 1e-2
#@test norm(fx_min)<1e-10
if norm(x_min-sol_exacte_fct1,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1

if (affichage)
	println("-------------------------------------------------------------------------")
	println("Résultats de l'algorithme de Newton avec la fct1 et le point initial x012:")
	println("    * xsol = ",x_min)
	println("    * f(xsol) = ",fx_min)
	println("    * flag = ",flag)
	println("    * nb_iters = ",nb_iters)
end
x_min, fx_min, flag, nb_iters = Algorithme_de_Newton(fct2,grad_fct2,hess_fct2,x021,eps,maxits)
#@test norm(x_min-sol_exacte_fct2,2) < 1e-2
#@test norm(fx_min)<1e-5
if norm(x_min-sol_exacte_fct2,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1

if (affichage)
	println("-------------------------------------------------------------------------")
	println("Résultats de l'algorithme de Newton avec la fct2 et le point initial x021:")
	println("    * xsol = ",x_min)
	println("    * f(xsol) = ",fx_min)
	println("    * flag = ",flag)
	println("    * nb_iters = ",nb_iters)
end
x_min, fx_min, flag, nb_iters = Algorithme_de_Newton(fct2,grad_fct2,hess_fct2,x022,eps,maxits)
#@test norm(x_min-sol_exacte_fct2,2) < 1e-2
#@test norm(fx_min)<1e-5
if norm(x_min-sol_exacte_fct2,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=> ",bold=true,color=:white)
nbtest_total = nbtest_total + 1



if (affichage)
	println("-------------------------------------------------------------------------")
	println("Résultats de l'algorithme de Newton avec la fct2 et le point initial x022:")
	println("    * xsol = ",x_min)
	println("    * f(xsol) = ",fx_min)
	println("    * flag = ",flag)
	println("    * nb_iters = ",nb_iters)
end

#=
x_min, fx_min, flag, nb_iters = Algorithme_de_Newton(fct2,grad_fct2,hess_fct2,x023,eps,maxits)
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

#printstyled(" Tous les tests sont réussis ! \n",bold=true,color=:green)


return (nbtest_reu,nbtest_total)

end
