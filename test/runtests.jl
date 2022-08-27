using BiGGReactions
using Test

@testset "BiGGReactions.jl" begin
    clear_cache!()
    include("reactions.jl")
    include("metabolites.jl")
end
