using LinearAlgebra, Test, Markdown

#Script vérifiant l'algorithme de Newton
include("test_Algo_Newton.jl")

printstyled("Lancement des tests sur ",bold=true,color=:white)
printstyled("l'algorithme de Newton ",bold=true,color=:blue)
println("")

try
	test_Algo_Newton(false)
catch exception
	printstyled("$exception "*"\n"*"\n",bold=true,color=:red)
end


# Script vérifiént le pas de Cauchy

include("test_pas_de_cauchy.jl")

printstyled("Lancement des tests sur",bold=true,color=:white)
printstyled(" le pas de cauchy ",bold=true,color=:blue)
println("")

try
	test_pas_de_cauchy(false)
catch exception
	printstyled("$exception "*"\n"*"\n",bold=true,color=:red)
end


# Script vérifiant l'algorithme de région de confiance avec PasdeCauchy/GCT
include("test_regions_de_confiance.jl")
printstyled("Lancement des tests sur",bold=true,color=:white)
printstyled(" les régions de confiance ",bold=true,color=:blue)
println("")


try 
	test_regions_de_confiance(false)
catch exception
	printstyled("$exception "*"\n"*"\n",bold=true,color=:red)
end


# Script vérifiant l'algorithme de Lagrangien augmenté
include("test_Lagrangien_Augmente.jl")

printstyled("Lancement des tests sur ",bold=true,color=:white)
printstyled("le Lagrangien augmenté ",bold=true,color=:blue)
println("")


try
	test_Lagrangien_Augmente(false)
catch exception
	printstyled("$exception "*"\n"*"\n",bold=true,color=:red)
end



