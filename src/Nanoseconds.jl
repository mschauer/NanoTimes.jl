module Nanoseconds

export NanoTime, NanoSpan

using Base.Dates
import Base.Dates: datetime2rata, rata2datetime,
    datetime2unix, unix2datetime,
    date2epochdays, epochdays2date,
    Period, CompoundPeriod

const IntTime = Int64

include("support/granular_consts.jl")
include("support/rata_conversion.jl")

include("types/Abstract.jl")

include("types/NanoTime/NanoTime.jl")
include("types/NanoTime/convert.jl")

include("types/NanoSpan/NanoSpan.jl")
include("types/NanoSpan/convert.jl")

end # module
