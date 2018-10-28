function feed(c::Channel{String})
    put!(c,"pierre")
    put!(c,"paul")
    put!(c,"jack")
    put!(c,"jean")
    @show "Lapin"
    return
end;


c = Channel{String}(0)

task = @async feed(c);

take!(c)
