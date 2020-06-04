""" Les points initiaux """
x011 = [1; 0; 0]
x012 = [10; 3; -2.2]
x021 = [-1.2; 1]
x022 = [10; 0]
x023 = [0; 1/200 + 1/10^12]



""" La première fonction de test """

fct1(x) =  2*(x[1]+x[2]+x[3]-3)^2 + (x[1]-x[2])^2 + (x[2]-x[3])^2

#la gradient de la fonction f1
function grad_fct1(x)
    y1 = 4*(x[1]+x[2]+x[3]-3) + 2*(x[1]-x[2])
    y2 = 4*(x[1]+x[2]+x[3]-3) - 2*(x[1]-x[2]) +2*(x[2]-x[3])
    y3 = 4*(x[1]+x[2]+x[3]-3) - 2*(x[2]-x[3])

    y = [y1;y2;y3]
    return y
end

#la hessienne de la fonction f2
hess_fct1(x) = [6 2 4;2 8 2;4 2 6]



""" La deuxieme fonction de test """
fct2(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2

#la gradient de la fonction f2
grad_fct2(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]

#la hessienne de la fonction f2
hess_fct2(x)=[-400*(x[2]-3*x[1]^2)+2 -400*x[1];
                        -400*x[1] 200]
