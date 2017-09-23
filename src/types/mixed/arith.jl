import Base: (+), (-)

(+)(x::Clock{I}, y::Span{I}) where I<:IntTimes = Clock(value(x) + value(y))
(+)(x::Span{I}, y::Clock{I}) where I<:IntTimes = Clock(value(x) + value(y))
(+)(x::Clock{I1}, y::Span{I2}) where {I1<:IntTimes, I2<:IntTimes} = (+)(promote(x, y)...)
(+)(x::Span{I1}, y::Clock{I2}) where {I1<:IntTimes, I2<:IntTimes} = (+)(promote(x, y)...)

(-)(x::Clock{I}, y::Span{I}) where I<:IntTimes = Clock(value(x) - value(y))
(-)(x::Clock{I1}, y::Span{I2}) where {I1<:IntTimes, I2<:IntTimes} = (-)(promote(x, y)...)
(-)(x::Span{I}, y::Time) where I<:IntTimes = (-)(x, Span(y))
