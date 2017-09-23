import Base.Dates.AbstractTime

abstract type AbstractDateAndTime{T} <: AbstractTime end
abstract type AbstractTimeSpan{T} <: AbstractTime end
abstract type AbstractClock{T} <: AbstractDateAndTime{T} end
abstract type AbstractSpan{T} <: AbstractTimeSpan{T} end
