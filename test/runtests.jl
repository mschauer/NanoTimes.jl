using Nanosecs
using Base.Test

date1 = Date("1995-02-17")
date2 = Date("2012-04-18")
datm1 = DateTime("1995-02-17T03:22:17.012")
datm2 = DateTime("2012-04-18T17:13:08")
time1 = Time(datm1)
time2 = Time(datm2)

ddate = date2 - date1
ddtm  = datm2 - datm1
dtime = time2 - time1

ndate1 = Clock(date1)
ndate2 = Clock(date2)
ndatm1 = Clock(datm1)
ndatm2 = Clock(datm2)
nspan1 = Span(time1)
nspan2 = Span(time2)
#= 
nspan  = nspan2 - nspan1

@test date1 - dtime == DateTime(ndate1 - nspan)
@test date1 + dtime == DateTime(ndate1 + nspan)
=#
