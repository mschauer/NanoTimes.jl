const ZEROHOUR = parse(Time, "00:00:00")

function Base.parse(::Type{Span}, str::String)
    str = strip(str)
    isneg = str[1] === NEGATIVE || str[1] === '-'
    ispos = str[1] == POSITIVE
    if isneg || ispos
        str = str[2:end]
    else
        ispos = true
    end
    n = length(str)
    if contains(str, 'T')
        strs = split(str,'T')
    elseif contains(str, ' ')
        strs = split(str,' ')
    elseif n == 6
        strs = [string("20",str[1:2],'-',str[3:4],'-',str[5:6]), ""]
    elseif n == 10
        strs = [str, ""]
    elseif str[3] == HMS_SEP
        strs = ["", str]
    else
        throw(ErrorException("$(str) is not recognized as a Timespan value"))
    end
    date = strs[1] != "" : parse(Date, strs[1]) : 0
    if contains(strs[2],'.')
       strs = split(strs[2], '.')
       time = parse(Base.Dates.Time, strs[1])
       time += Base.Dates.Nanosecond(parse(Int64, strs[2]))
    elseif length(strs[2]) == 0
       time = ZEROHOUR
    else
       time = parse(Base.Dates.Time,strs[2])
    end
    result = date==0 ? Span(time) : Span(date, time)
    return isneg ? -result : result
end
