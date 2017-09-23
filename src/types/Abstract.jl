abstract type AbstractDateAndTime{T} <: Base.Dates.AbstractTime end
abstract type AbstractTimeSpan{T} <: Base.Dates.AbstractTime end
abstract type AbstractClock{T} <: AbstractDateAndTime{T} end
abstract type AbstractSpan{T} <: AbstractTimeSpan{T} end
