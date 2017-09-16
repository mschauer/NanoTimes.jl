module Nanosecs

export NanoTime, NanoSpan,
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

include("support/chars.jl")
include("support/granular_consts.jl")
include("support/rata_conversion.jl")

include("types/Abstract.jl")

include("types/NanoTime/NanoTime.jl")
include("types/NanoTime/convert.jl")
include("types/NanoTime/parts.jl")
include("types/NanoTime/string.jl")
include("types/NanoTime/io.jl")
include("types/NanoTime/arith.jl")

include("types/NanoSpan/NanoSpan.jl")
include("types/NanoSpan/convert.jl")
include("types/NanoSpan/parts.jl")
include("types/NanoSpan/string.jl")
include("types/NanoSpan/io.jl")
include("types/NanoSpan/arith.jl")

end # module
