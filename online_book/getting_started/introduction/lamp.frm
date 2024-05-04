// https://docs.frame-lang.org/en/latest/getting_started/index.html#executing-frame-programs

fn main {
    var lamp:# = #Lamp()
    lamp.turnOn()
    lamp.turnOff()
}

#Lamp

    -interface-

    turnOn
    turnOff

    -machine-

    $Off
        |>| print("Entering $Off") ^
        |<| print("Exiting $Off") ^

        |turnOn|
            -> $On  ^

    $On
        |>| print("Entering $On") ^
        |<| print("Exiting $On") ^

        |turnOff|
            -> $Off  ^

##