import Base: convert, promote_rule, promote_type, promote

promote_type(::Type{NanoTime{Int64}}, ::Type{NanoTime{Int128}}) = NanoTime{Int128}
promote_rule(::Type{NanoTime{Int64}}, ::Type{NanoTime{Int128}}) = NanoTime{Int128}


NanoTime{Int128}(x::NanoTime{Int64}) = NanoTime{Int128}(value(x))
#convert(::Type{NanoTime{Int128}}, x::NanoTime{Int64}) = NanoTime{Int128}(value(x))
function convert(::Type{NanoTime{Int64}}, x::NanoTime{Int128})
    if value(x) < typemin(Int64) || value(x) > typemax(Int64)
       throw(InexactError("x out of bounds $(typemin(Int64)) <= $(x) <= $(typemax(Int64))"))
    end
    return NanoTime{Int64}(value(x))
end

promote_type(::Type{NanoSpan{Int64}}, ::Type{NanoSpan{Int128}}) = NanoSpan{Int128}
promote_rule(::Type{NanoSpan{Int64}}, ::Type{NanoSpan{Int128}}) = NanoSpan{Int128}

NanoSpan{Int128}(x::NanoSpan{Int64}) = NanoSpan{Int128}(value(x))
convert(::Type{NanoSpan{Int128}}, x::NanoSpan{Int64}) = NanoSpan{Int128}(value(x))

function convert(::Type{NanoSpan{Int64}}, x::NanoSpan{Int128})
    if value(x) < typemin(Int64) || value(x) > typemax(Int64)
       throw(InexactError("x out of bounds $(typemin(Int64)) <= $(x) <= $(typemax(Int64))"))
    end
    return NanoSpan{Int64}(value(x))
end
NanoSpan{Int64}(x::NanoSpan{Int128}) = convert(NanoSpan{Int64}, x)

promote(x::NanoTime{Int64},  y::NanoSpan{Int128}) = (NanoTime{Int128}(x), y)
promote(x::NanoTime{Int128}, y::NanoSpan{Int64})  = (x, NanoSpan{Int128}(y))
promote(x::NanoSpan{Int64},  y::NanoTime{Int128}) = (NanoSpan{Int128}(x), y)
promote(x::NanoSpan{Int128}, y::NanoTime{Int64})  = (x, NanoTime{Int128}(y))
