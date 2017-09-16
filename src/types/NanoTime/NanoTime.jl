struct Clock{T} <: AbstractClock
    value::T
end

@inline value(x::Clock{T}) where T<:IntTimes = x.value
