# Nanosecs.jl
#### Copyright &copy;2017 by Jeffrey Sarnoff.  All rights reserved.
----------
### timestamps, times&sdot;of&sdot;day, durations are precise to one nanosecond
#### use preserves temporal relationships and precision
- Clocks are moments of time: your clock and calendar
- Spans are measures in time: +(3 days), -(5 microseconds), +(1 week 2 days)

==============
(a) fully interoperable with DateTime, Date, Time types
(b) provides a clean, easy-to-understand functional interface
(c) enhances the ability to work with mixed time masures
(d) timestamp precision supports all 2018 FINRA, MiFID II
    regulations (UTC tracable accuracy reqiores hardware).

