// See https://mark-truluck.medium.com/data-management-with-frame-state-variables-79746a1102b9

fn main {

    // Create a new Frame controller

    var demo:# = #StateVariableDemo3()

    // counter == 0 

    // Increment the state variable 3 times

    demo.inc()
    demo.inc()
    demo.inc()

    // counter == 3 

    // Transition back into $Start. 

    demo.transition()

    // counter == 0 

    demo.inc()

    // counter == 1
}

#StateVariableDemo3 

    -interface-

    inc 
    transition

    -machine-

    $Start
        // State variables are declared before any 
        // event handlers. 

        var counter = 0

        // The enter event handler will print the value
        // of the counter when transitioning into the state.

        |>| 
            print("Enter $Start")
            print("counter = " + str(counter)) ^

        // The counter variable is local to the state compartment  
        // and keeps increasing while we stay in the state.

        |inc| 
            counter = counter + 1
            print("counter = " + str(counter)) ^ 
        
        // Transitioning out of the state destroys
        // the state compartment and creates a new one.
        // This will create a new data structure and 
        // initialize the new counter variable to 0. 

        |transition|
            print("Transitioning back into $Start" )
            -> $Start ^
##