// https://docs.frame-lang.org/en/latest/advanced_frame/runtime.html#id32

fn main {
    var ss:# = #StateStack()
    ss.next()
    ss.next()
    ss.ret()
    ss.ret()
}

#StateStack

    -interface-

    next
    ret

    -machine-

        $A
            |>| print("$A") ^
            |next| $$[+] -> $B ^

        $B
            |>| print("$B") ^
            |next| $$[+] -> $C ^
            |ret| -> $$[-] ^

        $C
            |>| print("$C") ^
            |ret| -> $$[-] ^

##