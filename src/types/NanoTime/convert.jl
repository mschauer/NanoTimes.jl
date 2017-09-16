function Clock(dt::Date)
    rata = date2rata(dt)
    rataguard(rata)
    nanosec = (rata - RATAFIRST) * NANOSECONDS_PER_DAY
    return Clock(nanosec)
end

function Date(x::Clock)
    dat = RATAFIRST + fld(nanoseconds(x), NANOSECONDS_PER_DAY)
    return rata2date(dat)
end

function Time(x::Clock)
    return Time(Nanosecond(value(x)))
end

function Clock(dtm::DateTime)
    dat = Date(dtm)
    tim = Time(dtm)
    return Clock(dat, tim)
end

function DateTime(x::Clock)
    dat, tim = fldmod(nanoseconds(x), NANOSECONDS_PER_DAY)
    dat = rata2date(dat + RATAFIRST)
    tim = Time(Nanosecond(tim))
    return dat+tim
end

function Clock(dat::Date, tim::Time)
    rata = date2rata(dat)
    rataguard(rata)
    nanosec = (rata - RATAFIRST) * NANOSECONDS_PER_DAY
    nanosec += tim.instant.value
    return Clock(nanosec)
end

function Clock(x::Time)
    error("use Span(x::Time), not Clock(x::Time)")
end
