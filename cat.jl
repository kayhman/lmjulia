struct Cat
    name::String
end


function Base.sin(c::Cat)
    1.0
end
