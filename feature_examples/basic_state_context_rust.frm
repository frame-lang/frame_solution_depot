```
#![allow(non_snake_case)]
#![allow(unused_mut)]
#![allow(dead_code)]
#![allow(unused_variables)]
```
#BasicStateContext

    -interface-

    start @(|>>|)

    -machine-

    $Begin
        |>>| -> ("Enter Argument") $Working("State Argument") ^

    $Working[stateArgument:String]

        var stateVariable:String = "State Variable"
        
        |>|[enterArgument:String]
            print(&stateArgument)
            print(&stateVariable)
            print(&enterArgument)
            ^

    -actions-

    print[msg:&String] {`
        println!("{}", &format!("{}",msg));
    `}
##