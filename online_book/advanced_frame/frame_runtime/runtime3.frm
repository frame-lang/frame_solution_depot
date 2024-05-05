// https://docs.frame-lang.org/en/latest/advanced_frame/runtime.html#id25

fn main {
    var runtime_demo:# = #Runtime3()
    runtime_demo.next(1,2,3)
}

#Runtime3

    -interface-

    next [a,b,c]

    -machine-

    $S0
        |next| [a,b,c]
            -> => $S1 ^

    $S1
        |next| [a,b,c]
            print("a=" + str(a) + "; b=" + str(b) + "; c=" + str(c)) ^

##