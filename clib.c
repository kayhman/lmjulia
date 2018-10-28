// gcc -shared -fPIC -o libclib.so clib.c
// push!(Libdl.DL_LOAD_PATH,"/home/gsaupin/Projects/Writings/LM/julia")
// julia> x=ccall((:mean,"libclib"),Float64,(Float64,Float64),2.0,5.0)
double mean(double a, double b) {
return (a+b) / 2.0;
}
