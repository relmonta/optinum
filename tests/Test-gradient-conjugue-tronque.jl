using LinearAlgebra, Test
include("../src/Gradient_Conjugue_Tronque.jl")
include("fonctions_de_tests.jl")

s_min1=Gradient_Conjugue_Tronque(fct1,grad_fct1,hess_fct1,1,[10;0;3],100,1e-15)
s_min2=Gradient_Conjugue_Tronque(fct2,grad_fct2,hess_fct2,1,[10;0],100,1e-15)
println("s1= "+s_min1,"s2= "+s_min2)
