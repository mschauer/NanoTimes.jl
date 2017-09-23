function Base.string(x::Span{T}) where T

    isneg = signbit(nanoseconds(x))
    y = Span(abs(nanoseconds(x)))

    nanosecs = nanosecond(y)
    microsecs = microsecond(y)
    millisecs = millisecond(y)
    scs = second(y)
    mns = minute(y)
    hrs = hour(y)
    dys = day(y)

    nanos  = nanosecs  === zero(T) ? "" : threedigits(nanosecs)
    micros = microsecs === zero(T) ? "" : threedigits(microsecs)
    millis = millisecs === zero(T) ? "" : threedigits(millisecs)
    subsecs = string(millis, micros, nanos)

    subgranular = length(subsecs) > 0
    if scs === zero(T)
        secs = subgranular ? string("00.", subsecs) : ""
    else
        secs = subgranular ? string(twodigits(scs), DEC_PT, subsecs) : twodigits(scs)
    end

    subgranular = length(secs) > 0
    if mns === zero(T)
        mins = subgranular ? string("00", HMS_SEP, secs) : ""
    else
        mins = subgranular ? string(twodigits(mns), HMS_SEP, secs) : twodigits(mns)
    end

    subgranular = length(mins) > 0
    if hrs === zero(T)
        hours = subgranular ? string("00", HMS_SEP, mins) : ""
    else
        hours = subgranular ? string(twodigits(hrs), HMS_SEP, mins) : twodigits(hrs)
    end

    subgranular = length(hours) > 0
    if dys === zero(T)
        days = subgranular ? hours : ""
    else
        days = subgranular ? string(dys, DYHR_SEP, hours) : string(dys, DYHR_SEP)
    end

    subgranular = length(days) > 0
    if subgranular
        result = string( (isneg ? NEGATIVE : POSITIVE), days )
    else
        result = string(POSITIVE, "0", SCSS_SEP)
    end

    return result
end

# settable subsecond precision

function Base.string(x::Span{T}, subsec_digits::Int) where T
    if signbit(subsec_digits) || subsec_digits > 9
        throw(ErrorException("Subseconds use 0..9 digits, not $(subsec_digits)"))
    end
    tmstr = string(x)
    if !contains(tmstr, '.') && subsec_digits>0
        tmstr = string(tmstr, '.', ZEROCHARS[subsec_digits+1])
    else
        tmstrs = split(tmstr, '.')
        tmstrs[2] = string(tmstrs[2], ZEROCHARS[subsec_digits+1-length(tmstrs[2])])
        tmstr = join(tmstrs)
    end
    return tmstr
end    
