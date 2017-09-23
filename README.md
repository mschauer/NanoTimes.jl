# NanoTimes.jl
#### Copyright &copy;2017 by Jeffrey Sarnoff.  All rights reserved.
----------
### dates with times&sdot;of&sdot;day and durations that understand nanoseconds
### timestamps with selectable subsecond precision
#### algorithms preserve temporal relationships and local precision

- Times are moments of time: your clock and calendar
- Spans are measures in time: +(3 days), -(5 microseconds), +(1 week 2 days)

#### brings in Base.Dates

- interoperates with Date and DateTime, which are exported
- exports Base.Dates.Time as **Time24**, and interoperates
- interoperates with Base.Dates.Period types, which are exported

----

   &diamond; fully interoperable with DateTime, Date, Time24 types    
   &diamond; provides a clean, easy-to-understand functional interface    
   &diamond; enhances the ability to work with mixed time masures   
   &diamond; covers all levels of FINRA, MiFID II timestamping
   
>  The 2018 US, EU financial regulations governing timestamps require stamped times encode UTC ±50 microseconds.
This package does not know whether a conforming time server is present.  The timestamps will be precise; where the time base is UTC traceable and stable,  the timestamps will comply with FINRA and MiFID II 2018 regulations.

-------

| forms | access |
|------|-----|
| &nbsp; | &nbsp; |
| Year .. Nanosecond | the componant itself |
| year .. nanosecond | the raw Int64 value above |
| Years .. Nanoseconds | this and coarser componants in this form |
| years .. nanoseconds | the raw Int64 value above |

- The Year[s], Quarter[s], Month[s] forms are used with Times
- The Hour[s] .. Nanosecond[s] forms are used with Times and with Spans
- The Day and Days are synonyms, Week and Weeks are synonyms

----------

see [these tests](https://github.com/JeffreySarnoff/Nanosecs.jl/blob/master/test/runtests.jl) for a fuller view

