Base.sum(x::CompoundPeriod) = sum(typeof(x.periods[end]).(x.periods))

@inline nanosecs(x::NanoType{I}) where I<:IntTimes = nanoseconds(x)
@inline nanosecs(x::Span{I}) where I<:IntTimes = nanoseconds(x)
@inline nanosecs(x::P) where P<:Period = nanosecond(Nanosecond(x))
@inline nanosecs(x::P) where P<:CompoundPeriod = nanosecs(sum(x))
