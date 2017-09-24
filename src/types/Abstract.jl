abstract type SpatioTemporal end

abstract type Spatial  <: SpatioTemporal end
abstract type Temporal <: SpatioTemporal end

#=>
    Type Parameters

    T is the primitive type used for time keeping in the applicable frame
    Z is locative as an operational relative frame for temporal reference
<=#

abstract type AbstractMoment{T}    <: Temporal end
abstract type AbstractDuration{T}  <: Temporal end

#=>
    Simple Supertypes

    These types are free of determinative location and live as proleptic Gregorians
<=#

abstract type AbstractClock{T}     <: AbstractMoment{T}   end  # date with timeofday
                                                               # moments    are the *tocks*
                                                               # timestamps are the *ticks*

abstract type AbstractDate{T}      <: AbstractClock{T}    end  # date without timeofday
abstract type AbstractTimeOfDay{T} <: AbstractClock{T}    end  # timeofday without date

#=>
    Informed Types

    These types allow temporal frameworks and admit location-aware zones
<=#

abstract type Clocks{T,Z}     <: AbstractClock{T}     end  # date with timeofday
abstract type Dates{T,Z}      <: AbstractDate{T}      end  # date without timeofday
abstract type TimesOfDay{T,Z} <: AbstractTimeOfDay{T} end  # timeofday without date

#=>
    Kinds of Duration

    unattached ( not rooted to a specific initial moment )
               *  clock2 - clock1, date2 - date1
               *  three months and five days

    attached   ( temporal exent taken from a specific initial moment )
               *  the second Friday after the first Monday in September 2017
               *  every other Tuesday starting with 2017-10-03
               *  the end of the current Quarter

    undirected ( temporal extent that is unsigned )
               * a cover encompassing moments given as equi-grain [multi-]sequence[s]

    oriented   ( temporal extent signed, and {- abs} apply )
               * a span, an inclusion of moment-grain sequence[s]
<=#

abstract type AbstractTimePeriod{T} <: AbstractDuration{T} end # attachable undirected
abstract type AbstractTimeSpan{T}   <: AbstractDuration{T} end # unattached oriented

abstract type TimePeriods{T,Z} <: AbstractTimePeriod{T} end # Z relative, mean solar seconds
abstract type TimeSpans{T,Z}   <: AbstractTimeSpan{T}   end # Z relative, 86400 SI seconds


#= was

import Base.Dates.AbstractTime

abstract type AbstractTimePeriod{T} <: AbstractDuration{T} end # attachable undirected
abstract type AbstractTimeSpan{T}   <: AbstractDuration{T} end # unattached oriented

abstract type TimePeriods{T,Z} <: AbstractTimePeriod{T} end # Z relative, mean solar seconds
abstract type TimeSpans{T,Z}   <: AbstractTimeSpan{T}   end # Z relative, 86400 SI seconds

=#
