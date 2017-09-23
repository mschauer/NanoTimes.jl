import Base: (+), (-)

function (-)(x::Clock{I}, y::Clock{I}) where I<:IntTimes
    nanos = nanoseconds(x) - nanoseconds(y)
    return Span{I}(nanos)
end

(-)(x::Clock{I1}, y::Clock{I2}) where {I1<:IntTimes, I2<:IntTimes} = (-)(promote(x, y)...)

for P in (:Nanosecond, :Microsecond, :Millisecond, :Second, :Minute, :Hour, :Day, :Week)
    @eval begin
        (+)(x::Clock{I}, p::$P) where I<:IntTimes = Clock{I}(nanoseconds(x) + nanoseconds(p))
        (+)(p::$P, x::Clock{I}) where I<:IntTimes = Clock{I}(nanoseconds(x) + nanoseconds(p))
        (-)(x::Clock{I}, p::$P) where I<:IntTimes = Clock{I}(nanoseconds(x) - nanoseconds(p))
    end
end
