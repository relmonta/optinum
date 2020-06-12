using Documenter
using Optinum

makedocs(
    modules = [Optinum],
    sitename = "optinum",
    authors = "Saloua Naama, Mohamed El Waghf and Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "index.md",
            "Sujet" => "Sujet.md"
            "Algorithmes" => ["Lagrangien augmenté" => "Lagrangien_augmente.md"]
            "Mise en place" => "mise_en_place.md", 
            "Génération du rapport" => "generate_pdf.md",
            "Documentation des fonctions" =>"fct_index.md"          
            ]
    )

#deploydocs(repo = "github.com/mathn7/Optinum.git")
