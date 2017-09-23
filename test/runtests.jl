using Nanosecs
using Base.Test

date1 = Date("1995-02-17")
date2 = Date("2012-04-18")
datm1 = DateTime("1995-02-17T03:22:17.012")
datm2 = DateTime("2012-04-18T17:13:08")
time1 = Time(datm1)
time2 = Time(datm2)

ddate = date2 - date1
ddatm = datm2 - datm1
dtime = time2 - time1

ndate1 = Clock(date1)
ndate2 = Clock(date2)
ndatm1 = Clock(datm1)
ndatm2 = Clock(datm2)
nspan1 = Span(time1)
nspan2 = Span(time2)

dndatm = ndatm2 - ndatm1
dndate = ndate2 - ndate1
dnspan = nspan2 - nspan1

@test dndatm == Span(ddatm)
@test dndate == Span(ddate)
@test dnspan == Span(time2 - time1)

@test ndate1 = parse(Clock, string(ndate1))
@test ndatm2 = parse(Clock, string(ndatm2))
@test nspan1 = parse(Span, string(span1))
@test -dnspan = -parse(Span, string(dnspan))


@test date1 - dtime == DateTime(ndate1 - nspan)
@test date1 + dtime == DateTime(ndate1 + nspan)
=#
