
""" # Les points initiaux """
#pour les problèmes sans contraintes
x011 = [1; 0; 0]
x012 = [10; 3; -2.2]
x021 = [-1.2; 1]
x022 = [10; 0]
x023 = [0; 1/200 + 1/10^12]

#pour les problèmes avec contraintes
x01 = [0; 1; 1]
x02 = [0.5; 1.25; 1]
x03 = [1; 0]
x04 = [sqrt(3)/2 ;sqrt(3)/2]

""" # Les solutions exactes """
sol_exacte_fct1 = [1;1;1]
sol_exacte_fct2 = [1;1]

""" # La première fonction de test """

fct1(x) =  2*(x[1]+x[2]+x[3]-3)^2 + (x[1]-x[2])^2 + (x[2]-x[3])^2

#la gradient de la fonction f1
function grad_fct1(x)
    y1 = 4*(x[1]+x[2]+x[3]-3) + 2*(x[1]-x[2])
    y2 = 4*(x[1]+x[2]+x[3]-3) - 2*(x[1]-x[2]) +2*(x[2]-x[3])
    y3 = 4*(x[1]+x[2]+x[3]-3) - 2*(x[2]-x[3])
    return [y1;y2;y3]
end

#la hessienne de la fonction f1
hess_fct1(x) = [6 2 4;2 8 2;4 2 6]


""" # La deuxieme fonction de test """
fct2(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
fonct2(x,y)=100*(y-x^2)^2+(1-x)^2

#la gradient de la fonction f2
grad_fct2(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]

hess_fct2(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]


""" # Les fonctions lié aux contraintes """
#contrainte : x1 + x3 = 1
contrainte1(x) =  x[1]+x[3]-1

grad_contrainte1(x) = [1 ;0; 1]

hess_contrainte1(x) = [0 0 0;0 0 0;0 0 0]


#contrainte : x1^{2} + x2^{2} = 1.5 (x appartient au cercle de centre (0,0) et de rayon 1.5 )
contrainte2(x) =  (x[1]^2) + (x[2]^2) -1.5
cont2(x,y) =  (x^2) + (y^2) -1.5

grad_contrainte2(x) = [2*x[1] ;2*x[2]]

hess_contrainte2(x) = [2 0;0 2]


#fonction utilisé dans le calcul du Lagrangien augmenté
phi(x) =  0
