using LinearAlgebra, Test

#Script vérifiant l'algorithme de Newton
include("test_Algo_Newton.jl")
printstyled("Lancement des tests sur ",bold=true,color=:white)
printstyled("l'algorithme de Newton ",bold=true,color=:blue)
println("")
#nbTests_reussis , nbtest_total = test_Algo_Newton(false)
test_Algo_Newton(false)


#printstyled(string(nbTests_reussis) * " tests réussis sur " * string(nbtest_total) * "\n",bold=true,color=:green)


# Script vérifiént le pas de Cauchy
include("test_pas_de_cauchy.jl")
printstyled("Lancement des tests sur",bold=true,color=:white)
printstyled(" le pas de cauchy ",bold=true,color=:blue)
println("")

#nbTests_reussis , nbtest_total = test_pas_de_cauchy(false)
test_pas_de_cauchy(false)


#printstyled(string(nbTests_reussis) * " tests réussis sur " * string(nbtest_total) * "\n",bold=true,color=:green)


# Script vérifiant l'algorithme de région de confiance avec PasdeCauchy/GCT
include("test_regions_de_confiance.jl")
printstyled("Lancement des tests sur",bold=true,color=:white)
printstyled(" les régions de confiance ",bold=true,color=:blue)
println("")

#nbTests_reussis , nbtest_total = test_regions_de_confiance(false)
test_regions_de_confiance(false)

#printstyled(string(nbTests_reussis) * " tests réussis sur " * string(nbtest_total) * "\n",bold=true,color=:green)


# Script vérifiant l'algorithme de Lagrangien augmenté
include("test_Lagrangien_Augmente.jl")

printstyled("Lancement des tests sur ",bold=true,color=:white)
printstyled("le Lagrangien augmenté ",bold=true,color=:blue)
println("")

#nbTests_reussis , nbtest_total = test_Lagrangien_Augmente(false)
#test_Lagrangien_Augmente(false)

#printstyled(string(nbTests_reussis) * " tests réussis sur " * string(nbtest_total) * "\n",bold=true,color=:green)
