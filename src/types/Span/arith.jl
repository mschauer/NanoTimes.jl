import Base: (+), (-), (*), signbit

@inline function signbit(x::Span{I}) where I<:IntTimes
    return signbit(nanoseconds(x))
end

function Base.sign(x::Span{I}) where I<:IntTimes
    return sign(nanoseconds(x))
end

function Base.abs(x::Span{I}) where I<:IntTimes
    nanos = abs(nanoseconds(x))
    return Span{I}(nanos)
end

function Base.abs2(x::Span{I}) where I<:IntTimes
    nanos = abs2(nanoseconds(x))
    return Span{I}(nanos)
end

function (-)(x::Span{I}) where I<:IntTimes
    nanos = -nanoseconds(x)
    return Span{I}(nanos)
end

function (-)(x::Span{I}, y::Span{I}) where I<:IntTimes
    nanos = nanoseconds(x) - nanoseconds(y)
    return Span{I}(nanos)
end

(-)(x::Span{I1}, y::Span{I2}) where {I1<:IntTimes, I2<:IntTimes} = (-)(promote(x, y)...)
(-)(x::Span{I}, y::Base.Dates.Time) where I<:IntTimes = (-)(x, Span{I}(y))
(-)(x::DateTime, y::Span{I}) where I<:IntTimes = (-)(Clock{I}(x), y)
(-)(x::Date, y::Span{I}) where I<:IntTimes = (-)(Clock{I}(x), y)

(+)(x::Span{I}, y::Base.Dates.Time) where I<:IntTimes = (+)(x, Span{I}(y))
(+)(x::Base.Dates.Time, y::Span{I}) where I<:IntTimes = (+)(y, Span{I}(x))

(*)(x::Span{I1}, y::I2) where I1<:IntTimes where I2<:Integer = Span(I1(nanoseconds(x) * y))
(*)(x::I2, y::Span{I1}) where I1<:IntTimes where I2<:Integer = Span(I1(nanoseconds(y) * x))

(Base.div)(x::Span{I}, y::Span{I}) where I<:IntTimes = div(nanoseconds(x), nanoseconds(y))
(Base.fld)(x::Span{I}, y::Span{I}) where I<:IntTimes = fld(nanoseconds(x), nanoseconds(y))
(Base.cld)(x::Span{I}, y::Span{I}) where I<:IntTimes = cld(nanoseconds(x), nanoseconds(y))
(Base.mod)(x::Span{I}, y::Span{I}) where I<:IntTimes = mod(nanoseconds(x), nanoseconds(y))
(Base.rem)(x::Span{I}, y::Span{I}) where I<:IntTimes = rem(nanoseconds(x), nanoseconds(y))
(Base.divrem)(x::Span{I}, y::Span{I}) where I<:IntTimes = div(x,y), rem(x,y)
(Base.fldmod)(x::Span{I}, y::Span{I}) where I<:IntTimes = fld(x,y), mod(x,y)

(Base.div)(x::Span{I1}, y::I2) where I1<:IntTimes where I2<:Integer = Span(I1(div(nanoseconds(x), y)))
(Base.fld)(x::Span{I1}, y::I2) where I1<:IntTimes where I2<:Integer = Span(I1(fld(nanoseconds(x), y)))
(Base.cld)(x::Span{I1}, y::I2) where I1<:IntTimes where I2<:Integer = Span(I1(cld(nanoseconds(x), y)))
(Base.mod)(x::Span{I1}, y::I2) where I1<:IntTimes where I2<:Integer = Span(I1(mod(nanoseconds(x), y)))
(Base.rem)(x::Span{I1}, y::I2) where I1<:IntTimes where I2<:Integer = Span(I1(rem(nanoseconds(x), y)))
(Base.divrem)(x::Span{I1}, y::I2) where I1<:IntTimes where I2<:Integer = div(x,y), rem(x,y)
(Base.fldmod)(x::Span{I1}, y::I2) where I1<:IntTimes where I2<:Integer = fld(x,y), mod(x,y)

for P in (:Nanosecond, :Microsecond, :Millisecond, :Second, :Minute, :Hour, :Day, :Week)
    @eval begin
        (+)(x::Span{I}, p::$P) where I<:IntTimes = Span{I}(nanoseconds(x) + nanoseconds(p))
        (+)(p::$P, x::Span{I}) where I<:IntTimes = Span{I}(nanoseconds(x) + nanoseconds(p))
        (-)(x::Span{I}, p::$P) where I<:IntTimes = Span{I}(nanoseconds(x) - nanoseconds(p))
        (-)(p::$P, x::Span{I}) where I<:IntTimes = Span{I}(nanoseconds(x) - nanoseconds(p))
    end
end
