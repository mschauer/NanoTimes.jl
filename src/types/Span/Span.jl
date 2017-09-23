struct Span{T} <: AbstractSpan
    value::T
end

@inline value(x::Span{T}) where T<:IntTimes = x.value

Span(value::T) where T<:IntTimes = Span{T}(value)

function Span(value<:T) where T
    try
         return convert(Span, value)
     catch e
         throw(e)
     end
end
