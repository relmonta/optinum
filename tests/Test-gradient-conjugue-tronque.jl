using LinearAlgebra, UnicodePlots, Statistics, Test
include("../src/Gradient_Conjugue_Tronque.jl")
function gradf(x)
    return [4;6]
end
hessf(x)=[7 0;0 2]
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
s_min=Gradient_Conjugue_Tronque(f,gradf,hessf,1,[10,0],100,1e-15)
println(s_min)
