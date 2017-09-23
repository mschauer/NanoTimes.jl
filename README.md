# Nanosecs.jl
#### Copyright &copy;2017 by Jeffrey Sarnoff.  All rights reserved.
----------
### timestamps, times&sdot;of&sdot;day, durations with nanoseconds
#### algorithms preserve temporal relationships and local precision
- Times are moments of time: your clock and calendar
- Spans are measures in time: +(3 days), -(5 microseconds), +(1 week 2 days)
- use Time24 should you need Base.Dates.Time
----

   &diamond; fully interoperable with DateTime, Date, Time24 types    
   &diamond; provides a clean, easy-to-understand functional interface    
   &diamond; enhances the ability to work with mixed time masures   
   &diamond; covers all levels of FINRA, MiFID II timestamping
   
>  The 2018 US, EU financial regulations governing timestamps require stamped times encode UTC ±50 microseconds.
This package does not know whether a conforming time server is present.  The timestamps will be precise; where the time base is UTC traceable and stable,  the timestamps will comply with FINRA and MiFID II 2018 regulations.

-------

- Year, .., Nanosecond access that componant, ignoring other parts
- Years, .., Nanoseconds express that component and all coarser parts in terms of that component
- year, .., nanosecond deliver the raw (Int64) value for that componant
- years, .., nanoseconds deliver the raw (Int64) value from Years, .., Nanoseconds

======

| forms | use |
|------|-----|
| &nbsp; | &nbsp; |
| Year .. Nanosecond | access the componant itself |
| year .. nanosecond | access the raw value above |
| Years .. Nanoseconds | access this and coarser componants in this form |
| years .. nanoseconds | access the raw value above |
