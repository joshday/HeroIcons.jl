module HeroIcons

using Artifacts

export Icon, outline, solid

path = joinpath(artifact"HeroIcons", only(readdir(artifact"HeroIcons")), "optimized")

icons = map(x -> Symbol(replace(x, ".svg" => "", "-" => "_")), readdir(joinpath(path, "24", "outline")))

_filename(x) = replace(string(x), " " => "-", "_" => "-") * ".svg"
raw_outline(x) = read(joinpath(path, "24", "outline", _filename(x)), String)
raw_solid(x) = read(joinpath(path, "24", "solid", _filename(x)), String)
raw_mini(x) = read(joinpath(path, "20", "solid", _filename(x)), String)
raw_micro(x) = read(joinpath(path, "16", "solid", _filename(x)), String)

#-----------------------------------------------------------------------------# Icon
struct Icon
    name::Symbol
    style::Symbol
    function Icon(name::Symbol, style::Symbol=:outline)
        @assert name in icons
        @assert style in (:outline, :solid, :mini, :micro)
        new(name, style)
    end
end

function Base.show(io::IO, ::MIME"text/html", icon::Icon)
    str = icon.style == :outline ? raw_outline(icon.name) :
        icon.style == :solid ? raw_solid(icon.name) :
        icon.style == :mini ? raw_mini(icon.name) :
        raw_micro(icon.name)
    println(io, str)
end

outline = NamedTuple{Tuple(icons), NTuple{length(icons), Icon}}(Icon.(icons))
solid = map(x -> Icon(x.name, :solid), outline)
mini = map(x -> Icon(x.name, :mini), outline)
micro = map(x -> Icon(x.name, :micro), outline)


#-----------------------------------------------------------------------------# Viewer
struct Viewer
    style::Symbol
    function Viewer(style::Symbol=:outline)
        @assert style in (:outline, :solid, :mini, :micro)
        new(style)
    end
end

function Base.show(io::IO, ::MIME"text/html", o::Viewer)
    println(io, "<h1>Icon Viewer ($(o.style))</h1>")
    println(io, "<div style='display:flex;flex-wrap:wrap;color=black'>")
    for icon in getproperty(HeroIcons, o.style)
        print(io, "<div style='display:block;height:24px;width:24px;padding:8px;' title='$(icon.name)'>")
        show(io, MIME"text/html"(), icon)
        print(io, "</div>")
    end
    println(io, "</div>")
end

end
