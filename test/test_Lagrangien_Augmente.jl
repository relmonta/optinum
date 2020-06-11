
include("fonctions_de_tests.jl")
include("../src/Lagrangien_Augmente.jl")
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


"#test du lagrangien augmenté"

"""
   #Entrées :
	#afficher : boolean , si true on affiche les sorties de chaque test
	
"""

function test_Lagrangien_Augmente(afficher)

	"#initialisation des paramétres"
	lambda0 = 2
	mu0 = 10
	tho = 2

	"#paramétres utilisés pour définir les critéres d'arrêts "
	epsilon = 1e-8
	tol = 1e-5
	itermax = 1000
	option = [epsilon,tol,itermax,lambda0,mu0,tho]

	"#ensemble d'algorithmes d'optimisation sans contraintes"
	algos = ["newton","gct","cauchy"]


	"#solutions exactes"
	sol_exacte_fct1 = [0.5 ; 1.25 ; 0.5]
	sol_exacte_fct2 = [0.9072339605110892; 0.82275545631455]


	"#norme de l'écart entre la solution trouvée et celle attendue"
	normerreur = 1e-4



	for algo in algos 

			"# Test sur fct1 avec x01 comme solution initiale"
			"#résolution du problème avec la libraire JumP"
			#=
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

			=#


			#résolution du problème avec le Lagrangien augmenté
			xmin1,fxmin1,nbiters,flag = Lagrangien_Augmente(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,
			hess_contrainte1,norm_contrainte1,jac_contrainte1,phi,x01,option)

			#affichage des résultats du test
			if (afficher)
				afficher_resultats(algo,"fonction 1","x01",xmin1,fxmin1,flag,sol_exacte_fct1,nbiters)
			end

			# Test sur fct1 avec x02 comme solution initiale

			#résolution du problème avec le Lagrangien augmenté
			xmin2 ,fxmin2,nbiters,flag = Lagrangien_Augmente(algo,fct1,contrainte1,grad_fct1,hess_fct1,grad_contrainte1,
			hess_contrainte1,norm_contrainte1,jac_contrainte1,phi,x02,[])

			#affichage des résultats du test
			if (afficher)
				afficher_resultats(algo,"fonction 1","x02",xmin2,fxmin2,flag,sol_exacte_fct1,nbiters)
			end


			"# Test sur fct2 avec x03 comme solution initiale"

			"#résolution du problème avec la libraire JumP"
			#=
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

			=#

			#résolution du problème avec le Lagrangien augmenté
			xmin3,fxmin3,nbiters,flag = Lagrangien_Augmente(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,
			hess_contrainte2,norm_contrainte2,jac_contrainte2,phi,x03,[])


			#affichage des résultats du test
			if (afficher)
				afficher_resultats(algo,"fonction 2","x03",xmin3,fxmin3,flag,sol_exacte_fct2,nbiters)
			end
			
			
			"# Test sur fct2 avec x04 comme solution initiale"

			#résolution du problème avec le Lagrangien augmenté
			xmin4 ,fxmin4,nbiters,flag = Lagrangien_Augmente(algo,fct2,contrainte2,grad_fct2,hess_fct2,grad_contrainte2,
			hess_contrainte2,norm_contrainte2,jac_contrainte2,phi,x04,[])

			#affichage des résultats du test
			if (afficher)
				afficher_resultats(algo,"fonction 2","x04",xmin4,fxmin4,flag,sol_exacte_fct2,nbiters)
			end


			if (afficher)
				println("\n")
				printstyled("############################################ \n",bold=true,color=:green)
				printstyled("#                                          # \n",bold=true,color=:green)
				print("         ",nbTests_reussis," tests réussis sur ",nbTests_total,"\n")
				printstyled("#                                          # \n",bold=true,color=:green)
				printstyled("############################################",bold=true,color=:green)
				println("")
			end


			"#tester les résultats obtenues"
			nom_algo = "Lagrangien augmenté avec "*algo
			
			try
				res = @testset "$nom_algo"  begin
		          	 	@test isapprox(xmin1,sol_exacte_fct1 ,atol=normerreur)
		          	 	@test xmin2 ≈ sol_exacte_fct1 atol=normerreur
		           	 	@test xmin3 ≈ sol_exacte_fct2 atol=normerreur
		           	 	@test xmin4 ≈ sol_exacte_fct2 atol=normerreur
		           	 end
			catch
				println("\n")			
			end
			println("\n")
			
	end

	return
end
