#HistoryBasic

    -interface-

    switchState
    gotoDeadEnd
    back

    -machine-

    $S0
        |switchState| -> "Switch\nState" $S1 ^
        |gotoDeadEnd| $$[+] -> "Goto\nDead End" $DeadEnd ^
       
    $S1
        |switchState| -> "Switch\nState" $S0 ^
        |gotoDeadEnd| $$[+] -> "Goto\nDead End" $DeadEnd ^

    $DeadEnd
        |back| -> "Go Back" $$[-] ^
##