using Nanosecs
using Base.Dates
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
ndatm3 = Clock(datm2) - Day(12) + Milliseconds(98765) - Microsecond(123) - Nanosecond(2)
nspan1 = Span(time1)
nspan2 = Span(time2)

dndatm = ndatm2 - ndatm1
dndate = ndate2 - ndate1
dnspan = nspan2 - nspan1

@test DateTime(date1) - dtime == DateTime(ndate1 - dnspan)
@test DateTime(date1) + dtime == DateTime(ndate1 + dnspan)

@test dndatm == Span(ddatm)
@test dndate == Span(ddate)
@test dnspan == Span(time2 - time1)

@test ndate1 == parse(Clock, string(ndate1))
@test ndatm2 == parse(Clock, string(ndatm2))
@test nspan1 == parse(Span, string(nspan1))
@test -dnspan == -parse(Span, string(dnspan))

@test nanoseconds(ndatm3) = ndatm3.value
@test microseconds(ndatm3) = fld(ndatm3.value, 1_000)
@test milliseconds(ndatm3) = fld(ndatm3.value, 1_000_000)
@test seconds(ndatm3) = fld(milliseconds(ndatm3), 1_000)
@test minutes(ndatm3) = fld(seconds(ndatm3), 60)
@test hours(ndatm3) = fld(minutes(ndatm3), 60)
@test days(ndatm3) = fld(hours(ndatm3), 24)
@test weeks(ndatm3) = fld(days(ndatm3), 7)

@test Nanoseconds(ndatm3) = Nanoseconds(nanoseconds(ndatm3))
@test Microseconds(ndatm3) = Microseconds(microseconds(ndatm3))
@test Milliseconds(ndatm3) = Milliseconds(milliseconds(ndatm3))
@test Seconds(ndatm3) = Seconds(seconds(ndatm3))
@test Minutes(ndatm3) = Minutes(minutes(ndatm3))
@test Hours(ndatm3) = Hours(hours(ndatm3))
@test Days(ndatm3) = Days(days(ndatm3))
@test Weeks(ndatm3) = Weeks(weeks(ndatm3))

