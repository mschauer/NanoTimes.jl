function Clock{I}(dt::Date) where I<:IntTimes
    rata = date2rata(dt)
    rataguard(rata)
    nanosec = I( (rata - RATAFIRST) * NANOSECONDS_PER_DAY )
    return Clock(nanosec)
end

@inline Clock(dt::Date) = Clock{Int64}(dt)

function Clock{I}(dtm::DateTime) where I<:IntTimes
    dat = Date(dtm)
    tim = Base.Dates.Time(dtm)
    return Clock{I}(dat, tim)
end

@inline Clock(dtm::DateTime) = Clock{Int64}(dtm)

function Clock{I}(dat::Date, tim::Base.Dates.Time) where I<:IntTimes
    rata = date2rata(dat)
    rataguard(rata)
    nanosec = (rata - RATAFIRST) * NANOSECONDS_PER_DAY
    nanosec += tim.instant.value
    return Clock(I(nanosec))
end

@inline Clock(dat::Date, tim::Base.Dates.Time) = Clock{Int64}(dat, tim)

Clock(str::String) = parse(Clock, str)

function Clock(; years::I=year(now()), months::I=1, days::I=0,
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
    return Span(dnanosec)
end

function Clock{I}(x::Base.Dates.Time) where I<:IntTimes
    error("use Span(x::Base.Dates.Time), not Clock(x::Base.Dates.Time)")
end

function Date(x::Clock{I}) where I<:IntTimes
    nanos = round(Int64, fld(nanoseconds(x), NANOSECONDS_PER_DAY))
    dat = RATAFIRST + nanos
    return rata2date(dat)
end

function Base.Dates.Time(x::Clock{I}) where I<:IntTimes
    nanos = round(Int64, nanoseconds(x))
    return Base.Dates.Time(Nanosecond(nanos))
end

function DateTime(x::Clock{I}) where I<:IntTimes
    nanos = round(Int64, nanoseconds(x))
    dat, tim = fldmod(nanos, NANOSECONDS_PER_DAY)
    dat = rata2date(dat + RATAFIRST)
    tim = Base.Dates.Time(Nanosecond(tim))
    return dat+tim
end
