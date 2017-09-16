abstract type AbstractDateTime <: Base.Dates.AbstractTime end
abstract type AbstractTimeSpan <: Base.Dates.AbstractTime end
abstract type AbstractClock <: AbstractDateTime end
abstract type AbstractSpan <: AbstractTimeSpan end
