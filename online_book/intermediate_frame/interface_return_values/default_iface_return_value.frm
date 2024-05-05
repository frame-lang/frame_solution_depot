// https://docs.frame-lang.org/en/latest/intermediate_frame/return.html#id7

fn main {
    var sys:# = #InterfaceReturnYes()
    print(sys.getDecision())
}

#InterfaceReturnYes

    -interface-

    // Set default return value to be "yes".
    getDecision : String ^("yes")

##