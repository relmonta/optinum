include("fonctions_de_tests.jl")
include("../src/Regions_de_confiance.jl")

function test_regions_de_confiance(affichage)
tolG = 1e-5
gamma1 = 0.5
gamma2 = 2.00
n1 = 0.25
n2 = 0.75
deltaMax = 1
tol = 1e-8
maxits = 5000
delta0_1 = 2
delta0_2 = 1

nbtest_reu = 0
nbtest_total = 0


RC_x_min11, RC_nb_iters11, RC_fmin11, RC_flag11 = Regions_De_Confiance("cauchy",fct1,grad_fct1,hess_fct1,x011,deltaMax,delta0_1,gamma1,gamma2,n1,n2,maxits,tol)
#@test norm(RC_x_min11-sol_exacte_fct1,2) < 1e-2
#@test norm(RC_fmin11)<1e-10
if norm(RC_x_min11-sol_exacte_fct1,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1

RC_x_min12, RC_nb_iters12, RC_fmin12, RC_flag12 = Regions_De_Confiance("cauchy",fct1,grad_fct1,hess_fct1,x012,deltaMax,delta0_1,gamma1,gamma2,n1,n2,maxits,tol)
#@test norm(RC_x_min12-sol_exacte_fct1,2) < 1e-2
#@test norm(RC_fmin12)<1e-10
if norm(RC_x_min12-sol_exacte_fct1,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1


RC_x_min21, RC_nb_iters21, RC_fmin21, RC_flag21 = Regions_De_Confiance("cauchy",fct2,grad_fct2,hess_fct2,x021,deltaMax,delta0_2,gamma1,gamma2,n1,n2,maxits,tol)
#@test norm(RC_x_min21-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin21)<1e-5
if norm(RC_x_min21-sol_exacte_fct2,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1


RC_x_min22, RC_nb_iters22, RC_fmin22, RC_flag22 = Regions_De_Confiance("cauchy",fct2,grad_fct2,hess_fct2,x022,deltaMax,delta0_2,gamma1,gamma2,n1,n2,maxits,tol)
#@test norm(RC_x_min22-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin22)<1e-5
if norm(RC_x_min22-sol_exacte_fct2,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1


RC_x_min23, RC_nb_iters23, RC_fmin23, RC_flag23 = Regions_De_Confiance("cauchy",fct2,grad_fct2,hess_fct2,x023,deltaMax,delta0_2,gamma1,gamma2,n1,n2,maxits,tol)
#@test norm(RC_x_min23-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin23)<1e-5
if norm(RC_x_min23-sol_exacte_fct2,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1


RC_x_min11, RC_nb_iters11, RC_fmin11, RC_flag11 = Regions_De_Confiance("gct",fct1,grad_fct1,hess_fct1,x011,deltaMax,delta0_1,gamma1,gamma2,n1,n2,maxits,tol)
#@test norm(RC_x_min11-sol_exacte_fct1,2) < 1e-2
#@test norm(RC_fmin11)<1e-10
if norm(RC_x_min11-sol_exacte_fct1,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1


RC_x_min12, RC_nb_iters12, RC_fmin12, RC_flag12 = Regions_De_Confiance("gct",fct1,grad_fct1,hess_fct1,x012,deltaMax,delta0_1,gamma1,gamma2,n1,n2,maxits,tol)
#@test norm(RC_x_min12-sol_exacte_fct1,2) < 1e-2
#@test norm(RC_fmin12)<1e-10
if norm(RC_x_min12-sol_exacte_fct1,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1


RC_x_min21, RC_nb_iters21, RC_fmin21, RC_flag21 = Regions_De_Confiance("gct",fct2,grad_fct2,hess_fct2,x021,deltaMax,delta0_2,gamma1,gamma2,n1,n2,maxits,tol)
#@test norm(RC_x_min21-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin21)<1e-10
if norm(RC_x_min21-sol_exacte_fct2,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1


RC_x_min22, RC_nb_iters22, RC_fmin22, RC_flag22 = Regions_De_Confiance("gct",fct2,grad_fct2,hess_fct2,x022,deltaMax,delta0_2,gamma1,gamma2,n1,n2,maxits,tol)
#@test norm(RC_x_min22-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin22)<1e-10
if norm(RC_x_min22-sol_exacte_fct2,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=",bold=true,color=:white)
nbtest_total = nbtest_total + 1


RC_x_min23, RC_nb_iters23, RC_fmin23, RC_flag23 = Regions_De_Confiance("gct",fct2,grad_fct2,hess_fct2,x023,deltaMax,delta0_2,gamma1,gamma2,n1,n2,maxits,tol)
#@test norm(RC_x_min23-sol_exacte_fct2,2) < 1e-2
#@test norm(RC_fmin23)<1e-10
if norm(RC_x_min23-sol_exacte_fct2,2) < 1e-2
	nbtest_reu = nbtest_reu + 1
end
printstyled("=> ",bold=true,color=:white)
nbtest_total = nbtest_total + 1


#printstyled(" Tous les tests sont réussis ! \n",bold=true,color=:green)

return (nbtest_reu,nbtest_total)

end
