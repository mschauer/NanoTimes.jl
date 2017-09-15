function NanoTime(dt::Date)
    rata = date2rata(dt)
    rataguard(rata)
    nanosec = (rata - RATAFIRST) * NANOSECONDS_PER_DAY
    return NanoTime(nanosec)
end

function Date(x::NanoTime)
    dat = RATAFIRST + fld(x.nanosec, NANOSECONDS_PER_DAY)
    return rata2date(dat)
end

function NanoTime(dtm::DateTime)
    dat = Date(dtm)
    tim = Time(dtm)
    return NanoTime(dat, tim)
end

function DateTime(x::NanoTime)
    dat, tim = fldmod(x.nanosec, NANOSECONDS_PER_DAY)
    dat = rata2date(dat + RATAFIRST)
    tim = Time(Nanosecond(tim))
    return dat+tim
end

function NanoTime(dat::Date, tim::Time)
    rata = date2rata(dat)
    rataguard(rata)
    nanosec = (rata - RATAFIRST) * NANOSECONDS_PER_DAY
    nanosec += tim.instant.value
    return NanoTime(nanosec)
end

function NanoSpan(x::Time)
    return NanoSpan(x.instant.value)
end

function NanoSpan(x::CompoundPeriod)
    nanosecs = sum(map(a->Nanosecond(a), x.periods))
    return NanoSpan(nanosecs.value)
end

NanoSpan(x::Week) = NanoSpan(x.value * NANOSECONDS_PER_WEEK)
NanoSpan(x::Day)  = NanoSpan(x.value * NANOSECONDS_PER_DAY)
NanoSpan(x::Hour) = NanoSpan(x.value * NANOSECONDS_PER_HOUR)
NanoSpan(x::Minute) = NanoSpan(x.value * NANOSECONDS_PER_MINUTE)
NanoSpan(x::Second) = NanoSpan(x.value * NANOSECONDS_PER_SECOND)
NanoSpan(x::Millisecond) = NanoSpan(x.value * NANOSECONDS_PER_MILLISEC)
NanoSpan(x::Microsecond) = NanoSpan(x.value * NANOSECONDS_PER_MICROSEC)
NanoSpan(x::Nanosecond)  = NanoSpan(x.value)

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
    return return NanoSpan(nanosec)
end

function NanoTime(x::Time)
    error("use NanoSpan(x::Time), not NanoTime(x::Time)")
end

function NanoSpan(x::DateTime)
    error("use NanoTime(x::DateTime), not NanoSpan(x::DateTime)")
end
