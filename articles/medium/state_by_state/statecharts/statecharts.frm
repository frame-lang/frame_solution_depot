fn main {

    var sys:# = #EnterExitEvents() 

    loop var x = 0; x < 2; x = x + 1 {
        sys.next()
    }
}

#EnterExitEvents

    -interface-

    next 

    -machine-

    $Begin 
        |next|
            -> $Working ^
    
    $Working 
        |>|
            print("Enter $Working state") ^
        |<|
            print("Exit $Working state") ^
        
        |next|
            -> $Begin ^

##