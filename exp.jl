# julia -i exp.jl
# @time bench()
const fact = [1.0, 1.0, 2.0, 6.0, 24.0, 120.0, 720.0, 5040.0, 40320.0, 362880.0, 3628800.0, 39916800.0, 479001600.0, 6227020800.0, 87178291200.0, 1307674368000.0, 20922789888000.0, 355687428096000.0, 6402373705728000.0, 121645100408832000.0]

function myExp(n::Int64)
    e::Float64 = 0.0
    for i = 1:n
        e += 1.0 / fact[i]
    end
    return e
end


function bench()
    e::Float64 = 0.0
    for i = 1:1000000
        e += myExp(20)
    end
    println("e: ", e)
end
