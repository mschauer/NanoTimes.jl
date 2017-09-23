struct Span{T} <: AbstractSpan{T}
    value::T

    function Span{T}(value::T) where T<:IntTimes
        return new{T}(value)
    end
end

@inline Span(value::T) where T<:IntTimes = Span{T}(value)

function Span(value::T) where T
    try
         return convert(Span, value)
     catch e
         throw(e)
     end
end
