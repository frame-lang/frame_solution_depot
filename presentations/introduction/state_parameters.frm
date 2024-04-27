//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | state_parameters.frm
//* Description       | Demo of state parameters. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-Apr-08	 mark	            Created 
//*******************************************************************/

// See https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#state-parameters

fn main {
    var demo:# = #StateParamsDemo()
    demo.x()
    demo.y()
}

#StateParamsDemo

    -interface-

    x
    y

    -machine-

    $Ready
        |x| -> $Print("Received x") ^  // Pass custom state argument for 'x'.
        |y| -> $Print("Received y") ^  // Pass custom state argument for 'y'.

    $Print [msg]                       // Receive state parameter 'msg'.
        |>|
            print(msg)                 // Print msg.
            -> $Ready ^                // Transition back to $Ready.
##