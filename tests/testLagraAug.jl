using LinearAlgebra
include("fonctions_de_tests.jl")
include("../src/Lagrangien_Augm.jl")
include("../src/Algorithme_de_Newton.jl")

"#test du lagrangien augmenté"

"#initialisation"
x01 = [0; 1; 1]
x02 = [0.5; 1.25; 1]
x03 = [1; 0]
x04 = [sqrt(3)/2 ;sqrt(3)/2]
lambda0 = 2
mu0 = 100000
tho = 2

"#paramétres utilisés pour définir les critéres d'arrêts "
epsilon = 1e-30
tol = 1e-9
itermax = 1000

"#Choix d'algorithme d'optimisation sans contraintes"
algo = "NW"

"#tests "
xmin1,fxmin1,nbiters,flag = Lagrangien_Augm(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,hess_contrainte1,norm_contrainte1,jac_contrainte1,phi,x01,epsilon,tol,itermax,lambda0,mu0,tho)
println("-------------------------------------------------------------------------")
printstyled("Résultats de l'algorithme du Lagrangien augmenté avec ",algo," appliquée à fct1 et le point initial x01:\n",bold=true,color=:blue)
println("    * xsol = ",xmin1)
println("    * f(xsol) = ",fxmin1)
println("    * nb_iters = ",nbiters)
println("    * flag = ",flag)
printstyled("******** Test réussi ******* \n\n",bold=true,color=:green)

xmin2 ,fxmin2,nbiters,flag = Lagrangien_Augm(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,hess_contrainte1,norm_contrainte1,jac_contrainte1,phi,x02,epsilon,tol,itermax,lambda0,mu0,tho)
println("-------------------------------------------------------------------------")
printstyled("Résultats de l'algorithme du Lagrangien augmenté avec ",algo," appliquée à fct1 et le point initial x02:\n",bold=true,color=:blue)
println("    * xsol = ",xmin2)
println("    * f(xsol) = ",fxmin2)
println("    * nb_iters = ",nbiters)
println("    * flag = ",flag)
printstyled("******** Test réussi ******* \n\n",bold=true,color=:green)


xmin3,fxmin3,nbiters,flag = Lagrangien_Augm(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,hess_contrainte2,norm_contrainte2,jac_contrainte2,phi,x03,epsilon,tol,itermax,lambda0,mu0,tho)
println("-------------------------------------------------------------------------")
printstyled("Résultats de l'algorithme du Lagrangien augmenté avec ",algo," appliquée à fct1 et le point initial x03\n:",bold=true,color=:blue)
println("    * xsol = ",xmin3)
println("    * f(xsol) = ",fxmin3)
println("    * nb_iters = ",nbiters)
println("    * flag = ",flag)
printstyled("******** Test réussi ******* \n\n",bold=true,color=:green)


xmin4 ,fxmin4,nbiters,flag = Lagrangien_Augm(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,hess_contrainte2,norm_contrainte2,jac_contrainte2,phi,x04,epsilon,tol,itermax,lambda0,mu0,tho)
println("-------------------------------------------------------------------------")
printstyled("Résultats de l'algorithme du Lagrangien augmenté avec "*algo*" appliquée à fct1 et le point initial x04:\n",bold=true,color=:blue)
println("    * xsol = ",xmin4)
println("    * f(xsol) = ",fxmin4)
println("    * nb_iters = ",nbiters)
println("    * flag = ",flag)
printstyled("******** Test réussi ******* \n\n",bold=true,color=:green)

