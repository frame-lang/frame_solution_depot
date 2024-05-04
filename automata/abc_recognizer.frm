//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | abc_recognizer.frm
//* Description       | Example of a language recognizer.
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-Mar-30	 mark	            Created 
//*******************************************************************/

//-------------------------------------------------------------------------
//
// Recognize language L = (a^nb^nc^n | n >= 1). 
// See https://www.geeksforgeeks.org/l-graphs-and-what-they-represent-in-toc/?ref=lbp
// 
// Frame docs: https://docs.frame-lang.org/en/latest/
//
//-------------------------------------------------------------------------


fn main {

    var n = 4

    var machine:# = #ABC(#(n))

    loop var i = 0; i < n; i = i + 1 {
        print(machine.a())
    }
    
    // print(machine.a()) // uncomment to see failure

    loop var i = 0; i < n; i = i + 1 {
        print(machine.b())
    }
  
    // print(machine.b()) // uncomment to see failure

    loop var i = 0; i < n; i = i + 1 {
        print(machine.c())
    }

    // print(machine.c()) // uncomment to see failure
}

#ABC [#[n]]

    -interface-

    a ^("Recognized a")
    b ^("Recognized b")
    c ^("Recognized c") 

    -machine-

    $A => $Miss
        var count = 0

        |a|
            str = str + "a" 
            count == n - 1 ? -> $B ^ :|
            count = count + 1 ^

    $B => $Miss 
        var count = 0

        |b|
            str = str + "b" 
            count == n - 1 ? -> $C ^ :|
            count = count + 1 ^

    $C => $Miss 
        var count = 0

        |c|
            str = str + "c" 
            count == n - 1 ? -> $Match ^ :|
            count = count + 1 ^

    $Match => $Miss
        |>| 
            ^("Matched " + str)

    $NoMatch => $Miss 

    $Miss 
        |a| 
            str = str + "a" 
            -> $NoMatch ^("No Match " + str)
        |b| 
            str = str + "b" 
            -> $NoMatch ^("No Match " + str)
        |c| 
            str = str + "c"
            -> $NoMatch ^("No Match " + str)

    -domain-

    var n = 0
    var str = ""

##
