@inline nanoseconds(x::Day)  = Base.Dates.value(x) * NANOSECONDS_PER_DAY
@inline nanoseconds(x::Hour) = Base.Dates.value(x) * NANOSECONDS_PER_HOUR
@inline nanoseconds(x::Minute) = Base.Dates.value(x) * NANOSECONDS_PER_MINUTE
@inline nanoseconds(x::Second) = Base.Dates.value(x) * NANOSECONDS_PER_SECOND
@inline nanoseconds(x::Millisecond) = Base.Dates.value(x) * NANOSECONDS_PER_MILLISECOND
@inline nanoseconds(x::Microsecond) = Base.Dates.value(x) * NANOSECONDS_PER_MICROSECOND
@inline nanoseconds(x::Nanosecond)  = Base.Dates.value(x)

for P in (:Day, :Hour, :Minute, :Second, :Millisecond, :Microsecond, :Nanosecond)
    @eval Nanoseconds(x::$P) = Nanoseconds(nanoseconds(x))
end
