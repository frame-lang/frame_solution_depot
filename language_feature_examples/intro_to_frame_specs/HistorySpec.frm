#HistorySpec

    -interface-

    start @(|>>|)
    next

    -machine-

    $Start
        |>>| -> $Waiting ^

    $Waiting
        |>| print("Enter $Waiting") ^
        |next| $$[+] -> "Goto\nDead End" $DeadEnd ^

    $DeadEnd
        |>| print("Enter $DeadEnd") ^
        |next| -> "Go Back" $$[-] ^

    -actions-

    print[msg:String]

##
