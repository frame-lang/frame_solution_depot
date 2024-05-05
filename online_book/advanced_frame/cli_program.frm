// https://docs.frame-lang.org/en/latest/advanced_frame/cli_programs.html#id4

`import signal`
`import sys`

fn main {
    #CliProgram()
}

#CliProgram

    -machine-

    $GetInput
        |>|
            loop {
                print("Next state? (a|b|quit)")
                var next_state = input()
                next_state ?~
                    ~/a/ -> $A :>
                    ~/b/ -> $B :>
                    ~/quit/ -> $Done :>
                    : print("huh?") :|
            } ^

    $A
        |>|
            a_count = a_count + 1
            print("$A visit #" + str(a_count))
            -> $GetInput ^

    $B
        |>|
            b_count = b_count + 1
            print("$B visit #" + str(b_count))
            -> $GetInput ^

    $Done
        |>|
            print("$Done") ^

    -domain-

    var a_count = 0
    var b_count = 0

##