include("fonctions_de_tests.jl")
include("../src/Algorithme_de_Newton.jl")

tol1 = 1e-6
tol2 = tol1
tol3 = tol1
maxits = 50

x_min, fx_min, flag, nb_iters = Algorithme_de_Newton(fct1,grad_fct1,hess_fct1,x011,tol1,tol2,tol3,maxits)
println("-------------------------------------------------------------------------")
println("Résultats de l'algorithme de Newton avec la fct1 et le point initial x011:")
println("    * xsol = ",x_min)
println("    * f(xsol) = ",fx_min)
println("    * flag = ",flag)
println("    * nb_iters = ",nb_iters)

x_min, fx_min, flag, nb_iters = Algorithme_de_Newton(fct1,grad_fct1,hess_fct1,x012,tol1,tol2,tol3,maxits)
println("-------------------------------------------------------------------------")
println("Résultats de l'algorithme de Newton avec la fct1 et le point initial x012:")
println("    * xsol = ",x_min)
println("    * f(xsol) = ",fx_min)
println("    * flag = ",flag)
println("    * nb_iters = ",nb_iters)

x_min, fx_min, flag, nb_iters = Algorithme_de_Newton(fct2,grad_fct2,hess_fct2,x021,tol1,tol2,tol3,maxits)
println("-------------------------------------------------------------------------")
println("Résultats de l'algorithme de Newton avec la fct2 et le point initial x021:")
println("    * xsol = ",x_min)
println("    * f(xsol) = ",fx_min)
println("    * flag = ",flag)
println("    * nb_iters = ",nb_iters)

x_min, fx_min, flag, nb_iters = Algorithme_de_Newton(fct2,grad_fct2,hess_fct2,x022,tol1,tol2,tol3,maxits)
println("-------------------------------------------------------------------------")
println("Résultats de l'algorithme de Newton avec la fct2 et le point initial x022:")
println("    * xsol = ",x_min)
println("    * f(xsol) = ",fx_min)
println("    * flag = ",flag)
println("    * nb_iters = ",nb_iters)

x_min, fx_min, flag, nb_iters = Algorithme_de_Newton(fct2,grad_fct2,hess_fct2,x023,tol1,tol2,tol3,maxits)
println("-------------------------------------------------------------------------")
println("Résultats de l'algorithme de Newton avec la fct2 et le point initial x023:")
println("    * xsol = ",x_min)
println("    * f(xsol) = ",fx_min)
println("    * flag = ",flag)
println("    * nb_iters = ",nb_iters)
