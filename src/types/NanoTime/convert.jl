function NanoTime(dt::Date)
    rata = date2rata(dt)
    rataguard(rata)
    nanosec = (rata - RATAFIRST) * NANOSECONDS_PER_DAY
    return NanoTime(nanosec)
end

function Date(x::NanoTime)
    dat = RATAFIRST + fld(nanoseconds(x), NANOSECONDS_PER_DAY)
    return rata2date(dat)
end

function Time(x::NanoTime)
    return Time(Nanosecond(value(x)))
end

function NanoTime(dtm::DateTime)
    dat = Date(dtm)
    tim = Time(dtm)
    return NanoTime(dat, tim)
end

function DateTime(x::NanoTime)
    dat, tim = fldmod(nanoseconds(x), NANOSECONDS_PER_DAY)
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

function NanoTime(x::Time)
    error("use NanoSpan(x::Time), not NanoTime(x::Time)")
end
