macro returnWithError(err, msg)
    quote
        if $(esc(err)) != nothing
            println($msg)
            return $(esc(err))
        end
    end
end

function getName()
    return "pierre", nothing
end

function getNameFail()
    return "pierre", -1
end

function helloOk()
    name, lerr = getName()
    @returnWithError lerr  "Failed to get name"
    println("Hello Pierre")
end

function helloFail()
    name, lerr = getNameFail()
    @returnWithError lerr  "Failed to get name"
    println("Hello Pierre")
end
