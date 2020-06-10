using Documenter
using Optinum

makedocs(
    modules = [Optinum],
    sitename = "Optinum",
    authors = "Saloua Naama, Mohamed El Waghf and Rachid ELMontassir",
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    pages = [
            "Accueil" => "accueil.md",
            "Mise en place" => "mise_en_place.md",            
            ]
    )

deploydocs(repo = "github.com/mathn7/Optinum.git")
