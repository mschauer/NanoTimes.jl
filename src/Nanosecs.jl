__precompile__()

module Nanosecs

export Clock, Span,
    Date, Time, DateTime,
    Year, Month, Week, Day, Hour, Minute, Second,
    Millisecond, Microsecond, Nanosecond,
    year, month, week, day, hours, minute, second,
    millisecond, microsecond, nanosecond,
    Weeks, Days, Hours, Minutes, Seconds,
    Milliseconds, Microseconds, Nanoseconds,
    weeks, days, hours, minutes, seconds,
    milliseconds, microseconds, nanoseconds

using Base.Dates
import Base.Dates: Date, Time, DateTime,
    datetime2rata, rata2datetime,
    datetime2unix, unix2datetime,
    date2epochdays, epochdays2date,
    Period, CompoundPeriod,
    Year, Month, Week, Day, Hour, Minute, Second,
    Millisecond, Microsecond, Nanosecond,
    year, month, week, day, hour, minute, second,
    millisecond, microsecond, nanosecond

const IntTimes = Union{Int64, Int128}
const IntTime  = Int64                   # one of IntTimes

include("types/Abstract.jl")
include("types/Clock/Clock.jl")
include("types/Span/Span.jl")

include("support/chars.jl")
include("support/granular_consts.jl")
include("support/rata_conversion.jl")

include("types/Clock/convert.jl")
include("types/Clock/parts.jl")
include("types/Clock/string.jl")
include("types/Clock/io.jl")
include("types/Clock/arith.jl")

include("types/Span/convert.jl")
include("types/Span/parts.jl")
include("types/Span/string.jl")
include("types/Span/io.jl")
include("types/Span/arith.jl")

include("types/mixed/time_and_span.jl")

end # module
