"""
$(TYPEDEF)

A struct for storing BiGG reaction information. Does not store the metabolite
information execpt its ID. 

$(FIELDS)
"""
@with_repr struct BiGGReaction 
    id :: String
    name :: String
    metabolites :: Vector{Dict{String, Union{String, Float64}}}
    database_links :: Dict{String, Any}
end

"""
$(TYPEDEF)

A struct for storing BiGG metabolite information. 

$(FIELDS)
"""
@with_repr struct BiGGMetabolite
    id :: String
    name :: String
    charges :: Vector{Int64}
    formulas :: Vector{String}
    database_links :: Dict{String, Any}
end