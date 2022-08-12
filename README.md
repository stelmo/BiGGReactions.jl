# BiGGReactions.jl
[repostatus-url]: https://www.repostatus.org/#active
[repostatus-img]: https://www.repostatus.org/badges/latest/active.svg

[![repostatus-img]][repostatus-url]

This is a simple package to automatically download BiGG reactions and metabolites from 
the [BiGG website](http://bigg.ucsd.edu/). It automatically caches responses to speed up 
repeated requests.

You can get information about a reaction from the universal model using its ID:
```julia
rxn = get_reaction("PFL")
```
And you can get information about a metabolite from the universal model through its ID:
```julia
met = get_metabolite("h2o")
```
You can test the package with:
```julia
] test
```
### Troubleshooting
The cache can be source of subtle issues. If you get errors or unexpected behavior try the following:
1. `clear_cache!()`, restart the Julia session and, try again.
2. If you still get issues, manually delete the cache files at `BiGGReactions.cache_location`, restart the Julia session, and try again.
3. File an issue :/ 

