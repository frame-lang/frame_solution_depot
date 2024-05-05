`import sys`

fn main [msg, count] : int {
    loop var x = 1; x <= int(count); x = x + 1 {
        x == 3 ? print("Its the 3rd message") :
                 print(str(x) + ") " + msg)   :|
    }

    ^(0)
}