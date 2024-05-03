#BooleanTestSpec

    -interface-

    doTest[value:bool]

    -machine-

    $Test
        |doTest|[value:bool]
            value ? 
                -> "Tis True" $True ^
            :
                -> "Twas Not" $False ^
            :| ^

    $True 
        |>|
            print("True")
            -> $Test ^

    $False
        |>|
            print("False")
            -> $Test ^

    -actions-

    print[msg:String]
##

