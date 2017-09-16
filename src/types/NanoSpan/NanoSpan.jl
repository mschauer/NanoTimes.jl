struct NanoSpan{T} <: AbstractNanoSpan
    value::T
end

@inline value(x::NanoSpan{T}) where T<:IntTimes = x.value
 
Base.promote_type(::Type{NanoSpan{Int64}}, ::Type{NanoSpan{Int128}}) = NanoSpan{Int128}
Base.promote_rule(::Type{NanoSpan{Int64}}, ::Type{NanoSpan{Int128}}) = NanoSpan{Int128}
Base.convert(::Type{NanoSpan{Int128}}, x::NanoSpan{Int64}) = NanoSpan{Int128}(value(x))
function Base.convert(::Type{NanoSpan{Int64}}, x::NanoSpan{Int128})
    if value(x) < typemin(Int64) || value(x) > typemax(Int64)
       throw(InexactError("x out of bounds $(typemin(Int64)) <= $(x) <= $(typemax(Int64))"))
    end
    return NanoSpan{Int64}(value(x))
end


