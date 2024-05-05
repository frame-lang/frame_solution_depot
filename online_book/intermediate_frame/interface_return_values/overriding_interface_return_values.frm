// https://docs.frame-lang.org/en/latest/intermediate_frame/return.html#overriding-interface-return-values

fn main {
    var sys:# = #InterfaceReturnNo()
    print(sys.getDecision())
}

#InterfaceReturnNo

    -interface-

    getDecision ^("yes")

    -machine-

    $No
        |getDecision|
            // Modify the default from "yes" value to "no".
            ^("no")

##

