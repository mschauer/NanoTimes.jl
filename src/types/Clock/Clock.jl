struct Clock{T} <: AbstractClock{T}
    value::T
end

@inline value(x::Clock{T}) where T<:IntTimes = x.value

Clock(value::T) where T<:IntTimes = Clock{T}(value)

function Clock(value::T) where T<:Base.Dates.AbstractTime
    try
         return convert(Clock, value)
     catch e
         throw(e)
     end
end
