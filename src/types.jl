@with_repr struct BiGGReaction 
    id :: String
    name :: String
    metabolites :: Vector{Dict{String, Union{String, Float64}}}
    database_links :: Dict{String, Any}
end

@with_repr struct BiGGMetabolite
    id :: String
    name :: String
    charges :: Vector{Int64}
    formulas :: Vector{String}
    database_links :: Dict{String, Any}
end