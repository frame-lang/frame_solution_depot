
#ExitEventHistoryRustSpec

    -interface-

    e1

    -machine-

    $S0
        |<|[x:String] print(&x)  ^
        |e1| $$[+] ("bye") -> $S1 ^

    $S1
        |>| ("hi") -> $$[-] ^
        |<|[x:String] print(&x) ^

    -actions-

    print[msg:&String] {`
        println!("{}", &format!("{}",msg));
    `}

##