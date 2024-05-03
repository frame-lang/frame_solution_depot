#HistorySpec

    -interface-

    next

    -machine-

    $Waiting
        |>| print("Enter $Waiting") ^
        |next| $$[+] -> "Goto\nDead End" $DeadEnd ^

    $DeadEnd
        |>| print("Enter $DeadEnd") ^
        |next| -> "Go Back" $$[-] ^

    -actions-

    print[msg:String]

##
