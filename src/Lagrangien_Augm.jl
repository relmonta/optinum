#################################################################################
	# Algorithme du lagrangien augmenté pour le
	# calcul du minimum d'une fonction avec des contraintes d'égalités
#################################################################################

#################################################################################
#Entrées :
	#la fonction à minimiser : f
	#la contrainte : c [x est dans le domaine des contraintes ssi c[x]==0]
	#le gradient de la fonction : gradf
	#la hessienne de la fonction : hessf
	#le gradient de la contrainte contrainte : gradc
	#la hessienne de la contrainte : hessc
	#la norme de la contrainte : nomrc
	#le jacobien de la contrainte : jac
	#le point du départ : x0
	#l'indice inqiquant l'algorithme sans contraintes à utiliser : algorithme_sans_contrainte
	#		0 : pour utiliser Newton
	#		1 : pour utiliser RC
#################################################################################

#################################################################################
#Sorties :
	#xmin :Le minumum du problème avec contraintes
#################################################################################


function Lagrangien_Augm(algorithme_sans_contrainte,fonc::Function,contrainte::Function,gradfonc::Function,hessfonc::Function,gradcontrainte::Function,hesscontrainte::Function,normcontrainte::Function,jaccontrainte::Function,phi::Function,x0,lambda0,mu0,tho)

#paramétres utiles pour définir les critéres d'arrêts
epsilon = 1e-30
tol = 1e-9
itermax = 1000

#initialisation des variables de l'algorithme
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

#boucle principale
while  ((norm(gradfonc(xmin),2)> tol*(norm(gradfonc(x0),2) +epsilon)) || ((normcontrainte(xmin) .> epsilon) && iter <= itermax ) )

    #la fonction Lagrangien
    L(x) = (fonc(x) + (transpose(lambda))*contrainte(x) + 0.5*mu*(normcontrainte(x)^2) )
    #la fonction gradient de Lagrangien
    gradL(x) =  (gradfonc(x) + gradcontrainte(x)*lambda + mu*transpose(jaccontrainte(x))*contrainte(x))
    #la fonction hessienne du Lagrangien
    hessL(x) = (hessfonc(x) + (transpose(lambda))*hesscontrainte(x) + mu*(transpose(jaccontrainte(x)))*jaccontrainte(x) .+ phi(x) )

    #Étape a
    #Résolution du problème sans contraintes : min L(x,lambdak ,muk)
    if algorithme_sans_contrainte==0
    	xlocal = newton(xmin,gradL,hessL)
    elseif algorithme_sans_contrainte==1
    	xlocal = Regionconf(L,xmin,gradL,hessL,5,1,0.25,0.75,0.5,2,epsk,0)	
    end

    #Test de convergence de l'algorithme global
    if ((norm(gradL(xlocal),2) <= tol*(norm(gradL0,2) +epsilon)) && (normcontrainte(xlocal) <= epsilon))
        xmin = xlocal
        break

    #Mis-à-jour des variables
    else
    	#Étape b
        if (norm(contrainte(xlocal),2) <= eta)
            lambda = lambda + mu*contrainte(xlocal)
            epsk = epsk/(mu^beta)
            eta = eta /mu
    	#Étape c
        else
            mu = tho*mu
            epsk = eps0/mu
            eta = etac / (mu^alpha)
        end

    end
    iter = iter +1
end

return xmin
end

