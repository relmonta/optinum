include("fonctions_de_tests.jl")
include("../src/Region_De_Confiance_Avec_PasDeCauchy.jl")


tolG = 1e-5
gamma1 = 0.5
gamma2 = 2.00
n1 = 0.25
n2 = 0.75
deltaMax = 10
tol = 1e-6
maxits = 50
delta0_1 = 2
delta0_2 = 1

RC_x_min11, RC_nb_iters11, RC_fmin11, RC_flag11 = Region_De_Confiance_Avec_PasDeCauchy(fct1,grad_fct1,hess_fct1,x011,deltaMax,delta0_1,gamma1,gamma2,n1,n2,maxits,tol,tol,tol)
xsol = [1.003; 1.0004; 0.99781]
@test norm(RC_x_min11 - xsol) < 1e-12
@test RC_flag11 == 0


RC_x_min12, RC_nb_iters12, RC_fmin12, RC_flag12 = Region_De_Confiance_Avec_PasDeCauchy(fct1,grad_fct1,hess_fct1,x012,deltaMax,delta0_1,gamma1,gamma2,n1,n2,maxits,tol,tol,tol)
xsol = [1.0093; 0.99927; 0.98924]
@test norm(RC_x_min12 - xsol) < 1e-12
@test RC_flag12 == 0


RC_x_min21, RC_nb_iters21, RC_fmin21, RC_flag21 = Region_De_Confiance_Avec_PasDeCauchy(fct2,grad_fct2,hess_fct2,x021,deltaMax,delta0_2,gamma1,gamma2,n1,n2,maxits,tol,tol,tol)
xsol = [-0.92738; 0.86447]
@test norm(RC_x_min21 - xsol) < 1e-12
@test RC_flag21 == 3


RC_x_min22, RC_nb_iters22, RC_fmin22, RC_flag22 = Region_De_Confiance_Avec_PasDeCauchy(fct2,grad_fct2,hess_fct2,x022,deltaMax,delta0_2,gamma1,gamma2,n1,n2,maxits,tol,tol,tol)
xsol = [1.1601; 0.91327]
@test norm(RC_x_min21 - xsol) < 1e-12
@test RC_flag22 == 0


RC_x_min23, RC_nb_iters23, RC_fmin23, RC_flag23 = Region_De_Confiance_Avec_PasDeCauchy(fct2,grad_fct2,hess_fct2,x023,deltaMax,delta0_2,gamma1,gamma2,n1,n2,maxits,tol,tol,tol)
xsol = [0.8358; 0.697993]
@test norm(RC_x_min23 - xsol) < 1e-12
@test RC_flag23 == 3
