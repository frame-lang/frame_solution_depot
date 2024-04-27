//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | elevator.frm
//* Description       | Elevator model. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-Apr-27  mark               Created
//*******************************************************************/

#Elevator 

    -machine-

    $Stopped 
        |pressUp| -> $GoingUp  ^
        |pressDown| -> $GoingDown ^

    $GoingUp
        |atFloor| -> $Stopped ^

    $GoingDown
      |atFloor| -> $Stopped ^

##