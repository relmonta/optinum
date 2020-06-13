using Documenter
using Optinum

makedocs(
    modules = [Optinum],
    sitename = "Optinum.jl",
    strict=true,
    authors = "Saloua Naama, Mohamed El Waghf et Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md",            
            "Sujet" => "Sujet.md",
            "Algorithmes" => [
                "Algorithme de Newton" => "Algorithme_de_newton.md",
                "Les Régions de Confiance" => "Regions_de_confiance.md",    
                "Lagrangien augmenté" => "Lagrangien_augmente.md"                
                ],
             "Travail à réaliser" => [
                "Pour l'algorithme de Newton" => "Questions_Newton.md",
		        "Pour Région de confiance avec pas de cauchy" => "Questions_Pas_De_Cauchy.md",
		        "Pour Région de confiance avec le gradient conjugué tronqué" => "Questions_GCT.md",
		        "Pour Lagrangien Augmenté" => "Questions_Lagrangien_Augmente.md"
             ],
            "Exemples d'appels" =>"Exemples.md",
            "Annexes" => "Annexes.md",
            "Mise en place" => "mise_en_place.md", 
            "Création de Modules en Julia" => "create_package.md",
            "Génération du rapport" => "generate_pdf.md",
            "Documentation des fonctions" =>"fct_index.md"          

            ]
    )

deploydocs(
    repo   = "github.com/mathn7/optinum.git",
    branch = "gh-pages",  
    devbranch = "master",
)
