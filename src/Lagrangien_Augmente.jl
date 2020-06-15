@doc doc"""
Résolution des problèmes de minimisation sous contraintes d'égalités

# Syntaxe
```julia
Lagrangien_Augmente(algo,fonc,contrainte,gradfonc,hessfonc,grad_contrainte,
			hess_contrainte,phi,x0,option)
```

# Entrées
  * **algo** 		   : l'algorithme sans contraintes à utiliser:
    - **"newton"**  : pour l'algorithme de Newton
    - **"cauchy"**  : pour le pas de Cauchy
    - **"gct"**     : pour le gradient conjugué tronqué
  * **fonc** 		   : la fonction à minimiser
  * **contrainte**	   : la contrainte [x est dans le domaine des contraintes ssi ``c(x)=0``]
  * **gradfonc**       : le gradient de la fonction
  * **hessfonc** 	   : la hessienne de la fonction
  * **grad_contrainte** : le gradient de la contrainte
  * **hess_contrainte** : la hessienne de la contrainte
  * **phi(x)** : utilisée dans le calcul du gradient du Lagrangien (égale 0 dans le cas des contraintes d'égalités)
  * **x0** 			   : la première composante du point de départ du Lagrangien
  * **options**
    1. **epsilon** 	   : utilisé dans les critères d'arrêt
    2. **tol**         : la tolérance utilisée dans les critères d'arrêt
    3. **itermax** 	   : nombre maximal d'itération dans la boucle principale
    4. **lambda0**	   : la deuxième composante du point de départ du Lagrangien
    5. **mu0,tho** 	   : valeurs initiales des variables de l'algorithme

# Sorties
* **xmin**		   : une approximation de la solution du problème avec contraintes
* **fxmin** 	   : ``f(x_{min})``
* **flag**		   : indicateur du déroulement de l'algorithme
   - **0**    : convergence
   - **1**    : nombre maximal d'itération atteint
   - **(-1)** : une erreur s'est produite
* **niters** 	   : nombre d'itérations réalisées

# Exemple d'appel
```julia
using LinearAlgebra
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
algo = "gct" # ou newton|gct
x0 = [1; 0]
options = []
contrainte(x) =  (x[1]^2) + (x[2]^2) -1.5
grad_contrainte(x) = [2*x[1] ;2*x[2]]
hess_contrainte(x) = [2 0;0 2]
phi(x) = 0
output = Lagrangien_Augmente(algo,f,contrainte,gradf,hessf,grad_contrainte,hess_contrainte,phi,x0,options)
```
"""
function Lagrangien_Augmente(algo,fonc::Function,contrainte::Function,gradfonc::Function,
	hessfonc::Function,grad_contrainte::Function,hess_contrainte::Function,phi::Function,x0,options)

	if options == []
		epsilon = 1e-30
		tol = 1e-3
		itermax = 1000
		lambda0 = 0.3
		mu0 = 0.5
		tho = 2
	else
		epsilon = options[1]
		tol = options[2]
		itermax = options[3]
		lambda0 = options[4]
		mu0 = options[5]
		tho = options[6]
	end


	"#initialisation des variables de l'algorithme"
	flag = 0
	xmin = x0
	lambda = lambda0
	mu = mu0
	eps0 = 1/mu0
	epsk = eps0
	alpha = 0.1
	beta = 0.9
	etac = 0.1258925
	eta0 = etac / (mu0^alpha)
	eta = eta0
	iter = 0
	gradL0 = (gradfonc(x0) + transpose(lambda0)*grad_contrainte(x0) + mu0*transpose(grad_contrainte(x0)')*contrainte(x0))

	"#boucle principale"
	while  ((norm(gradfonc(xmin),2)> tol*(norm(gradfonc(x0),2) +epsilon)) || ((norm(contrainte(xmin)) .> (norm(contrainte(x0))*tol+ epsilon)) && iter < itermax ) )

		"#la fonction Lagrangien"
		L(x) = (fonc(x) + (transpose(lambda))*contrainte(x) + 0.5*mu*(norm(contrainte(x))^2) )

		"#la fonction gradient de Lagrangien"
		gradL(x) =  (gradfonc(x) + grad_contrainte(x)*lambda + mu*transpose(grad_contrainte(x)')*contrainte(x))

		"#la fonction hessienne du Lagrangien"
		hessL(x) = (hessfonc(x) + (transpose(lambda))*hess_contrainte(x) + mu*(transpose(grad_contrainte(x)'))*grad_contrainte(x)' .+ phi(x) )

		"#Étape a"
		"#Résolution du problème sans contraintes : min L(x,lambdak ,muk)"
		if algo=="newton"

		xlocal,~ = Algorithme_De_Newton(L,gradL,hessL,xmin,[])

		elseif algo=="cauchy"
			xlocal,~ = Regions_De_Confiance("cauchy",L,gradL,hessL,xmin,[])

		elseif algo=="gct"
			xlocal,~ = Regions_De_Confiance("gct",L,gradL,hessL,xmin,[])
		else
			flag = -1
		end

		"#Test de convergence de l'algorithme global"
		if (norm(gradL(xlocal),2) <= tol*(norm(gradL0,2) +epsilon)) && (norm(contrainte(xlocal)) <= (norm(contrainte(x0))*tol+epsilon))
			xmin = xlocal
			break

		"#Mise à jour des variables"
		else
			"#Étape b"
			if (norm(contrainte(xlocal),2) <= eta)
				lambda = lambda + mu*contrainte(xlocal)
				epsk = epsk/(mu^beta)
				eta = eta /mu
			"#Étape c"
			else

				mu = tho*mu
				epsk = eps0/mu
				eta = etac / (mu^alpha)
			end
		end
		iter = iter +1

		"#Tester si le nombre d'itération max est atteint"
		if iter==itermax
			flag = 1
			break
		end
	end
	fxmin = fonc(xmin)
	return xmin,fxmin,flag,iter
end
