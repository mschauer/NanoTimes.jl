struct NanoSpan{T} <: AbstractNanoSpan
    value::T
end

NanoSpan(value::TimeInt) = NanoSpan{TimeInt}(value)
