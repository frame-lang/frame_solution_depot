// https://docs.frame-lang.org/en/latest/advanced_frame/services.html#id8

`import time`

fn main {
    #BasicService()
}

#BasicService

-machine-

$A
    |>|
        print("$A")
        time.sleep(.2)
        -> $B ^

$B
    |>|
        print("$B")
        time.sleep(.2)
        -> $A ^

##