using HTTP
using Base.Threads

function request()
    r = HTTP.request("GET", "http://httpbin.org/ip")
    println(String(r.body))
    #sleep(1)
end

function bench()
    for i in 1:10
        request()
    end
end


function asyncBench()
    @sync begin
        for i in 1:10
            @async request()
        end
    end
end
