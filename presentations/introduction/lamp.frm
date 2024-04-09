//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | lamp.frm
//* Description       | Simple lamp system model. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-Apr-08	 mark	            Created 
//*******************************************************************/


fn main {
    var lamp:# = #Lamp()
    lamp.turnOn()
    lamp.turnOff()
}

#Lamp

    -interface-

    turnOn
    turnOff
    
    -machine-

    $Off                                // $Off state
        |>| print("Entering $Off") ^    // Enter event handler
        |<| print("Exiting $Off")  ^    // Exit event handler

        |turnOn|                        // event selector for 'turnOn' message
            -> $On                      // transition to $On state
            ^                           // return from event handler

    $On                                 // $On state
        |>| print("Entering $Off") ^    // Enter event handler
        |<| print("Exiting $Off")  ^    // Exit event handler

        |turnOff|                       // event selector for 'turnOff' message
            -> $Off                     // transition to $Off state
            ^                           // return from event handler

##


