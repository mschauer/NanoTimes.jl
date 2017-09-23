import Base: (+), (-)

function (+)(x::Span{I}, y::Span{I}) where I<:IntTimes
    nanos = nanoseconds(x) + nanoseconds(y)
    return Span{I}(nanos)
end

function (-)(x::Span{I}, y::Span{I}) where I<:IntTimes
    nanos = nanoseconds(x) - nanoseconds(y)
    return Span{I}(nanos)
end

(-)(x::Span{I1}, y::Span{I2}) where {I1<:IntTimes, I2<:IntTimes} = (-)(promote(x, y)...)
(-)(x::Span{I}, y::Time) where I<:IntTimes = (-)(x, Span{I}(y))
(-)(x::DateTime, y::Span{I}) where I<:IntTimes = (-)(Clock{I}(x), y)
(-)(x::Date, y::Span{I}) where I<:IntTimes = (-)(Clock{I{(x), y)


(+)(x::Span{I}, y::Time) where I<:IntTimes = (+)(x, Span{I}(y))
(+)(x::Time, y::Span{I}) where I<:IntTimes = (+)(y, Span{I}(x))

for P in (:Nanosecond, :Microsecond, :Millisecond, :Second, :Minute, :Hour, :Day, :Week)
    @eval begin
        (+)(x::Span{I}, p::$P) where I<:IntTimes = Span{I}(nanosecs(x) + nanosecs(p))
        (+)(p::$P, x::Span{I}) where I<:IntTimes = Span{I}(nanosecs(x) + nanosecs(p))
        (-)(x::Span{I}, p::$P) where I<:IntTimes = Span{I}(nanosecs(x) - nanosecs(p))
        (-)(p::$P, x::Span{I}) where I<:IntTimes = Span{I}(nanosecs(x) - nanosecs(p))
    end
end
