@testset "Metabolites" begin 
    met = get_metabolite("h2o")
   
    @test met.id == "h2o"
    @test met.name == "H2O H2O" 
    @test met.charges == [0]
    @test met.formulas == ["H2O"]

    met = get_metabolite("h2ooooooooo")
    @test isnothing(met) 
end