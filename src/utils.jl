"""
$(TYPEDSIGNATURES)

Simple GET request that returns `nothing` if the request status is not okay, or
a dictionary of the body of the request.
"""
function _read_parse_id(req::String)
    r = HTTP.request("GET", "http://bigg.ucsd.edu/api/v2/universal/$req")
    r.status != 200 && return nothing
    JSON.parse(String(r.body)) 
end

"""
$(TYPEDSIGNATURES)

Return the reaction with ID `rid` from the BiGG universal model, otherwise
return `nothing`.
"""
function get_reaction(rid::String; should_cache=true)
    _is_cached("reaction", rid) && return _get_cache("reaction", rid)

    rxn = _read_parse_id("reactions/$rid")
    isnothing(rxn) && return nothing 

    should_cache && _cache("reaction_metabolites", rid, rxn)

    return rxn
end

"""
$(TYPEDSIGNATURES)

Return the metabolite with ID `mid` from the BiGG universal model, otherwise
return `nothing`.
"""
function get_metabolite(mid::String; should_cache=true)
    _is_cached("metabolite", mid) && return _get_cache("metabolite", mid)

    met = _read_parse_id("metabolites/$mid")
    isnothing(met) && return nothing 

    should_cache && _cache("metabolite", mid, met)

    return met
end