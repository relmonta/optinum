using Documenter
using Optinum

makedocs(
    modules = [Optinum],
    sitename = "Optinum",
    authors = "Saloua Naama, Mohamed El Waghf and Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md",
            "Mise en place" => "mise_en_place.md", 
            "Génération du rapport" => "generate_pdf.md",
            "Documentation des fonctions" =>"fct_index.md",
	    "Sujet" => "Sujet.md",  
	    "Algorithme de Newton" => "Algorithme_de_newton.md",          
            ]
    )

deploydocs(repo = "github.com/mathn7/Optinum.git")
