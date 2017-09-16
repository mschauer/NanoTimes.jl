import Base: (+), (-)

function (-)(x::NanoSpan{I}, y::NanoSpan{I}) where I<:IntTimes
    nanos = nanoseconds(x) - nanoseconds(y)
    return NanoSpan(nanos)
end

(-)(x::NanoSpan{I1}, y::NanoSpan{I2}) where {I1<:IntTimes, I2<:IntTimes} = (-)(promote(x, y)...)

for P in (:Nanosecond, :Microsecond, :Millisecond, :Second, :Minute, :Hour, :Day, :Week)
    @eval begin
        (+)(x::NanoSpan{I}, p::$P) where I<:IntTimes = NanoSpan{I}(nanosecs(x) + nanosecs(p))
        (+)(p::$P, x::NanoSpan{I}) where I<:IntTimes = NanoSpan{I}(nanosecs(x) + nanosecs(p))
        (-)(x::NanoSpan{I}, p::$P) where I<:IntTimes = NanoSpan{I}(nanosecs(x) - nanosecs(p))
        (-)(p::$P, x::NanoSpan{I}) where I<:IntTimes = NanoSpan{I}(nanosecs(x) - nanosecs(p))
    end
end
