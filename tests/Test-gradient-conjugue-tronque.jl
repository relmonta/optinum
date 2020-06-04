using LinearAlgebra, Test
include("../src/Gradient_Conjugue_Tronque.jl")
include("fonctions_de_tests.jl")

s_min=Gradient_Conjugue_Tronque(fct1,grad_fct1,hess_fct1,1,[10;0;3],100,1e-15)
s_min=Gradient_Conjugue_Tronque(fct1,grad_fct1,hess_fct1,1,[10;0;3],100,1e-15)
println(s_min)
