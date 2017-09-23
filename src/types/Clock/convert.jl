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
    return Time(Nanosecond(nanos))
end

function DateTime(x::Clock{I}) where I<:IntTimes
    nanos = round(Int64, nanoseconds(x))
    dat, tim = fldmod(nanos, NANOSECONDS_PER_DAY)
    dat = rata2date(dat + RATAFIRST)
    tim = Time(Nanosecond(tim))
    return dat+tim
end
