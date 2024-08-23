# HeroIcons

- This package provides access to the [https://heroicons.com](https://heroicons.com) collection of SVG icons from Julia.
- Any `HeroIcons.Icon` will display as expected in `MIME"text/html"` environments (like [Pluto](https://github.com/fonsp/Pluto.jl)!).


## Usage

HeroIcons come in four sizes/styles: `outline`, `solid`, `mini`, and `micro`.  Each size/style has its own set of icons.

- You can retrieve the raw SVG string via `raw_outline(:arrow_down)` (similarly for `solid`, `mini`, and `micro`).
- The `Icon` object (`Icon(icon_name::Symbol, style::Symbol)`) displays the SVG in `MIME"text/html"` environments.
- Icons are "queryable" via `HeroIcons.outline.<TAB>` (similarly for `solid`, `mini`, and `micro`).  E.g. `HeroIcons.outline.arrow_down` will return the `Icon` object for the icon `arrow_down`.

```julia
using HeroIcons

HeroIcons.outline.arrow_down

HeroIcons.solid.arrow_down

HeroIcons.mini.arrow_down

HeroIcons.micro.arrow_down
```

- To quickly view icons, use HeroIcons.jl with Cobweb.jl!

```julia
using Cobweb

Cobweb.preview(outline.arrow_circle_down)  # View a single icon

Cobweb.preview(HeroIcons.Viewer())  # See all available icons
```
