using HeroIcons
using Test

@testset "HeroIcons.jl" begin
    for (k, v) in pairs(outline)
        @test v isa Icon
    end
end
