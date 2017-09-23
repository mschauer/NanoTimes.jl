import Base.Dates.AbstractTime

abstract type AbstractTimeDate{T} <: AbstractTime end
abstract type AbstractTimeSpan{T} <: AbstractTime end

#=
const IntsForTime = Union{Int64, Int128}

struct TimeDate{T} <: AbstractTimeDate{T}
    value::T

    function TimeDate(value::T) where T<:IntsForTime
        return TimeDate{T}(value)
    end
end

struct TimeSpan{T} <: AbstractTimeSpan{T}
    value::T

    function TimeSpan(value::T) where T<:IntsForTime
        return TimeSpan{T}(value)
    end
end

=#

