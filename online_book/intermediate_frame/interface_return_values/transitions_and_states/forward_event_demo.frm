// https://docs.frame-lang.org/en/latest/intermediate_frame/transitions.html#id21

fn main {
    var sys:# = #ForwardEventDemo()
    sys.payment("$100")
    sys.payment("$200")
    sys.payment("$300")
}

#ForwardEventDemo

    -interface-

    payment [paymentData]

    -machine-

    $Waiting
        |payment| [paymentData]
            // Forward event using the dispatch operator =>
            -> => $ProcessPayment ^

    $ProcessPayment
        |payment| [paymentData]
             print("Payment received: " + paymentData)
             -> $Waiting ^

##