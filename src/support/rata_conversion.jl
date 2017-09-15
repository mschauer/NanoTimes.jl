@inline function date2rata(caldate::Date)
    return date2epochdays(caldate) - 365
end

@inline function rata2date(rata::Int64)
    return epochdays2date(rata + 365)
end

# supported span of dates
const EPOCH1950 = Date("1950-01-01")
const EPOCH2200 = Date("2200-01-01")
const RATAFIRST = date2rata(EPOCH1950)
const RATAFINAL = date2rata(EPOCH2200)

@inline function rataguard(rata::Int64)
    (RATAFIRST <= rata <= RATAFINAL) && return nothing
    throw(ErrorException("date must be in $(EPOCH1950)..$(EPOCH2200)."))
end
