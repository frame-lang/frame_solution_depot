// https://docs.frame-lang.org/en/latest/intermediate_frame/loops.html#for-like-loops

fn main {

    loop var x = 0; x < 5; x = x + 1 {
        x == 3 ? continue  :|
        print(x)
    }
    print("done for-like loop")

}