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
   &diamond; covers all levels of FINRA, MiFID II timestamp t
   
>  The 2018 US, EU financial regulations governing timestamps requi re each stamped time be within _100 microseconds_ of UTC, which includes leap seconds.  To be fully compliant, use a high quality time server/service.
