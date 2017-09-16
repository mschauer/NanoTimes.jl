import Base: (+), (-)

function (-)(x::NanoTime{I}, y::NanoTime{I}) where I<:IntTimes
    nanos = nanoseconds(x) - nanoseconds(y)
    return NanoSpan(nanos)
end

(-)(x::NanoTime{I1}, y::NanoTime{I2}) where {I1<:IntTimes, I2<:IntTimes} = (-)(promote(x, y)...)

for P in (:Nanosecond, :Microsecond, :Millisecond, :Second, :Minute, :Hour, :Day, :Week)
    @eval begin
        (+)(x::NanoTime{I}, p::$P) where I<:IntTimes = NanoTime{I}(nanosecs(x) + nanosecs(p))
        (+)(p::$P, x::NanoTime{I}) where I<:IntTimes = NanoTime{I}(nanosecs(x) + nanosecs(p))
        (-)(x::NanoTime{I}, p::$P) where I<:IntTimes = NanoTime{I}(nanosecs(x) - nanosecs(p))
    end
end
