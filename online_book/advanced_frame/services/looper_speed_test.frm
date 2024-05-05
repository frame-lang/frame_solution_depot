// https://docs.frame-lang.org/en/latest/advanced_frame/services.html#id6

`import time`

fn main {
    #Looper(>(1000000))
}

#Looper [>[loops]]

-machine-

$Start
    |>| [loops]
        print("Starting")
        -> (loops, loops, time.time()) $A ^

$A
    |>| [total_loops, loops_left, start]
        loops_left == 0  ? -> $Done(total_loops, start) ^ :|
        -> (total_loops, loops_left, start) $B ^

$B
    |>| [total_loops, loops_left, start]
        loops_left = loops_left - 1
        -> (total_loops, loops_left, start) $A ^

$Done [total_loops, start]
    |>|
        print("Done. Looped " + str(total_loops) + " times in ", end = " ")
        print(str(time.time() - start) + " seconds.") ^

##