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

Base.Dates.year(x::Base.Dates.Year) = x.value
Base.Dates.month(x::Base.Dates.Month) = x.value
Base.Dates.week(x::Base.Dates.Week) = x.value
Base.Dates.day(x::Base.Dates.Day) = x.value
Base.Dates.hour(x::Base.Dates.Hour) = x.value
Base.Dates.minute(x::Base.Dates.Minute) = x.value
Base.Dates.second(x::Base.Dates.Second) = x.value
Base.Dates.millisecond(x::Base.Dates.Millisecond) = x.value
Base.Dates.microsecond(x::Base.Dates.Microsecond) = x.value
Base.Dates.nanosecond(x::Base.Dates.Nanosecond) = x.value
