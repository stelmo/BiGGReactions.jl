"""
$(TYPEDSIGNATURES)

Simple GET request that returns `nothing` if the request status is not okay, or
a dictionary of the body of the request.
"""
function _read_parse_id(req::String)
    try 
        r = HTTP.request("GET", "http://bigg.ucsd.edu/api/v2/universal/$req")
        r.status != 200 && return nothing
        return JSON.parse(String(r.body)) 
    catch 
        return nothing
    end
end

"""
$(TYPEDSIGNATURES)

Return the reaction with ID `rid` from the BiGG universal model, otherwise
return `nothing`.
"""
function get_reaction(rid::String; should_cache=true)
    _is_cached("reaction", rid) && return _get_cache("reaction", rid)

    _rxn = _read_parse_id("reactions/$rid")
    isnothing(_rxn) && return nothing 

    rxn = BiGGReaction(
        rid,
        _rxn["name"],
        [
            Dict(k => v for (k, v) in d) for d in _rxn["metabolites"]
        ],
        _rxn["database_links"],
    )
    
    should_cache && _cache("reaction", rid, rxn)

    return rxn
end

"""
$(TYPEDSIGNATURES)

Return the metabolite with ID `mid` from the BiGG universal model, otherwise
return `nothing`.
"""
function get_metabolite(mid::String; should_cache=true)
    _is_cached("metabolite", mid) && return _get_cache("metabolite", mid)

    _met = BiGGReactions._read_parse_id("metabolites/$mid")
    isnothing(_met) && return nothing 

    met = BiGGMetabolite(
        mid,
        _met["name"],
        [x for x in _met["charges"]],
        [x for x in _met["formulae"]],
        _met["database_links"],
    )
 
    should_cache && _cache("metabolite", mid, met)

    return met
end
