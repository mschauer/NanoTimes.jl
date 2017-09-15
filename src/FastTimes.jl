module FastTimes

export FastTime, FastSpan

using Base.Dates
import Base.Dates: datetime2rata, rata2datetime,
    datetime2unix, unix2datetime,
    date2epochdays, epochdays2date

const IntTime = Int64

include "support/granular_consts.jl"
include "support/rata_conversion.jl"

end # module
