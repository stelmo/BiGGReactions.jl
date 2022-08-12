"""
$(TYPEDSIGNATURES)

Clear the entire cache.
"""
clear_cache!() = begin
    for dir in readdir(cache_location)
        rm(joinpath(cache_location, dir), recursive = true)
    end
    isfile(joinpath(cache_location, "version.txt")) &&
    rm(joinpath(cache_location, "version.txt"))
    Term.tprint("{blue} Cache cleared! {/blue}")
end

"""
$(TYPEDSIGNATURES)

Checks if the reaction has been cached.
"""
_is_cached(database::String, id) =
    isfile(joinpath(BiGGReactions.cache_location, database, string(id)))

"""
$(TYPEDSIGNATURES)

Return the cached reaction object.
"""
_get_cache(database::String, id) =
    deserialize(joinpath(cache_location, database, string(id)))

"""
$(TYPEDSIGNATURES)

Cache reaction object.
"""
_cache(database::String, id, item) =
    serialize(joinpath(cache_location, database, string(id)), item)
