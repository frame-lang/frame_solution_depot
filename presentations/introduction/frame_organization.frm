//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | frame_organization.frm
//* Description       | Simple demo of starting/stopping a controller. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-Apr-17	 mark	            Created 
//*******************************************************************/

// This program demonstrates the use of enter/exit events, 
// hierarchical states and the history mechanism. 

fn main {
    var fso:# = #FrameSpecOrganization()
    
    loop var x = 0; x < 5; x = x + 1 {
        fso.start()
        fso.stop()
    }
}

#FrameSpecOrganization

    -interface-

    start 
    stop 

    -machine-

    $Stopped
        |start|
        	-> $Running ^

    $Running
        |>|	
            run_count = run_count + 1
            log("Run count = " ) ^

        |stop|
            -> $Stopped ^

    -actions-

    log [msg] { 
        print(msg + str(run_count))
    }

    -domain-

    var run_count = 0
##