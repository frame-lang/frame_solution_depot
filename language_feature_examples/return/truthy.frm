//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | truthy.frm
//* Description       | Simple example of returning values 
//*                   | from states.
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-Apr-08	 mark	            Created 
//*******************************************************************/

// See https://docs.frame-lang.org/en/latest/intermediate_frame/return.html

fn main {
    var truthy:# = #Truthy()
    print(truthy.isTruthy(true))
    print(truthy.isTruthy(false))
}

#Truthy 

    -interface-

    // Input 
    isTruthy [x] // By default will return "None".

    -machine-

    // 
    $Test 
        |isTruthy| [x] 

            // Boolean test and transitions to appropriate states.
            x ?  
                -> $True 
            :
                -> $False 
            :| ^

    $True 
        // Transition back to $Test and set return value to "True"
        |>| -> $Test ^("True") 

    $False
       // Transition back to $Test and set return value to "False"
        |>| -> $Test ^("False") 

##
