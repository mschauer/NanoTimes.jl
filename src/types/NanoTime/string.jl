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
    mins = div(lcl2ut.value, SECONDS_PER_MINUTE)
    offset = signedhm(mins)
    return string(dt, "T", tm, offset)
end
