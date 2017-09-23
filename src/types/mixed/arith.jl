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
