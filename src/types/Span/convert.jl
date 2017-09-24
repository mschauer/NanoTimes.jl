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

function Span(day::I=zero(I),
              hour::I=zero(I), minute::I=zero(I), second::I=zero(I),
              millisecond::I=zero(I), microsecond::I=zero(I), 
              nanosecond::I=zero(I)) where I<:IntSpans
    dnanosec = promote_type(Int64, I)(nanosecond)
    dnanosec += microsecond * NANOSECONDS_PER_MICROSECOND
    dnanosec += millisecond * NANOSECONDS_PER_MILLISECOND
    dnanosec += second * NANOSECONDS_PER_SECOND
    dnanosec += minute * NANOSECONDS_PER_MINUTE
    dnanosec += hour * NANOSECONDS_PER_HOUR
    dnanosec += day * NANOSECONDS_PER_DAY
    dnanosec += week * NANOSECONDS_PER_WEEK
    return Span(dnanosec)
end

Span(str::String) = parse(Span, str)

function Span(x::DateTime)
    error("use Clock(x::DateTime), not Span(x::DateTime)")
end
