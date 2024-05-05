// https://docs.frame-lang.org/en/latest/intermediate_frame/loops.html#while-like-loops

fn main {

    var y:int = -1
    loop {
        y = y + 1
        y == 3 ? continue  :>
        y == 5 ? break     :|
        print(y)
    }
    print("done while-like loop")

}