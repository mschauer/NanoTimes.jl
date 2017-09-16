Base.promote_type(::Type{NanoTime{Int64}}, ::Type{NanoTime{Int128}}) = NanoTime{Int128}
Base.promote_rule(::Type{NanoTime{Int64}}, ::Type{NanoTime{Int128}}) = NanoTime{Int128}
Base.convert(::Type{NanoTime{Int128}}, x::NanoTime{Int64}) = NanoTime{Int128}(value(x))
function Base.convert(::Type{NanoTime{Int64}}, x::NanoTime{Int128})
    if value(x) < typemin(Int64) || value(x) > typemax(Int64)
       throw(InexactError("x out of bounds $(typemin(Int64)) <= $(x) <= $(typemax(Int64))"))
    end
    return NanoTime{Int64}(value(x))
end

Base.promote_type(::Type{NanoSpan{Int64}}, ::Type{NanoSpan{Int128}}) = NanoSpan{Int128}
Base.promote_rule(::Type{NanoSpan{Int64}}, ::Type{NanoSpan{Int128}}) = NanoSpan{Int128}

NanoSpan{Int128}(x::NanoSpan{Int64}) = NanoSpan{Int128}(value(x))
#Base.convert(::Type{NanoSpan{Int128}}, x::NanoSpan{Int64}) = NanoSpan{Int128}(value(x))
function Base.convert(::Type{NanoSpan{Int64}}, x::NanoSpan{Int128})
    if value(x) < typemin(Int64) || value(x) > typemax(Int64)
       throw(InexactError("x out of bounds $(typemin(Int64)) <= $(x) <= $(typemax(Int64))"))
    end
    return NanoSpan{Int64}(value(x))
end

Base.promote(x::NanoTime{Int64},  y::NanoSpan{Int128}) = (NanoTime{Int128}(x), y)
Base.promote(x::NanoTime{Int128}, y::NanoSpan{Int64})  = (x, NanoSpan{Int128}(y))
Base.promote(x::NanoSpan{Int64},  y::NanoTime{Int128}) = (NanoSpan{Int128}(x), y)
Base.promote(x::NanoSpan{Int128}, y::NanoTime{Int64})  = (x, NanoTime{Int128}(y))
