//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | start_and_stop_machine.frm
//* Description       | Demonstrates Frame scope syntax. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ////////////////////////////////////////////
//* 2024-May-03  mark               Created
//*******************************************************************/

// Starting and Stopping a simple controller.

#StartAndStopMachine

    -interface-

    start 
    stop 

    -machine-

    $Ready
        |start| -> $Working ^

    $Working
        |stop| -> $End ^        

    $End   
##