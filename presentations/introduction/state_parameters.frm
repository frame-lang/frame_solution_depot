fn main {
    var demo:# = #StateParamsDemo()
    demo.x()
    demo.y()
}

#StateParamsDemo

    -interface-

    x
    y

    -machine-

    $Ready
        |x| -> $Print("Received x") ^
        |y| -> $Print("Received y") ^

    $Print [msg]
        |>|
            print(msg) 
            -> $Ready ^
##