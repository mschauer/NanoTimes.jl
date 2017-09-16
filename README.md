# Nanosecs.jl
#### Copyright &copy;2017 by Jeffrey Sarnoff.  All rights reserved.
----------
### timestamps, times&sdot;of&sdot;day, durations are precise to one nanosecond
#### use preserves temporal relationships and precision
- Clocks are moments of time: your clock and calendar
- Spans are measures in time: +(3 days), -(5 microseconds), +(1 week 2 days)

----

   &diamond; fully interoperable with DateTime, Date, Time types    
   &diamond; provides a clean, easy-to-understand functional interface    
   &diamond; enhances the ability to work with mixed time masures   
   &diamond; covers all levels of FINRA, MiFID II timestamp precision
   
>  The 2018 US and EU financial regulations constrain timestamp behavior.  This package sorts timestamping high frequency trades.  Regulatory compliance also requires hardware that provides time information which remains within 100 microseconds of UTC (an internationally coordinated time using leap seconds. A leap second posts the 61st second of a 60th minute, e.g. _23:59:60_).
