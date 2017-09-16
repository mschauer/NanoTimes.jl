const UIdigits = Union{Vector{UInt8}, Tuple{UInt8}, NTuple{2,UInt8}, NTuple{3,UInt8}, NTuple{4,UInt8}}

const Offset0 = UInt8('0') - one(UInt8)

chars_to_uints(chars::Vector{Char}) = map(x -> UInt8(x) - Offset0, chars)
string_to_uints(str::String) = chars_to_uints([str...])

const Place1s    = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
const Place10s   = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]
const Place100s  = [0, 100, 200, 300, 400, 500, 600, 700, 800, 900]
const Place1000s = [0, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000]

@inline function uints_to_int(u1::UInt8)
    return Place1s[u1]
end
@inline function uints_to_int(u1::UInt8, u2::UInt8)
    return Place1s[u2] + Place10s[u1]
end
@inline function uints_to_int(u1::UInt8, u2::UInt8, u3::UInt8)
    return Place1s[u3] + Place10s[u2] + Place100s[u1]
end
@inline function uints_to_int(u1::UInt8, u2::UInt8, u3::UInt8, u4::UInt8)
    return Place1s[u4] + Place10s[u3] + Place100s[u2] + Place1000s[u1]
end

function str_to_int(str::String)
    uints = string_to_uints(str)
    return uints_to_int(uints...)
end
