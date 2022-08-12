module BiGGReactions

using HTTP, JSON, DocStringExtensions, Scratch, Serialization, Term
using Term.Repr

# cache data using Scratch.jl
cache_location = ""
#=
Update these cache directories, this is where each cache type gets stored.
These directories are saved to in e.g. _cache("reaction", rid, rr) in utils.jl
=#
const cache_dirs = ["reaction", "metabolite"]

function __init__()
    global cache_location = @get_scratch!("bigg_data")

    for dir in cache_dirs
        !isdir(joinpath(cache_location, dir)) && mkdir(joinpath(cache_location, dir))
    end

    if isfile(cache_location, "version.txt")
        vnum = read(joinpath(cache_location, "version.txt"))
        if String(vnum) != string(Base.VERSION)
            Term.tprint("""
                        {red} Caching uses Julia's serializer, which is incompatible
                        between different versions of Julia. Please clear the cache with
                        `clear_cache!()` before proceeding. {/red}
                        """)
        end
    else
        write(joinpath(cache_location, "version.txt"), string(Base.VERSION))
    end
end

const Maybe{T} = Union{T,Nothing}

include("types.jl")
include("cache.jl")
include("utils.jl")

export get_reaction,
    get_metabolite,
    clear_cache!

end
