# HeroIcons

This package provides access to the [https://heroicons.com](https://heroicons.com) collection of SVG icons from Julia.  

My main main use case is adding icons to [Pluto](https://github.com/fonsp/Pluto.jl) notebooks with large UI components.


## Usage is Simple

```julia
using HeroIcons 

HeroIcon("adjustments", css="height:100px; width:100px")
```