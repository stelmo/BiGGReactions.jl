"""
$(TYPEDSIGNATURES)

Clear the entire cache.
"""
clear_cache!() = begin
    for dir in readdir(CACHE_LOCATION)
        rm(joinpath(CACHE_LOCATION, dir), recursive = true)
        dir != "version.txt" && mkdir(joinpath(CACHE_LOCATION, dir)) # add back the empty dir
    end
    write(joinpath(CACHE_LOCATION, "version.txt"), string(Base.VERSION))    
    Term.tprint("{blue} Cache cleared! {/blue}")
end

"""
$(TYPEDSIGNATURES)

Checks if the reaction has been cached.
"""
_is_cached(database::String, id) =
    isfile(joinpath(BiGGReactions.CACHE_LOCATION, database, string(id)))

"""
$(TYPEDSIGNATURES)

Return the cached reaction object.
"""
_get_cache(database::String, id) =
    deserialize(joinpath(CACHE_LOCATION, database, string(id)))

"""
$(TYPEDSIGNATURES)

Cache reaction object.
"""
_cache(database::String, id, item) =
    serialize(joinpath(CACHE_LOCATION, database, string(id)), item)
