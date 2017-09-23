function Clock{I}(dt::Date) where I<:IntTimes
    rata = date2rata(dt)
    rataguard(rata)
    nanosec = I( (rata - RATAFIRST) * NANOSECONDS_PER_DAY )
    return Clock(nanosec)
end

function Clock{I}(dtm::DateTime) where I<:IntTimes
    dat = Date(dtm)
    tim = Time(dtm)
    return Clock{I}(dat, tim)
end

function Clock{I}(dat::Date, tim::Time) where I<:IntTimes
    rata = date2rata(dat)
    rataguard(rata)
    nanosec = (rata - RATAFIRST) * NANOSECONDS_PER_DAY
    nanosec += tim.instant.value
    return Clock(I(nanosec))
end

function Clock{I}(x::Time) where I<:IntTimes
    error("use Span(x::Time), not Clock(x::Time)")
end

function Date(x::Clock{I}) where I<:IntTimes
    nanos = round(Int64, fld(nanoseconds(x), NANOSECONDS_PER_DAY))
    dat = RATAFIRST + nanos
    return rata2date(dat)
end

function Time(x::Clock{I}) where I<:IntTimes
    nanos = round(Int64, nanoseconds(x))
    return Time(Nanosecond(nanos))
end

function DateTime(x::Clock)
    nanos = round(Int64, nanoseconds(x))
    dat, tim = fldmod(nanos, NANOSECONDS_PER_DAY)
    dat = rata2date(dat + RATAFIRST)
    tim = Time(Nanosecond(tim))
    return dat+tim
end
