struct Span{T} <: AbstractSpan
    value::T
end

@inline value(x::Span{T}) where T<:IntTimes = x.value
