import Base: (+), (-)

(+)(x::Clock{I}, y::Span{I}) where I<:IntTimes = Clock{I}(nanoseconds(x) + nanoseconds(y))
(+)(x::Span{I}, y::Clock{I}) where I<:IntTimes = Clock{I}(nanoseconds(x) + nanoseconds(y))
(+)(x::Clock{I1}, y::Span{I2}) where {I1<:IntTimes, I2<:IntTimes} = (+)(promote(x, y)...)
(+)(x::Span{I1}, y::Clock{I2}) where {I1<:IntTimes, I2<:IntTimes} = (+)(promote(x, y)...)

(-)(x::Clock{I}, y::Span{I}) where I<:IntTimes = Clock{I}(nanoseconds(x) - nanoseconds(y))
(-)(x::Clock{I1}, y::Span{I2}) where {I1<:IntTimes, I2<:IntTimes} = (-)(promote(x, y)...)

(-)(x::Span{I}, y::Clock{I}) where I<:IntTimes =
    throw(ErrorException("Span-Clock is invalid;  write Clock-Span."))
(-)(x::Span{I1}, y::Clock{I2}) where {I1<:IntTimes, I2<:IntTimes} =
    throw(ErrorException("Span-Clock is invalid;  write Clock-Span."))


(-)(x::Clock{I}, y::DateTime) where I<:IntTimes = Span{I}(x - Clock{I}(y))
(-)(x::DateTime, y::Clock{I}) where I<:IntTimes = Span{I}(Clock{I}(x) - y)
(-)(x::Clock{I}, y::Date) where I<:IntTimes = Span{I}(x - Clock{I}(y))
(-)(x::Date, y::Clock{I}) where I<:IntTimes = Span{I}(Clock{I}(x) - y)
(-)(x::Clock{I}, y::Time24) where I<:IntTimes = x - Span{I}(y)

(-)(x::DateTime, y::Span{I}) where I<:IntTimes = Clock{I}(x) - y
(-)(x::Date, y::Span{I}) where I<:IntTimes = Clock{I}(x) - y
(-)(x::Span{I}, y::Time24) where I<:IntTimes = x - Span{I}(y)

(+)(x::DateTime, y::Span{I}) where I<:IntTimes = Clock{I}(x) + y
(+)(x::Date, y::Span{I}) where I<:IntTimes = Clock{I}(x) + y
(+)(x::Time24, y::Span{I}) where I<:IntTimes = Span{I}(x) + y

(+)(x::Span{I}, y::DateTime) where I<:IntTimes = Clock{I}(y) + x
(+)(x::Span{I}, y::Date) where I<:IntTimes = Clock{I}(y) + x
(+)(x::Span{I}, y::Time24) where I<:IntTimes = x + Span{I}(y)


(+)(x::Span{I}, y::Clock{I}) where I<:IntTimes = Clock{I}(nanoseconds(x) + nanoseconds(y))
(-)(x::Span{I}, y::Clock{I}) where I<:IntTimes =
    throw(ErrorException("Span-Clock is invalid;  write Clock-Span."))
