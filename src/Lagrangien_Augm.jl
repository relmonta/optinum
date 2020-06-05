"""
#################################################################################
	# Algorithme du lagrangien augmenté pour le
	# calcul du minimum d'une fonction avec des contraintes d'égalités
#################################################################################

#################################################################################
#Entrées :
	# algorithme_sans_contrainte : l'indice inqiquant l'algorithme sans contraintes à utiliser
	#		"NW" : pour utiliser l'algo de Newton
	#		"RC" : pour utiliser l'algo de Région de confiance
	# fonc : la fonction à minimiser
	# contrainte : la contrainte [x est dans le domaine des contraintes ssi c(x)==0]
	# gradfonc : le gradient de la fonction
	# hessfonc : la hessienne de la fonction
	# gradcontrainte : le gradient de la contrainte contrainte
	# hesscontrainte : la hessienne de la contrainte
	# nomrcontrainte : la norme de la contrainte
	# jaccontrainte : le jacobien de la contrainte
	# x0 : le point du départ
	# epsilon : utilisé dans les critéres d'arrêt
	# tol : utilisé dans les critéres d'arrêt
	# itermax : nombre maximal d'itération dans la boucle principale
	# lambda0,mu0,tho : valeurs initiales des variables de l'algorithme

#################################################################################

#################################################################################
#Sorties :
	#xmin :Le minumum du problème avec contraintes
	#fxmin : l'image de xmin par la fonction objectif
	#niters : nombre d'itérations
	#flag : indicateur du déroulement de l'algorithme
	#	0 : Convergence
	#	1 : nombre maximal d'itération atteint
	#	-1: une erreur s'est produite
#################################################################################

"""
function Lagrangien_Augm(algorithme_sans_contrainte,fonc::Function,contrainte::Function,gradfonc::Function,hessfonc::Function,gradcontrainte::Function,hesscontrainte::Function,normcontrainte::Function,jaccontrainte::Function,phi::Function,x0,epsilon,tol,itermax,lambda0,mu0,tho)



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
gradL0 = (gradfonc(x0) + transpose(lambda0)*gradcontrainte(x0) + mu0*transpose(jaccontrainte(x0))*contrainte(x0))

"#boucle principale"
while  ((norm(gradfonc(xmin),2)> tol*(norm(gradfonc(x0),2) +epsilon)) || ((normcontrainte(xmin) .> epsilon) && iter < itermax ) )

    "#la fonction Lagrangien"
    L(x) = (fonc(x) + (transpose(lambda))*contrainte(x) + 0.5*mu*(normcontrainte(x)^2) )
    "#la fonction gradient de Lagrangien"
    gradL(x) =  (gradfonc(x) + gradcontrainte(x)*lambda + mu*transpose(jaccontrainte(x))*contrainte(x))
    "#la fonction hessienne du Lagrangien"
    hessL(x) = (hessfonc(x) + (transpose(lambda))*hesscontrainte(x) + mu*(transpose(jaccontrainte(x)))*jaccontrainte(x) .+ phi(x) )

    "#Étape a"
    "#Résolution du problème sans contraintes : min L(x,lambdak ,muk)"
    if algorithme_sans_contrainte=="NW"
	xlocal,~ = Algorithme_de_Newton(L,gradL,hessL,xmin,epsilon,itermax)
    elseif algorithme_sans_contrainte=="RC"
    	xlocal = Region_De_Confiance_Avec_PasDeCauchy(L,gradL,hessL,xmin,5,1,0.5,2,0.25,0.75,itermax,tol,tol,tol)
    else
    	err = -1
    end
    "#Test de convergence de l'algorithme global"
    if ((norm(gradL(xlocal),2) <= tol*(norm(gradL0,2) +epsilon)) && (normcontrainte(xlocal) <= epsilon))
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
    if iter==itermax
    	flag = 1
    end
end
fxmin = fonc(xmin)
return xmin,fxmin,iter,flag
end
