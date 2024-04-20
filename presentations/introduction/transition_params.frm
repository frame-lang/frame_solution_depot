fn main {
    var demo:# = #TransitionParamsDemo()
    demo.x()
    demo.y()
}

#TransitionParamsDemo

    -interface-

    x
    y

    -machine-

    $Ready
        |x| -> ("Received x") $Print ^
        |y| -> ("Received y") $Print ^

    $Print
        |>| [msg]
            print(msg) 
            -> $Ready ^
##