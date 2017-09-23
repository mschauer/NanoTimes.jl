function Span{I}(x::Base.Dates.Time) where I<:IntTimes
    return Span(I(x.instant.value))
end

@inline Span(x::Base.Dates.Time) = Span{Int64}(x)

function Span{I}(x::CompoundPeriod) where I<:IntTimes
    nanosecs = I(sum(map(a->Nanosecond(a), x.periods)))
    return Span(nanosecs.value)
end

@inline Span(x::CompoundPeriod) = Span{Int64}(x)

Span(x::Day)  = Span{Int64}(x.value * NANOSECONDS_PER_DAY)
Span(x::Hour) = Span{Int64}(x.value * NANOSECONDS_PER_HOUR)
Span(x::Minute) = Span{Int64}(x.value * NANOSECONDS_PER_MINUTE)
Span(x::Second) = Span{Int64}(x.value * NANOSECONDS_PER_SECOND)
Span(x::Millisecond) = Span{Int64}(x.value * NANOSECONDS_PER_MILLISECOND)
Span(x::Microsecond) = Span{Int64}(x.value * NANOSECONDS_PER_MICROSECOND)
Span(x::Nanosecond)  = Span{Int64}(x.value)



function Span(; weeks::I=0, days::I=0,
                 hours::I=0, minutes::I=0, seconds::I=0,
                 milliseconds::I=0, microseconds::I=0, 
                 nanoseconds::I=0) where I<:IntSpans
    dnanosec = promote_type(Int64, I)(nanoseconds)
    dnanosec += microseconds * NANOSECONDS_PER_MICROSECOND
    dnanosec += milliseconds * NANOSECONDS_PER_MILLISECOND
    dnanosec += seconds * NANOSECONDS_PER_SECOND
    dnanosec += minutes * NANOSECONDS_PER_MINUTE
    dnanosec += hours * NANOSECONDS_PER_HOUR
    dnanosec += days * NANOSECONDS_PER_DAY
    dnanosec += weeks * NANOSECONDS_PER_WEEK
    return Span(dnanosec)
end

Span(str::String) = parse(Span, str)

function Span(x::DateTime)
    error("use Clock(x::DateTime), not Span(x::DateTime)")
end
