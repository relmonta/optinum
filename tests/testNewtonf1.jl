#script de test de la fonction Newton à compléter !
using Optim
using LinearAlgebra
include("gradf1.jl")
include("hessf1.jl")
include("../src/newton.jl")



x01 = [10; 3; -2.2];
x02 = [1; 10; 0];

#Min de f avec newton et une
#fonction prédéfinie de julia

x1 = newton(x01,gradf1,hessf1)
#X1fminunc = Newton(x01,gradf1)

x2 = newton(x02,gradf1,hessf1)
#X2fminunc = optimize(f,x02)
