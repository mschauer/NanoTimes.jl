const POSITIVE = '+'
const NEGATIVE = '−'
const PLUSMINUS = '±'
const MINUSPLUS = '∓'
const HMS_SEP  = ':'
const DYHR_SEP = 'd'
const SCSS_SEP = 's'
const YMD_SEP  = '-'
const DEC_PT   = '.'
const DTM_SEP  = 'T'
const UT_SFX   = 'Ƶ'
const UTC_SFX  = 'Z'

@inline posneg(isneg::Bool) = isneg ? NEGATIVE : POSITIVE

@inline function twodigits(x::Integer)
    x < 10 ? string('0',x) : string(x)
end

@inline function threedigits(x::Integer)
    x < 10 ? string("00",x) : (x < 100 ? string('0', x) : string(x))
end

function sixdigits(x::Integer)
    hi, lo = divrem(x, 1000)
    string( threedigits(hi), threedigits(lo) )
end

function ninedigits(x::Integer)
   md, lo = divrem(x, 1000)
   hi, md = divrem(md, 1000)
   string( threedigits(hi), threedigits(mid), threedigits(lo) )
end

function signed_hoursmins(x::Integer)
   isneg, absx = signbit(x), abs(x)
   h, m = divrem(absx, 60)
   string(posneg(isneg), twodigits(h), HMS_SEP, twodigits(m))
end
