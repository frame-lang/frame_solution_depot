#IfaceCall

    -interface-

    start @(|>>|)
    meaningOfLife:String

    -machine-

    $S0
        |>>|
            var x:String = meaningOfLife()
            print(&x) ^
        |meaningOfLife| ^("42")

    -actions-

    print[msg:&String] {`
        println!("{}", &format!("{}",msg));
    `}

##