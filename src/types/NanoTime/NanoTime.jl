struct NanoTime{T} <: AbstractNanoTime
    value::T
end

@inline value(x::NanoTime{T}) where T<:IntTimes = x.value

Base.promote_type(::Type{NanoTime{Int64}}, ::Type{NanoTime{Int128}}) = NanoTime{Int128}
Base.promote_rule(::Type{NanoTime{Int64}}, ::Type{NanoTime{Int128}}) = NanoTime{Int128}
Base.convert(::Type{NanoTime{Int128}}, x::NanoTime{Int64}) = NanoTime{Int128}(value(x))
function Base.convert(::Type{NanoTime{Int64}}, x::NanoTime{Int128})
    if value(x) < typemin(Int64) || value(x) > typemax(Int64)
       throw(InexactError("x out of bounds $(typemin(Int64)) <= $(x) <= $(typemax(Int64))"))
    end
    return NanoTime{Int64}(value(x))
end


