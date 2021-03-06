function gen_placevalue_dict()
    placevalue = Dict( 0x00 => 0, 0x01 => 1, 0x10 => 0x0a)
    for place10s in 0:9
        place10 = UInt8(place10s)
        for place1s in 0:9
            place1 = UInt8(place1s)
            key = (place10 << 4) | place1
            value = place10 * 0x0a + place1
            placevalue[ key ] = Int16(value)
         end
    end
    return placevalue
end

const Place1s    = Int16[0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09]
const PlaceValue = gen_placevalue_dict()

@inline placevalue_key(place10::UInt8, place1::UInt8) = place10 << 4 | place1

const UIdigits = Union{Vector{UInt8}, Tuple{UInt8}, NTuple{2,UInt8}, NTuple{3,UInt8}, NTuple{4,UInt8}}

const Offset0 = UInt8('0')
@inline char_to_uint(char::Char) = UInt8(char) - Offset0

@inline two_chars_to_uints(place10::Char, place1::Char) =
    char_to_uint(place10), char_to_uint(place1)
@inline str2_to_uints(str::String) = two_chars_to_uints(str[1], str[2])

@inline two_chars_to_key(place10::Char, place1::Char) =
    placevalue_key(two_chars_to_uints(place10, place1)...)

@inline function str1_to_int(str::String)
    return Place1s[ char_to_value(str[1]) ]
end

@inline function str2_to_int(str::String)
    return PlaceValue[ two_chars_to_key(str[1], str[2]) ]
end

@inline function str3_to_int(str::String)
    return Int16(100) * PlaceValue[ two_chars_to_key('0', str[1]) ] + PlaceValue[ two_chars_to_key(str[2], str[3]) ]
end

@inline function str4_to_int(str::String)
    return Int16(100) * PlaceValue[ two_chars_to_key(str[1], str[2]) ] + PlaceValue[ two_chars_to_key(str[3], str[4]) ]
end

function str_to_smallint(str::String, targetType::Integer=Int)
    n = length(str)
    result = 0
    if iseven(n)
        if n == 2
            result = str2_to_int(str)
		elseif n == 4
		    result = str4_to_int(str)
		end
	else
        if n == 3
            result = str3_to_int(str)
        elseif n == 1
            result = str1_to_int(str)
        end
    end
    return targetType(result)
end
