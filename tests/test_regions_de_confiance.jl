using LinearAlgebra, Test
include("fonctions_de_tests.jl")
include("../src/Regions_de_confiance.jl")

tolG = 1e-5
gamma1 = 0.5
gamma2 = 2.00
n1 = 0.25
n2 = 0.75
deltaMax = 10
tol = 1e-6
maxits = 500
delta0_1 = 2
delta0_2 = 1
println("<=================== Débuts des tests ====================>")
#RC_x_min23, RC_nb_iters23, RC_fmin23, RC_flag23 = Regions_De_Confiance("cauchy",fct2,grad_fct2,hess_fct2,x023,deltaMax,delta0_2,gamma1,gamma2,n1,n2,maxits,tol,tol,tol)
#println(RC_x_min23)
xsol = [0.8358; 0.697993]

RC_x_min11, RC_nb_iters11, RC_fmin11, RC_flag11 = Regions_De_Confiance("gct",fct1,grad_fct1,hess_fct1,x011,deltaMax,delta0_1,gamma1,gamma2,n1,n2,maxits,tol,tol,tol)
println(RC_x_min11)
xsol = [1; 1; 1]
