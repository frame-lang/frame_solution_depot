//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | frame_system_organization.frm
//* Description       | Simple demo of starting/stopping a controller. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-Apr-17	 mark	            Created 
//* 2024-Apr-19	 mark	            Updated name
//* 2024-Apr-27  mark               Updated name
//*******************************************************************/


fn main {
    var fc:# = #FrameSystem()
    
    loop var x = 0; x < 5; x = x + 1 {
        fc.start()
        fc.stop()
    }
}

#FrameSystem

    -interface-

    start 
    stop 

    -machine-

    $Stopped
        |start|                              // 'start' message selector
           log("Started")                    // call log() action
        	-> $Running ^                    // transition to $Running state

    $Running
        |>|	                                 // 'enter' message selector
            run_count = run_count + 1        // increment run count domain var
            log("Run count = " ) ^           // call log() action

        |stop|                               // 'stop' message selector
            -> $Stopped ^                    // transition to $Stopped state

    -actions-

    log [msg] { 
        print(msg + str(run_count))
    }

    -domain-

    var run_count = 0
##