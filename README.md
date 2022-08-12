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
The cache can be source of subtle issues. If you get errors or unexpected behavior do:
1. `clear_cache!()`,
2. Restart the Julia session.
If you still get errors, please file an issue!

