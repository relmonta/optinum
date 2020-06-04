#function f1
fct1(x) = 2*(x[1]+x[2]+x[3]-3)^2 + (x[1]-x[2])^2 + (x[2]-x[3])^2
#la gradient de la fonction f1
function grad_fct1(x)

y1 = 4*(x[1]+x[2]+x[3]-3) + 2*(x[1]-x[2])
y2 = 4*(x[1]+x[2]+x[3]-3) - 2*(x[1]-x[2]) +2*(x[2]-x[3])
y3 = 4*(x[1]+x[2]+x[3]-3) - 2*(x[2]-x[3])

y = [y1;y2;y3]
return y
end
#la hessienne de la fonction f1
hess_fct1(x) = [6 2 4;2 8 2;4 2 6]


""" La deuxieme fonction de test """
fct2(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2

grad_fct2(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]

hess_fct2(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]

""" Les fonctions lié aux contraintes """
#contrainte : x1 + x3 = 1
contrainte1(x) =  x[1]+x[3]-1

grad_contrainte1(x) = [1 ;0; 1]

jac_contrainte1(x) = [1 ;0; 1]'

hess_contrainte1(x) = [0 0 0;0 0 0;0 0 0]

norm_contrainte1(x) = abs(x[1]+x[3]-1)


#contrainte : x1^{2} + x2^{2} = 1.5 (x appartient au cercle de centre (0,0) et de rayon 1.5 )
contrainte2(x) =  (x[1]^2) + (x[2]^2) -1.5

grad_contrainte2(x) = [2*x[1] ;2*x[2]]

jac_contrainte2(x) = [2*x[1] ;2*x[2]]'

hess_contrainte2(x) = [2 0;0 2]

norm_contrainte2(x) = norm((x[1]^2) + (x[2]^2) -1.5)

#fonction utilisé dans le calcul du Lagrangien augmenté
phi(x) =  0
