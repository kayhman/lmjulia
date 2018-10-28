const fact = [1.0, 1.0, 2.0, 6.0, 24.0, 120.0, 720.0, 5040.0, 40320.0, 362880.0, 3628800.0, 39916800.0, 479001600.0, 6227020800.0, 87178291200.0, 1307674368000.0, 20922789888000.0, 355687428096000.0, 6402373705728000.0, 121645100408832000.0]

function myExp(cn::Channel{Int64}, csum::Channel{Int64})
    for n in 1:15
        println("got n = ", n)
        put!(csum, 1.0 / fact[n])
        println("forwarded n = ",n)
    end
    return 
end

function mySum(csum::Channel{Int64})
    e = 0
    for t in csum
        println("got t = ",t)
        e += t
    end
    println("e = ", e)
    return e
end

c = Channel{Int64}(0)
csum = Channel{Int64}(0)

tsum = schedule(@task mySum(csum))
tinv = schedule(@task myExp(c, csum))
