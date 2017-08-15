#!/usr/bin/tcl
#
#  performance.tcl
#  ================
#  Uwe Berger; 2015
#
#  ...ein kleiner Performance-Test
#
#

set fact 20
set count 100000

# ****************************************
proc factorial n { 
     if {$n <= 1} { 
          return $n 
     } else {
 		  return [expr $n * [factorial [expr $n-1]]]
     }
}

# ****************************************
# ****************************************
# ****************************************

puts [factorial $fact]

set microsec [time {for {set i 0} {$i < $count} {incr i} {set x [factorial $fact]}}]
puts "Laufzeit ($count x $fact\!: [expr [lindex $microsec 0]/1000.0]ms)"

