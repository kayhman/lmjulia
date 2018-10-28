function master()
    cha = Channel(0)
    w1 = Task(()->worker(1,cha)) ; w2 = Task(()->worker(10,cha))
    schedule(w1)             ; schedule(w2)

    for n=1:20
        put!(cha,n)
    end
    close(cha)

    while istaskdone(w1) == false || istaskdone(w2) == false
        sleep(0.01)
    end
    println("All finished")
end

function worker(sleep_s,c::Channel)
    for i in c
        sleep(sleep_s)
        println("Got $i and slept $sleep_s")
    end
end
