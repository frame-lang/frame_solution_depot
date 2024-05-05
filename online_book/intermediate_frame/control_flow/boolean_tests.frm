// https://docs.frame-lang.org/en/latest/intermediate_frame/control_flow.html#boolean-tests

fn main {
    var x:bool = true
    x ? print("x is true") :|

    x = true
    x ? print("x is true")  :
        print("x is false") :|

    x = false
    x ? print("x is true")  :
        print("x is false") :|

    x = true
    x ?! print("x is true")  :
        print("x is false")  :|

    x = false
    x ?! print("x is true")  :
        print("x is false")  :|
}