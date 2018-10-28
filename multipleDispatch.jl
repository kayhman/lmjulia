_f(::Val{1}) = 1
_f(::Val{2}) = 3
f(n) = _f(Val{n}())

@enum AlgoType FAST SLOW

_compute(x, ::Val{FAST}) = "fast"
_compute(x, ::Val{SLOW}) = "slow"

compute(x, algo) = _compute(x, Val{algo}())

function typeEncode(v)
    println("v: ", typeof(v))
    if typeof(v) == Symbol
        return v
    else
        return esc(:(::Val{v}))
    end
end

function typeCall(v)
    if typeof(v) == Symbol
        return v
    else
        return Val{v}
    end
end

macro makefn(name, args, body)
    fn = Symbol(name)
    eargs = map(esc, args.args)
    targs = map(typeEncode, args.args)
    cargs = map(typeCall, args.args)
    quote
        function $(esc(fn))($(eargs...))
            function hidden($(targs...))
                $body
            end
            hidden($(cargs...))
        end
    end
end

#@makefn lapin (a,b,c) begin
#    12 * a + b - c
#end


#@makefn loup (a,b,c) begin
#    666
#end

#@makefn pierre (a,b,12) begin
#    666
#end

function test(x, algo)
    function _test(::Val{SLOW})
        "lapin"
    end
    _test(Val{algo}())
end

struct MyNumber
    x::Float64
end

for op = (:sin, :cos, :tan, :log, :exp)
    eval(quote
        Base.$op(a::MyNumber) = MyNumber($op(a.x))
    end)
end


for op = (:lapin, :pierre)
    eval(quote
        $op() = 12
    end)
end

macro ff(s)
    quote
        $s() = 12
    end
end

for op = (:lapin2, :pierre2)
    eval(@ff op)
end
