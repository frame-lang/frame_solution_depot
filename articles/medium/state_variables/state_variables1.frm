// See https://mark-truluck.medium.com/data-management-with-frame-state-variables-79746a1102b9

fn main {

    // Instantiate a Frame controller. 

    #StateVariableDemo1()
}

#StateVariableDemo1 

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

##