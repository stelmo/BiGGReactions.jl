@testset "Reactions" begin 
    rxn = get_reaction("PFL")

    @test rxn.id == "PFL"
    @test rxn.name == "Pyruvate formate lyase"
    @test length(rxn.metabolites) == 4 # lazy test

    rxn = get_reaction("PFLxxxxxxxx")
    @test isnothing(rxn)
end