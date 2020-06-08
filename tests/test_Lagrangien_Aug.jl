using LinearAlgebra , JuMP, Ipopt , Test
include("fonctions_de_tests.jl")
include("../src/Lagrangien_Augm.jl")
include("../src/Algorithme_de_Newton.jl")
include("../src/Regions_de_confiance.jl")

"#test du lagrangien augmenté"

"#initialisation des paramétres"
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
itermax = 100

"#Choix d'algorithme d'optimisation sans contraintes"

algo = "NW"


"#norme de l'écart entre la solution trouvée et celle attendue"
normerreur = 1e-8


#nombre de tests réussis et le nombre de tests total
nbtest_reu = 0
nbtest_total = 0


# Test sur fct1 avec x01 comme solution initiale

#résolution du problème avec la libraire JumP
#création du model
m = Model(Ipopt.Optimizer)
#définir les paramétres du model (faites attention à la dimension de x !)
@variable(m, x[1:3])
@objective(m, Min, fct1(x))
@constraint(m, contrainte1(x) == 0)
"#sauvegarder puis restorer la sortie pour empêcher l'affichage des résultats de 'optimize' "
TT = stdout 
# sauvegarder la sortie
redirect_stdout()
#résoudre le problème
optimize!(m);
# restaurer la sortie
redirect_stdout(TT)

#résolution du problème avec le Lagrangien augmenté
xmin1,fxmin1,nbiters,flag = Lagrangien_Augm(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,hess_contrainte1,norm_contrainte1,jac_contrainte1,phi,x01,epsilon,tol,itermax,lambda0,mu0,tho) 

#affichage des résultats du test
println("-------------------------------------------------------------------------")
printstyled("Résultats de l'algorithme du Lagrangien augmenté avec ",algo," appliquée à fct1 et le point initial x01:\n",bold=true,color=:blue)

println("  * solution trouvée (xsol) = ",xmin1)
println("  * f(xsol) = ",fxmin1)
println("  * nombre d'itération = ",nbiters)
println("  * flag = ",flag)
println("  * solution attendue : " , value.(x))

#test
#@test norm(xmin1 - value.(x)) < normerreur

if norm(xmin1 - value.(x)) > normerreur 
	printstyled("\n ******** Test échoué ******* \n\n",bold=true,color=:red)

else 
	printstyled("\n ******** Test réussi ******* \n\n",bold=true,color=:green)
	nbtest_reu = nbtest_reu + 1
end

nbtest_total = nbtest_total + 1

# Test sur fct1 avec x02 comme solution initiale

#résolution du problème avec le Lagrangien augmenté
xmin2 ,fxmin2,nbiters,flag = Lagrangien_Augm(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,hess_contrainte1,norm_contrainte1,jac_contrainte1,phi,x02,epsilon,tol,itermax,lambda0,mu0,tho)

#affichage des résultats du test
println("-------------------------------------------------------------------------")
printstyled("Résultats de l'algorithme du Lagrangien augmenté avec ",algo," appliquée à fct1 et le point initial x02:\n",bold=true,color=:blue)

println("  * solution trouvée (xsol) = ",xmin2)
println("  * f(xsol) = ",fxmin2)
println("  * nombre d'itération = ",nbiters)
println("  * flag = ",flag)
println("  * solution attendue : " , value.(x))

#test
#@test norm(xmin2 - value.(x)) < normerreur
if norm(xmin2 - value.(x)) > normerreur 
	printstyled("\n ******** Test échoué ******* \n\n",bold=true,color=:red)

else 
	printstyled("\n ******** Test réussi ******* \n\n",bold=true,color=:green)
	nbtest_reu = nbtest_reu + 1
end
nbtest_total = nbtest_total + 1



# Test sur fct2 avec x03 comme solution initiale

#résolution du problème avec la libraire JumP

#création du model
m = Model(Ipopt.Optimizer)

#définir les paramétres du model (faites attention à la dimension de x !)
@variable(m, x[1:2])
register(m, :fonct2,2,fonct2,autodiff=true)
register(m, :cont2,2,cont2,autodiff=true)
"""#Attention : pour les contraintes non linéaires les variables ne peuvent être que des scalaires """

@NLobjective(m, Min, fonct2(x[1],x[2]))   
@NLconstraint(m, cont2(x[1],x[2]) == 0)

"#sauvegarder puis restorer la sortie pour empêcher l'affichage des résultats de 'optimize' "
TT = stdout 
# sauvegarder la sortie
redirect_stdout()
#résoudre le problème
optimize!(m);
# restaurer la sortie
redirect_stdout(TT)

#résolution du problème avec le Lagrangien augmenté
xmin3,fxmin3,nbiters,flag = Lagrangien_Augm(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,hess_contrainte2,norm_contrainte2,jac_contrainte2,phi,x03,epsilon,tol,itermax,lambda0,mu0,tho)


#affichage des résultats du test
println("-------------------------------------------------------------------------")
printstyled("Résultats de l'algorithme du Lagrangien augmenté avec ",algo," appliquée à fct2 et le point initial x03 :\n",bold=true,color=:blue)

println("  * solution trouvée (xsol) = ",xmin3)
println("  * f(xsol) = ",fxmin3)
println("  * nombre d'itération = ",nbiters)
println("  * flag = ",flag)
println("  * solution attendue : " , value.(x))

#test
#@test norm(xmin3 - value.(x)) < normerreur
xmin3 = [0;0]
if norm(xmin3 - value.(x)) > normerreur 
	printstyled("\n ******** Test échoué ******* \n\n",bold=true,color=:red)

else 
	printstyled("\n ******** Test réussi ******* \n\n",bold=true,color=:green)
	nbtest_reu = nbtest_reu + 1
end
nbtest_total = nbtest_total + 1




# Test sur fct2 avec x04 comme solution initiale

#résolution du problème avec le Lagrangien augmenté
xmin4 ,fxmin4,nbiters,flag = Lagrangien_Augm(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,hess_contrainte2,norm_contrainte2,jac_contrainte2,phi,x04,epsilon,tol,itermax,lambda0,mu0,tho)

#affichage des résultats du test
println("-------------------------------------------------------------------------")
printstyled("Résultats de l'algorithme du Lagrangien augmenté avec ",algo," appliquée à fct2 et le point initial x04 :\n",bold=true,color=:blue)

println("  * solution trouvée (xsol) = ",xmin4)
println("  * f(xsol) = ",fxmin4)
println("  * nombre d'itération = ",nbiters)
println("  * flag = ",flag)
println("  * solution attendue : " , value.(x))

#test
#@test norm(xmin4 - value.(x)) < normerreur
if norm(xmin4 - value.(x)) > normerreur 
	printstyled("\n ******** Test échoué ******* \n\n",bold=true,color=:red)

else 
	printstyled("\n ******** Test réussi ******* \n\n",bold=true,color=:green)
	nbtest_reu = nbtest_reu + 1
end
nbtest_total = nbtest_total + 1

println("\n")
printstyled("############################################ \n",bold=true,color=:green)
printstyled("#                                          # \n",bold=true,color=:green)
print("         ",nbtest_reu," tests réussis sur ",nbtest_total,"\n")
printstyled("#                                          # \n",bold=true,color=:green)
printstyled("############################################",bold=true,color=:green)
