### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 4c148672-8b79-11eb-0133-6de14d906224
using HeroIcons, PlutoUI

# ╔═╡ 39d69132-8b7a-11eb-06cf-bfa0618705d8
begin
	opts = map(x -> replace(x, ".svg" => ""), readdir(
		joinpath(@__DIR__, "..", "deps", "heroicons-0.4.2", "optimized", "outline")
	))
	
	md"""
	# Choose an Icon to View
	$(@bind icon Select(opts))
	"""
end

# ╔═╡ 4c30529a-8b7d-11eb-314d-1ba4c5db4103
HeroIcon(icon, css="height:3em; width:3em")

# ╔═╡ 555361a0-8b7d-11eb-189e-31e44fd4fd2d
md"# In HTML"

# ╔═╡ a3b68f84-8b7d-11eb-0562-1911d449f75d
let 
	s = repr("text/html", HeroIcon(icon, css="height:1em; width:1em; display:inline-block;"))
	HTML("""<h4>$s This is inside an H4 Tag</h4>""")
end

# ╔═╡ 9355cd84-8b7e-11eb-0278-05736b4c3983
md"# In Markdown"

# ╔═╡ 9792e224-8b7e-11eb-2816-f767eac59cf4
md"""
$(HeroIcon(icon, css="height: 2em; width:2em"))
"""

# ╔═╡ Cell order:
# ╠═4c148672-8b79-11eb-0133-6de14d906224
# ╟─39d69132-8b7a-11eb-06cf-bfa0618705d8
# ╟─4c30529a-8b7d-11eb-314d-1ba4c5db4103
# ╟─555361a0-8b7d-11eb-189e-31e44fd4fd2d
# ╠═a3b68f84-8b7d-11eb-0562-1911d449f75d
# ╟─9355cd84-8b7e-11eb-0278-05736b4c3983
# ╠═9792e224-8b7e-11eb-2816-f767eac59cf4
