"""
$(TYPEDEF)

A struct for storing BiGG reaction information.

$(FIELDS)
"""
@with_repr struct BiGGReaction 
    id :: String
end

"""
$(TYPEDEF)

A struct for storing BiGG metabolite information. 

$(FIELDS)
"""
@with_repr struct BiGGMetabolite
    id :: String
end