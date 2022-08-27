module BiGGReactions

using HTTP, JSON, DocStringExtensions, Scratch, Serialization, Term
using Term.Repr

# cache data using Scratch.jl
CACHE_LOCATION::String = ""
#=
Update these cache directories, this is where each cache type gets stored.
These directories are saved to in e.g. _cache("reaction", rid, rr) in utils.jl
=#
const CACHE_DIRS = ["reaction", "metabolite"]

function __init__()
    global CACHE_LOCATION = @get_scratch!("bigg_data")

    for dir in CACHE_DIRS
        !isdir(joinpath(CACHE_LOCATION, dir)) && mkdir(joinpath(CACHE_LOCATION, dir))
    end

    if isfile(joinpath(CACHE_LOCATION, "version.txt"))
        vnum = read(joinpath(CACHE_LOCATION, "version.txt"))
        if String(vnum) != string(Base.VERSION)
            Term.tprint("""
                        {red} Caching uses Julia's serializer, which is incompatible
                        between different versions of Julia. Please clear the cache with
                        `clear_cache!()` before proceeding. {/red}
                        """)
        end
    else
        write(joinpath(CACHE_LOCATION, "version.txt"), string(Base.VERSION))
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
