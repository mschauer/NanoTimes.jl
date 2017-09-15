const POSITIVE = '+'
const NEGATIVE = '−'
const HMS_SEP  = ':'
const YMD_SEP  = '-'
const DTM_SEP  = 'T'
const UT_SFX   = 'Ƶ'
const UTC_SFX  = 'Z'

function Base.string(x::NanoTime{T}) where T
    dt = Date(x)
    tm = Time(x)
    return string(dt, "T", tm)
end

function Base.string(x::NanoTime{T}, suffix::Char) where T
    dt = Date(x)
    tm = Time(x)
    return string(dt, "T", tm, suffix)
end

function Base.string(x::NanoTime{T}, lcl2ut::Second) where T
    dt = Date(x)
    tm = Time(x)
    mins, secs = divrem(abs(lcl2ut.value), SECONDS_PER_MINUTE)
    hrs, mins  = fldmod(mins, MINUTES_PER_HOUR)
    offset = string( (signbit(lcl2ut) ? NEGATIVE : POSITIVE), hrs, COLON, mns )
    return string(dt, "T", tm, offset)
end
