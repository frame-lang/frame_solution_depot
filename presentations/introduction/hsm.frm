//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | lamp.frm
//* Description       | Statechart features demo. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-Apr-13	 mark	            Created 
//*******************************************************************/

// This program demonstrates the use of enter/exit events, 
// hierarchical states and the history mechanism. 

fn main {
    var hsm:# = #HSM()

    hsm.run()
    hsm.pause()
    hsm.unpause()
    hsm.stop()
}

#HSM

    -interface-

    run 
    stop 
    pause 
    unpause 

    -machine-

    $Begin 
        |>| print("Enter $Begin") ^
        |<| print("Exit $Begin") ^  

        |run| -> $Working ^

    $Working => $Parent
        |>| print("Enter $Working") ^
        |<| print("Exit $Working") ^  

        |pause| $$[+] -> $Paused ^

    $Parent 
        |stop| 
            print("$Parent stopping")
            -> $End ^

    $Paused     
        |>| print("Enter $Paused") ^
        |<| print("Exit $Paused") ^
        
        |unpause| -> $$[-] ^

    $End
        |>| print("Enter $End") ^
##