using LinearAlgebra, Test, JuMP, Ipopt

# Script vérifiant l'algorithme de Newton
include("test_Algo_Newton.jl")

# Script vérifiént le pas de Cauchy
include("test_pas_de_cauchy.jl")

# Script vérifiant l'algorithme de région de confiance avec PasdeCauchy/GCT
include("test_regions_de_confiance.jl")

include("test_Lagrangien_Aug.jl")
