// See https://mark-truluck.medium.com/data-management-with-frame-state-variables-79746a1102b9

fn main {

    // Create a new Frame controller

    var demo:# = #StateVariableDemo2()

    // counter == 0 

    // Increment the state variable 3 times

    demo.inc()
    demo.inc()
    demo.inc()
}

#StateVariableDemo2 

    -interface-

    inc 

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

        // The counter variable is local to the state instance  
        // and keeps increasing while we stay in the state.
        |inc| 
            counter = counter + 1
            print("counter = " + str(counter)) ^ 
##