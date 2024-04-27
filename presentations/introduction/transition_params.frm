//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | state_parameters.frm
//* Description       | Demo of transition parameters. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-Apr-08	 mark	            Created 
//*******************************************************************/

// See https://docs.frame-lang.org/en/latest/intermediate_frame/transitions.html#enter-event-parameters

fn main {
    var demo:# = #TransitionParamsDemo()
    demo.x()
    demo.y()
}

#TransitionParamsDemo

    -interface-

    x
    y

    -machine-

    $Ready
        |x| -> ("Received x") $Print ^  // Pass enter event custom argument for x.
        |y| -> ("Received y") $Print ^  // Pass enter event custom argument for y.

    $Print
        |>| [msg]                       // Receive enter event parameter 'msg'.
            print(msg)                  // Print msg.
            -> $Ready ^                 // Transition back to $Ready.
##