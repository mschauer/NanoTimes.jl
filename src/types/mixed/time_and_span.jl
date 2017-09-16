Base.promote(x::NanoTime{Int64},  y::NanoSpan{Int128}) = (NanoTime{Int128}(x), y)
Base.promote(x::NanoTime{Int124}, y::NanoSpan{Int64})  = (x, NanoSpan{Int128}(y))
Base.promote(x::NanoSpan{Int64},  y::NanoTime{Int128}) = (NanoSpan{Int128}(x), y)
Base.promote(x::NanoSpan{Int128}, y::NanoTime{Int64})  = (x, NanoTime{Int128}(y))
