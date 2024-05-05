// https://docs.frame-lang.org/en/latest/intermediate_frame/transitions.html#id23

fn main {

    #TransitionGrouping()

}

#TransitionGrouping

    -interface-

    -machine-

    $Start
        |>|
            (foo()) (-> $Bar) ^

    $Bar 
        |>|
            print("foobar") ^

    -actions-

    foo

##