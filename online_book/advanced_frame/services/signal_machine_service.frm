

// https://docs.frame-lang.org/en/latest/advanced_frame/services.html#id18

`import time`
`import signal`
`import sys`

fn main {
    #SignalMachineService()
}

#SignalMachineService

    -operations-

    signal_handler[sig, frame] {
        quit()
    }

    -interface-

    quit

    -machine-

    $Init
        |>|
            signal.signal(signal.SIGINT, #.signal_handler)
            -> $A ^

    $A => $Done
        |>|
            print("$A")
            time.sleep(.2)
            -> $B ^

    $B => $Done
        |>|
            print("$B")
            time.sleep(.2)
            -> $A ^

    $Done
        |quit|
            print("Goodbye!")
            sys.exit(0) ^

##