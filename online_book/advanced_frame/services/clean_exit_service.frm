// https://docs.frame-lang.org/en/latest/advanced_frame/services.html#id13


`import time`
`import signal`
`import sys`

fn main {
    #CleanExitService()
}

#CleanExitService

    -operations-

    signal_handler[sig, frame] {
        sys.exit(0)
    }

    -machine-

    $Init
        |>|
            signal.signal(signal.SIGINT, #.signal_handler)
            -> $A ^

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