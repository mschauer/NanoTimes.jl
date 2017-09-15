function NanoSpan(x::Time)
    return NanoSpan(x.instant.value)
end

function NanoSpan(x::CompoundPeriod)
    nanosecs = sum(map(a->Nanosecond(a), x.periods))
    return NanoSpan(nanosecs.value)
end

NanoSpan(x::Week) = NanoSpan(nanoseconds(x) * NANOSECONDS_PER_WEEK)
NanoSpan(x::Day)  = NanoSpan(nanoseconds(x) * NANOSECONDS_PER_DAY)
NanoSpan(x::Hour) = NanoSpan(nanoseconds(x) * NANOSECONDS_PER_HOUR)
NanoSpan(x::Minute) = NanoSpan(nanoseconds(x) * NANOSECONDS_PER_MINUTE)
NanoSpan(x::Second) = NanoSpan(nanoseconds(x) * NANOSECONDS_PER_SECOND)
NanoSpan(x::Millisecond) = NanoSpan(nanoseconds(x) * NANOSECONDS_PER_MILLISEC)
NanoSpan(x::Microsecond) = NanoSpan(nanoseconds(x) * NANOSECONDS_PER_MICROSEC)
NanoSpan(x::Nanosecond)  = NanoSpan(nanoseconds(x))

function NanoSpan(; days::Int64=0,
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
    return NanoSpan(dnanosec)
end

function NanoSpan(x::DateTime)
    error("use NanoTime(x::DateTime), not NanoSpan(x::DateTime)")
end
