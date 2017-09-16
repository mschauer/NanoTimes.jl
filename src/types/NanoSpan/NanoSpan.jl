struct NanoSpan{T} <: AbstractNanoSpan
    value::T
end

@inline value(x::NanoSpan{T}) where T<:IntTimes = x.value
