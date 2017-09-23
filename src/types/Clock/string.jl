function Base.string(x::Clock{T}) where T
    dt = Date(x)
    tm = Base.Dates.Time(x)
    return string(dt, "T", tm)
end

function Base.string(x::Clock{T}, suffix::Char) where T
    dt = Date(x)
    tm = Base.Dates.Time(x)
    return string(dt, "T", tm, suffix)
end

function Base.string(x::Clock{T}, lcl2ut::Second) where T
    dt = Date(x)
    tm = Base.Dates.Time(x)
    mins = div(lcl2ut.value, SECONDS_PER_MINUTE)
    offset = signed_hoursmins(mins)
    return string(dt, "T", tm, offset)
end

# settable subsecond precision

const zerochars = ["", "0", "00", "000", "0000", "00000", "000000", "0000000", "00000000", "000000000"]

function Base.string(x::Clock{T}, subsec_digits::Int) where T
    if signbit(subsec_digits) || subsec_digits > 9
        throw(ErrorException("Subseconds use 0..9 digits, not $(subsec_digits)"))
    end
    dt = Date(x)
    tm = Time24(x)
    tmstr = string(tm)
    if !contains(tmstr, '.') && subsec_digits>0
        tmstr = string(tmstr, '.', zerochars[subsec_digits+1])
    else
        tmstrs = split(tmstr, '.')
        tmstrs[2] = string(tmstrs[2], zerochars[subsec_digits+1-length(tmstrs[2])])
        tmstr = join(tmstrs)
    end
    return string(dt, 'T', tmstr)
 end    

function Base.string(x::Clock{T}, suffix::Char, subsec_digits::Int) where T
    result = string(string(x, subsec_digits), suffix)
    return result
end
    
function Base.string(x::Clock{T}, lcl2ut::Second, subsec_digits::Int) where T
    mins = div(lcl2ut.value, SECONDS_PER_MINUTE)
    offset = signed_hoursmins(mins)
    result = string(string(x, subsec_digits), offset)   
    return result
end
