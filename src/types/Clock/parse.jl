function Base.parse(::Type{Clock}, str::String)
    str = strip(str)
    if contains(str, 'T')
        strs = split(str,'T')
    elseif contains(str, ' ')
        strs = split(str,' ')
    else
        strs = [str, ""]
    end
    n = length(strs[1])
    if n == 6
        strs[1] = string("20",strs[1][1:2],'-',strs[1][3:4],'-',strs[1][5:6])
    elseif n == 8
        strs[1] = string(strs[1][1:4],'-',strs[1][5:6],'-',strs[1][7:8])
    elseif n < 10
        throw(ErrorException("$(str) is not recognized as a Date[+TimeOfDay] value"))
    end
    
    date = parse(Date, strs[1])
    if contains(strs[2],'.')
       strs = split(strs[2], '.')
       strs[2] = string(strs[2], "000000000")[1:9]
       time = parse(Base.Dates.Time, strs[1])
       time += Base.Dates.Nanosecond(parse(Int64, strs[2]))
    elseif length(strs[2]) == 0
       time = ZEROHOUR
    else
       time = parse(Base.Dates.Time,strs[2])
    end
    return Clock(date, time)
end
