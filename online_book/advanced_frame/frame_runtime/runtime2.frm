// https://docs.frame-lang.org/en/latest/advanced_frame/runtime.html#id15

fn main {
    var runtime_demo:# = #Runtime2()
    runtime_demo.next(1,2,3)
}

#Runtime2

    -interface-

    next [a,b,c]

    -machine-

    $S0
        |<| [a]
            print("a=" + str(a), end="") ^

        |next| [a,b,c]
            (a) -> (b) $S1(c) ^

    $S1 [c]
        |>| [b]
            print("; b=" + str(b) + "; c=" + str(c)) ^

##