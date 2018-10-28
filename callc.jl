using Libdl

push!(Libdl.DL_LOAD_PATH,"/home/gsaupin/Projects/Writings/LM/julia")
x=ccall((:mean,"libclib"),Float64,(Float64,Float64),2.0,5.0)
