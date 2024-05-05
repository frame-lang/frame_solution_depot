// https://docs.frame-lang.org/en/latest/intermediate_frame/history.html#state-stack-operators

#History103

  -machine-

    $A
        |gotoC| $$[+] -> "$$[+]" $C ^

    $B
        |gotoC| $$[+] -> "$$[+]" $C ^

    $C
        |return| -> "$$[-]" $$[-] ^

##