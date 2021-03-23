module HeroIcons

export HeroIcon

function __init__()
    if !isdir(joinpath(@__DIR__, "..", "deps", "heroicons-0.4.2"))
        error("HeroIcons should be rebuilt.")
    end
end

struct HeroIcon 
    name::String
    style::Symbol
    data::String
    css::String
    function HeroIcon(name::String; style::Symbol = :outline, css = "height:24px;width:24px;")
        style in [:outline, :solid] || error("style must be :outline or :solid")
        data = read(joinpath(@__DIR__, "..", "deps", "heroicons-0.4.2", "optimized", "$style", "$name.svg"), String)
        new(name, style, data, css)
    end
end
function Base.show(io::IO, o::HeroIcon)
    println(io, "HeroIcon: \"$(o.name)\"")
    println(io, "  - style: ", o.style)
    println(io, "  - css:   ", o.css)
end


function Base.show(io::IO, ::MIME"text/html", o::HeroIcon)
    show(io, MIME"text/html"(), HTML("""<div style="$(o.css)")>$(o.data)</div>"""))
end

end
