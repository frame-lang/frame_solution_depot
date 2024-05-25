#HistoryDemo

  -machine-

    $Start
        |>|
            rand() > .5 ?
                -> "A" $A 
            :
                -> "B" $B 
            :| ^

    $A
        |gotoC| $$[+] -> "$$[+]" $C ^

    $B
        |gotoC| $$[+] -> "$$[+]" $C ^

    $C
        |return| -> "$$[-]" $$[-] ^

##