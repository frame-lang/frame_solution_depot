//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | state_context_basic.frm
//* Description       | Demonstrates Frame scope syntax. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ////////////////////////////////////////////
//* 2024-May-03  mark               Created
//*******************************************************************/


// This spec shows how to use transition enter arguments, 
// state arguments and state variables. 

fn main {
    #StateContextBasic()
}


#StateContextBasic

    -machine-

    $Begin
        |>| -> ("Enter Argument") $Working("State Argument") ^

    $Working[stateArgument:String]

        var stateVariable:String = "State Variable"
        
        |>|[enterArgument:String]
            print(stateArgument)
            print(stateVariable)
            print(enterArgument)
            ^

##