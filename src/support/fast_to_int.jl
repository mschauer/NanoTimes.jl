
function gen_placevalue_dict()
    placevalue = Dict( 0x00 => 0, 0x01 => 1, 0x10 => 0x0a)f
    for place10s in 0:9
        place10 = UInt8(place10)
        for place1s in 0:9
            place1 = UInt8(place10)
            key = (place10 << 4) | place1
            value = place10 * 0x0a + place1
            placevalue[ key ] = value
         end
    end
    return placevalue
end

const PlaceValue = copy(gen_placevalue_dict())

@inline placevalue_key(place10::UInt8, place1::UInt8) = place10 << 4 | place1


const UIdigits = Union{Vector{UInt8}, Tuple{UInt8}, NTuple{2,UInt8}, NTuple{3,UInt8}, NTuple{4,UInt8}}

const Offset0 = UInt8('0') - one(UInt8)
@inline char_to_uint(char::Char) = UInt8(x) - Offset0
@inline two_chars_to_uints(place10::Char, place1::Char) =
    char_to_uint(place10), char_to_uint(place1)
@inline str2_to_uints(str::String) = two_chars_to_uints(str[1], str[2])

@inline two_chars_to_key(place10::Char, place1::Char) =
    placevalue_key(two_chars_to_uings(place10, place1)...)
@inline str2_to_key(str::String) = two_chars_to_key(str[1], str[2])

str2_to_int(str::String) =


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
