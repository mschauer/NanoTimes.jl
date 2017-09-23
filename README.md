# Nanosecs.jl
#### Copyright &copy;2017 by Jeffrey Sarnoff.  All rights reserved.
----------
### timestamps, times&sdot;of&sdot;day, durations with nanoseconds
#### use preserves temporal relationships and precision
- Clocks are moments of time: your clock and calendar
- Spans are measures in time: +(3 days), -(5 microseconds), +(1 week 2 days)

----

   &diamond; fully interoperable with DateTime, Date, Time types    
   &diamond; provides a clean, easy-to-understand functional interface    
   &diamond; enhances the ability to work with mixed time masures   
   &diamond; covers all levels of FINRA, MiFID II timestamping
   
>  The 2018 US, EU financial regulations governing timestamps require stamped times encode UTC ±50 microseconds.
This package does not know whether a conforming time server is present.  The timestamps will be precise; where the time base is UTC traceable and stable,  the timestamps will comply with FINRA and MiFID II 2018 regulations.
