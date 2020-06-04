## Calcul le minum d'une fonction f sans contrainte

#la méthode prend en paramétres :
#le point du départ : x0 [il faut que gradf[x0] != 0]
#le gradient de la fonction : gradf
#la hessienne de la fonction : hessf

#l sortie xk est le minumum

function newton(x0,gradf::Function,hessf::Function)

tol1 = 1e-15
tol2 = 10e-15
eps = 10e-20
xk = x0


dk = hessf(x0)\(-gradf(x0))
xk1 = xk + dk
while (norm(dk)> tol1*(norm(xk)) +eps && norm(gradf(xk))>(tol2*(norm(gradf(x0))) +eps ))
    xk = xk1
    dk = hessf(xk)\(-gradf(xk))
    xk1 = xk + dk;
end

return (xk)
end
