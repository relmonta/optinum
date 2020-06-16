using LinearAlgebra
using Test
using Optinum
using Test_Optinum

test_Algo_Newton(false,Algorithme_De_Newton)
test_pas_de_cauchy(false,Pas_De_Cauchy)
test_regions_de_confiance(false,Regions_De_Confiance)
test_Lagrangien_Augmente(false,Lagrangien_Augmente)

