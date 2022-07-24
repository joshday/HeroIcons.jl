# HeroIcons

- This package provides access to the [https://heroicons.com](https://heroicons.com) collection of SVG icons from Julia.
- Any `HeroIcons.Icon` will display as expected in `MIME"text/html"` environments (like [Pluto](https://github.com/fonsp/Pluto.jl)!).


## Usage

```julia
using HeroIcons

Icon("arrow-circle-down")  # outline

Icon("arrow-circle-down", false)  # solid
```

- For ease of use, HeroIcons exports two NamedTuples (`outline` and `solid`) that contain every `Icon`.  This lets you auto-complete icon names.

```julia
julia> outline.arrow  # pressing tab in the REPL/Pluto will reveal matching icons.
arrow_circle_down  arrow_circle_right  arrow_down ...
```

- To quickly view icons, use HeroIcons.jl with Cobweb.jl!

```julia
using Cobweb

Cobweb.Page(outline.arrow_circle_down)  # View a single icon

Cobweb.Page(HeroIcons.Viewer())  # See all available icons
```
