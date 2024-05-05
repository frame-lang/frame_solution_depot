// https://docs.frame-lang.org/en/latest/advanced_frame/runtime.html#id28

fn main {
    #Runtime4($(1), >(2), #(3))
}

#Runtime4 [$[a], >[b], #[c]]

    -machine-

    $S0 [a]
        |>| [b]
            print("a=" + str(a) + "; b=" + str(b) + "; c=" + str(c)) ^

    -domain-

    var c = nil
##