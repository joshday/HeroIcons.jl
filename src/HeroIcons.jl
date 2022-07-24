module HeroIcons

using Artifacts

export Icon, outline, solid

# init
src = joinpath(artifact"HeroIcons", "heroicons-1.0.6")
icons = map(x -> replace(x, ".svg" => ""), readdir(joinpath(src, "optimized", "outline")))

#-----------------------------------------------------------------------------# Icon
struct Icon
    name::String
    outline::Bool
    function Icon(name::AbstractString, outline::Bool=true)
        name in icons || error("Icon `$name` not found.")
        new(name, outline)
    end
end

function Base.show(io::IO, ::MIME"text/html", o::Icon)
    sz = o.outline ? 24 : 20
    print(io, """<div style="height: $(sz)px; width: $(sz)px;">""")
    show(io, MIME"text/html"(), HTML(data(o)))
    print(io, "</div>")
end
data(o::Icon) = read(joinpath(src, "optimized", o.outline ? "outline" : "solid", o.name * ".svg"), String)

outline = NamedTuple{Tuple(Symbol.(map(x -> replace(x, "-" => "_"), icons))), NTuple{length(icons), Icon}}(Icon.(icons))
solid = map(x -> Icon(x.name, false), outline)


#-----------------------------------------------------------------------------# Viewer
struct Viewer
    ncols::Int
end
Viewer() = Viewer(5)

function Base.show(io::IO, ::MIME"text/html", o::Viewer)
    println(io, "<h1>Icon Viewer</h1>")
    println(io, "<ul style='columns:$(o.ncols);-webkit-columns:$(o.ncols);-moz-columns:$(o.ncols);list-style-type:none;'>")
    for (k, v) in pairs(outline)
        print(io, "<li style='padding-bottom:16px;'>")
        print(io, "<div style='height:32px;width:32px;color:black !important;'>")
        print(io, data(v))
        print(io, "</div>")
        print(io, "<span style='padding-left: 8px; color:lightgray;'>$k</span>")
        println(io, "</li>")
    end
    println(io, "</ul>")
end

end
