# julia -p 4 -i distributedImg.jl
using Distributed
using Images
using ImageMagick
@everywhere using TestImages

@everywhere img = testimage("lena_gray_512")


function pooling()
    res = for i = 1:64
        row = @distributed (vcat) for j = i:64
            si = img[8(i-1)+1:8i,8(j-1)+1:8j]
            m = maximum(si)
            [float(m)]
        end
    end
end
