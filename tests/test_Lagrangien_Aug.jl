
include("fonctions_de_tests.jl")
include("../src/Lagrangien_Augm.jl")
include("../src/Algorithme_de_Newton.jl")
include("../src/Regions_de_confiance.jl")

"#afficher_resultats nous affiche les sorties du lagrangien augmenté"
function afficher_resultats(algo,nom_fct,point_init,xmin,fxmin,flag,sol_exacte,nbiters)
	println("-------------------------------------------------------------------------")
	printstyled("Résultats de l'algorithme du Lagrangien augmenté avec ",algo," appliquée à "*nom_fct*" et au point initial "*point_init*" :\n",bold=true,color=:blue)
	println("  * solution trouvée (xsol) = ",xmin)
	println("  * f(xsol) = ",fxmin)
	println("  * nombre d'itération = ",nbiters)
	println("  * flag = ",flag)
	println("  * solution attendue : " , sol_exacte)
end

"#VerifierTest renvoie 1 si le test réussi et 0 sinon"
function VerifierTest(xmin,sol_exacte,tolerance,afficher)
	if norm(xmin - sol_exacte) > tolerance
		if (afficher)
			printstyled("\n ******** Test échoué ******* \n\n",bold=true,color=:red)
		end
		estreussi = 0
	else
		if (afficher)
			printstyled("\n ******** Test réussi ******* \n\n",bold=true,color=:green)
		end
		estreussi = 1
	end
	printstyled("=",bold=true,color=:white)
	return estreussi
end


"#test du lagrangien augmenté"

"""
   #Entrées :
	#afficher : boolean , si true on affiche les sorties de chaque test
   #Sorties :
	#nbTests_reussis : nombre de tests réussis
	#nbtest_total : nombre de tests total effectués
"""

function test_Lagrangien_Aug(afficher)

	"#initialisation des paramétres"
	lambda0 = 2
	mu0 = 10
	tho = 2
	
	"#paramétres utilisés pour définir les critéres d'arrêts "
	epsilon = 1e-30
	tol = 1e-9
	itermax = 1000

	"#Choix d'algorithme d'optimisation sans contraintes"
	algo = "gct"
	
	"#norme de l'écart entre la solution trouvée et celle attendue"
	normerreur = 1e-6
	#nombre de tests réussis et le nombre de tests total
	nbTests_total = 0
	nbTests_reussis = 0
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
	xmin1,fxmin1,nbiters,flag = Lagrangien_Augm(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,
	hess_contrainte1,norm_contrainte1,jac_contrainte1,phi,x01,epsilon,tol,itermax,lambda0,mu0,tho)

	#affichage des résultats du test
	if (afficher)
		afficher_resultats(algo,"fonction 1","x01",xmin1,fxmin1,flag,value.(x),nbiters)
	end
	#test
	nbTests_reussis=nbTests_reussis + VerifierTest(xmin1,value.(x),normerreur,afficher)
	nbTests_total = nbTests_total + 1
	# Test sur fct1 avec x02 comme solution initiale

	#résolution du problème avec le Lagrangien augmenté
	xmin2 ,fxmin2,nbiters,flag = Lagrangien_Augm(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,
	hess_contrainte1,norm_contrainte1,jac_contrainte1,phi,x02,epsilon,tol,itermax,lambda0,mu0,tho)

	#affichage des résultats du test
	if (afficher)
		afficher_resultats(algo,"fonction 1","x02",xmin2,fxmin2,flag,value.(x),nbiters)
	end
	# test
	nbTests_reussis=nbTests_reussis + VerifierTest(xmin2,value.(x),normerreur,afficher)
	nbTests_total = nbTests_total + 1
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
	xmin3,fxmin3,nbiters,flag = Lagrangien_Augm(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,
	hess_contrainte2,norm_contrainte2,jac_contrainte2,phi,x03,epsilon,tol,itermax,lambda0,mu0,tho)


	#affichage des résultats du test
	if (afficher)
		afficher_resultats(algo,"fonction 2","x03",xmin3,fxmin3,flag,value.(x),nbiters)
	end
	#test
	#@test norm(xmin3 - value.(x)) < normerreur
	#xmin3 = [0;0]
	nbTests_reussis = nbTests_reussis + VerifierTest(xmin3,value.(x),normerreur,afficher)
	nbTests_total = nbTests_total + 1
	"# Test sur fct2 avec x04 comme solution initiale"

	#résolution du problème avec le Lagrangien augmenté
	xmin4 ,fxmin4,nbiters,flag = Lagrangien_Augm(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,
	hess_contrainte2,norm_contrainte2,jac_contrainte2,phi,x04,epsilon,tol,itermax,lambda0,mu0,tho)

	#affichage des résultats du test
	if (afficher)
		afficher_resultats(algo,"fonction 2","x04",xmin4,fxmin4,flag,value.(x),nbiters)
	end
	#test
	#@test norm(xmin4 - value.(x)) < normerreur
	nbTests_reussis = nbTests_reussis + VerifierTest(xmin4,value.(x),normerreur,afficher)
	nbTests_total = nbTests_total + 1

	printstyled("> ",bold=true,color=:white)
	if (afficher)
		println("\n")
		printstyled("############################################ \n",bold=true,color=:green)
		printstyled("#                                          # \n",bold=true,color=:green)
		print("         ",nbTests_reussis," tests réussis sur ",nbTests_total,"\n")
		printstyled("#                                          # \n",bold=true,color=:green)
		printstyled("############################################",bold=true,color=:green)
	end
	return (nbTests_reussis,nbTests_total)
end
