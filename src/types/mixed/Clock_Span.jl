import Base: convert, promote_rule, promote_type, promote

promote_type(::Type{Clock{Int64}}, ::Type{Clock{Int128}}) = Clock{Int128}
promote_rule(::Type{Clock{Int64}}, ::Type{Clock{Int128}}) = Clock{Int128}

Clock{I2}(x::Clock{Int64}) where I2<:Int128 = Clock{I2}(value(x))
convert(::Type{Clock{Int128}}, x::Clock{Int64}) = Clock{Int128}(x)

function Clock{I1}(x::Clock{Int128}) where I1<:Int64
    if value(x) < typemin(Int64) || value(x) > typemax(Int64)
       throw(InexactError("x out of bounds $(typemin(Int64)) <= $(x) <= $(typemax(Int64))"))
    end
    return Clock{Int64}(value(x))
end
convert(::Type{Clock{Int64}}, x::Clock{Int128}) = Clock{Int64}(x)

promote_type(::Type{Span{Int64}}, ::Type{Span{Int128}}) = Span{Int128}
promote_rule(::Type{Span{Int64}}, ::Type{Span{Int128}}) = Span{Int128}

Span{I2}(x::Span{Int64}) where I2<:Int128 = Span{Int128}(value(x))
convert(::Type{Span{Int128}}, x::Span{Int64}) = Span{Int128}(x)

function Span{I1}(x::Span{Int128}) where I1<:Int64
    if value(x) < typemin(Int64) || value(x) > typemax(Int64)
       throw(InexactError("x out of bounds $(typemin(Int64)) <= $(x) <= $(typemax(Int64))"))
    end
    return Span{Int64}(value(x))
end
convert(::Type{Span{Int64}}, x::Span{Int128}) = Span{Int64}(x)

promote(x::Clock{Int64},  y::Span{Int128}) = (Clock{Int128}(x), y)
promote(x::Clock{Int128}, y::Span{Int64})  = (x, Span{Int128}(y))
promote(x::Span{Int64},  y::Clock{Int128}) = (Span{Int128}(x), y)
promote(x::Span{Int128}, y::Clock{Int64})  = (x, Clock{Int128}(y))
