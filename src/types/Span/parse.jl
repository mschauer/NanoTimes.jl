const ZEROHOUR = parse(Time, "00:00:00")

function Base.parse(::Type{Span}, str::String)
    str = strip(str)
    n = length(str)
    if contains(str, 'T')
        strs = split(str,'T')
    elseif contains(str, ' ')
        strs = split(str,' ')
    elseif n == 6
        strs = [string("20",str[1:2],'-',str[3:4],'-',str[5:6]), ""]
    elseif n == 10
        strs = [str, ""]
    else
        throw(ErrorException("$(str) is not recognized as a Timespan value"))
    end
    date = parse(Date, strs[1])
    if contains(strs[2],'.')
       strs = split(strs[2], '.')
       time = parse(Base.Dates.Time, strs[1]
       time += Base.Dates.Nanosecond(parse(Int64, strs[2]))
    elseif length(strs[2]) == 0
       time = ZEROHOUR
    else
       time = parse(Base.Dates.Time,strs[2])
    end
    return Span(date, time)
end
