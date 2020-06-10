module Optinum

using LinearAlgebra
using Test
using JuMP

include("Algorithme_de_Newton.jl")
include("Gradient_Conjugue_Tronque.jl")
include("Lagrangien_Augmente.jl")
include("Pas_De_Cauchy.jl")
include("Regions_de_confiance.jl")

export  Algorithme_de_Newton, Gradient_Conjugue_Tronque, Lagrangien_Augmente, Pas_De_Cauchy, Regions_de_confiance

end # module
