function Span{I}(x::Time) where I<:IntTimes
    return Span(I(x.instant.value))
end

function Span{I}(x::CompoundPeriod) where I<:IntTimes
    nanosecs = I(sum(map(a->Nanosecond(a), x.periods)))
    return Span(nanosecs.value)
end

Span(x::Day)  = Span(x.value * NANOSECONDS_PER_DAY)
Span(x::Hour) = Span(x.value * NANOSECONDS_PER_HOUR)
Span(x::Minute) = Span(x.value * NANOSECONDS_PER_MINUTE)
Span(x::Second) = Span(x.value * NANOSECONDS_PER_SECOND)
Span(x::Millisecond) = Span(x.value * NANOSECONDS_PER_MILLISEC)
Span(x::Microsecond) = Span(x.value * NANOSECONDS_PER_MICROSEC)
Span(x::Nanosecond)  = Span(x.value)

function Span(; days::Int64=0,
                    hours::Int64=0,
                    minutes::Int64=0,
                    seconds::Int64=0,
                    milliseconds::Int64=0,
                    microseconds::Int64=0,
                    nanoseconds::Int64=0)
    dnanosec = nanoseconds
    dnanosec += microseconds * NANOSECONDS_PER_MICROSECOND
    dnanosec += milliseconds * NANOSECONDS_PER_MILLISECOND
    dnanosec += seconds * NANOSECONDS_PER_SECOND
    dnanosec += minutes * NANOSECONDS_PER_MINUTE
    dnanosec += hours * NANOSECONDS_PER_HOUR
    dnanosec += days * NANOSECONDS_PER_DAY
    return Span(dnanosec)
end

function Span(x::DateTime)
    error("use Clock(x::DateTime), not Span(x::DateTime)")
end
