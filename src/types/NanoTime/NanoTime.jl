struct NanoTime{T} <: AbstractNanoTime
    value::T
end

@inline value(x::NanoTime{T}) where T<:IntTimes = x.value
