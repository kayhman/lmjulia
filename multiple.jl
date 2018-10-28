_multiply(x, y::Val) = x * y
_multiply(x, ::Val{2}) = "fastercode"

multiply(x, y) = _multiply(x, Val{y}())
