struct NanoTime{T} <: AbstractNanoTime
    value::T
end

value(x::NanoTime{T}) where T<:IntTimes = x.value
