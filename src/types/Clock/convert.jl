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

function Clock(; year::I=I(year(now())), month::I=one(I),
                 week::I=zero(I), day::I=one(I),
                 hour::I=zero(I), minute::I=zero(I), second::I=zero(I),
                 millisecond::I=zero(I), microsecond::I=zero(I), 
                 nanosecond::I=zero(I)) where I<:IntSpans
    dnanosec = promote_type(Int64, I)(nanosecond)
    dnanosec += microsecond * NANOSECONDS_PER_MICROSECOND
    dnanosec += millisecond * NANOSECONDS_PER_MILLISECOND
    dnanosec += second * NANOSECONDS_PER_SECOND
    dnanosec += minute * NANOSECONDS_PER_MINUTE
    dnanosec += hour * NANOSECONDS_PER_HOUR
    dnanosec += week * NANOSECONDS_PER_WEEK
    return Clock(Date(year, month, day)) + Span(dnanosec)
end

function Clock(year::Year=Year(now()), month::Month=Month(1),
                 day::Day=Day(1),
                 hour::Hour=Hour(0), minute::Minute=Minute(0),
                 second::Second=Second(0),
                 millisecond::Millisecond=Millisecond(0),
                 microsecond::Microsecond=Microsecond(0), 
                 nanosecond::Nanosecond=Nanosecond(0))
    return Clock(year=year(year), month=month(month),
                 week=week(week), day=day(day),
                 hour=hour(hour), minute=minute(minute),
                 second=second(second),
                 millisecond=millisecond(millisecond),
                 microsecond=microsecond(microsecond),
                 nanosecond=nanosecond(nanosecond))
end
=#
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
