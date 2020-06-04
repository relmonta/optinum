#script de test de la fonction Newton à compléter !
using Optinum
using LinearAlgebra
include("../src/newton.jl")
include("fonctions_de_tests.jl")


x01 = [10; 3; -2.2];
x02 = [1; 10; 0];
x11=[1;0]
#Min de f avec newton et une
#fonction prédéfinie de julia
x1 = newton(x01,grad_fct1,hess_fct1)
#X1fminunc = Newton(x01,gradf1)

x2 = newton(x02,grad_fct1,hess_fct1)
#X2fminunc = optimize(f,x02)

x3 = newton(x11,grad_fct2,hess_fct2)
println(x3)
