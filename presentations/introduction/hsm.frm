fn main {
    var hsm:# = #HSM()

    hsm.start()
    hsm.pause()
    hsm.unpause()
    hsm.stop()
}

#HSM

    -interface-

    start 
    stop 
    pause 
    unpause 

    -machine-

    $Start 
        |>| print("Enter $Start") ^
        |start| -> $Working ^

    $Working => $Parent
        |>| print("Enter $Working") ^
        |<| print("Exit $Working") ^  
        |pause| $$[+] -> $Paused ^

    $Parent 
        |stop| 
            print("$Parent stopping")
            -> $End ^

    $Paused     
        |>| print("Enter $Paused") ^
        |<| print("Exit $Paused") ^
        |unpause| -> $$[-] ^

    $End
        |>| print("Enter $End") ^
##