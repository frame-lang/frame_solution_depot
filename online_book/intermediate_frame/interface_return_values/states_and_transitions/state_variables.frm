// https://docs.frame-lang.org/en/latest/intermediate_frame/states.html#state-variables

fn main {
    var svd:# = #StateVariablesDemo()
    svd.inc()
    svd.inc()
    svd.cycle()
    svd.inc()
    svd.inc()
}

#StateVariablesDemo

    -interface-

    inc
    cycle

    -machine-

    $Begin

        // state variable initialized to 0

        var counter = 0

        |>|
            print("Entering $Begin, counter = " + str(counter)) ^
        |<| print("Exiting $Begin, counter = " + str(counter)) ^

        |inc|
            counter = counter + 1
            print("Handling |inc|, counter = " + str(counter))
            ^
        |cycle|
            print("Cycling")
            -> $Begin ^
##