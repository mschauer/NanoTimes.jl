__precompile__()

module NanoTimes

 # this module exports its own Time (aka Clock), use Time24 for the other
export Time, Span,
    Date, DateTime, Time24,
    Year, Month, Week, Day, Hour, Minute, Second,
    Millisecond, Microsecond, Nanosecond,
    year, month, week, day, hour, minute, second,
    millisecond, microsecond, nanosecond,
    Weeks, Days, Hours, Minutes, Seconds,
    Milliseconds, Microseconds, Nanoseconds,
    weeks, days, hours, minutes, seconds,
    milliseconds, microseconds, nanoseconds,
    YEAR_MO_DY, YEAR_MO_DY_HR_MI_SC, YEAR_MO_DY_HR_MI_SCFS,
    DY_HR_MI_SC, DY_HR_MI_SCFS, HR_MI_SC, HR_MI_SCFS,
    YEARMODY, YEARMODY_HRMISC, YEARMODY_HRMISCFS,
    YRMODY, YRMODY_HRMISC, YRMODY_HRMISCFS,
    DY_HRMISC, DY_HRMISCFS, HRMISC, HRMISCFS

#using Base.Dates
import Base.Dates:Date, DateTime,
    datetime2rata, rata2datetime,
    datetime2unix, unix2datetime,
    date2epochdays, epochdays2date,
    Period, CompoundPeriod,
    Year, Month, Week, Day, Hour, Minute, Second,
    Millisecond, Microsecond, Nanosecond,
    year, month, week, day, hour, minute, second,
    millisecond, microsecond, nanosecond

const IntSpans = Union{Int32, Int64, Int128}
const IntTimes = Union{Int64, Int128}
const IntTime  = Int64                   # one of IntTimes

include("types/Abstract.jl")
include("types/Clock/Clock.jl")
include("types/Span/Span.jl")
include("types/hash.jl")

const Time = Clock
const Time24 = Base.Dates.Time

include("support/chars.jl")
include("support/granular_consts.jl")
include("support/rata_conversion.jl")
include("support/string_to_smallint.jl")

include("types/Clock/convert.jl")
include("types/Clock/parts.jl")
include("types/Clock/string.jl")
include("types/Clock/io.jl")
include("types/Clock/arith.jl")
include("types/Clock/parse.jl")

include("types/Span/convert.jl")
include("types/Span/parts.jl")
include("types/Span/string.jl")
include("types/Span/io.jl")
include("types/Span/arith.jl")
include("types/Span/parse.jl")

include("types/mixed/Clock_Span.jl")
include("types/mixed/arith.jl")
include("types/mixed/periods.jl")
include("types/mixed/parse.jl")

const YEAR_MO_DY = :YEAR_MO_DY
const YEAR_MO_DY_HR_MI_SC = :YEAR_MO_DY_HR_MI_SC
const YEAR_MO_DY_HR_MI_SCFS = :YEAR_MO_DY_HR_MI_SCFS
const DY_HR_MI_SC = :DY_HR_MI_SC
const DY_HR_MI_SCFS = :DY_HR_MI_SCFS
const HR_MI_SC = :HR_MI_SC
const HR_MI_SCFS = :HR_MI_SCFS

const YEARMODY = :YEARMODY
const YEARMODY_HRMISCFS = :YEARMODY_HRMISCFS
const YRMODY_HRMISC = :YRMODY_HRMISC
const YRMODY_HRMISCFS = :YRMODY_HRMISCFS 
const DY_HRMISC = :DY_HRMISC
const DY_HRMISCFS = :DY_HRMISCFS
const HRMISC = :HRMISC
const HRMISCFS = :HRMISCFS

end # module
