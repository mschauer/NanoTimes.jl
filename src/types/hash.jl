const CLOCK_TYPEID = (UInt === UInt64) ? 0x5FBA9CC226F44571 : 0x7C349DB5
const CLOCK_HASH0  = Base.hash(zero(UInt), CLOCK_TYPEID)

const SPAN_TYPEID = (UInt === UInt64) ? 0x2CB4158B0757301F : 0x49DADDCB
const SPAN_HASH0  = Base.hash(zero(UInt), SPAN_TYPEID)

@inline function Base.hash(clock::Clock, h::UInt)
    Base.hash(
        clock.value,
        (Base.hash(h ⊻ CLOCK_TYPEID) ⊻ CLOCK_HASH0) )
end

@inline function Base.hash(span::Span, h::UInt)
    Base.hash(
        span.value,
        (Base.hash(h ⊻ SPAN_TYPEID) ⊻ SPAN_HASH0) )
end
