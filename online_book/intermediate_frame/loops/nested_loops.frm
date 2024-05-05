// https://docs.frame-lang.org/en/latest/intermediate_frame/loops.html#nested-loops

fn main {

    print("done while-like loop")

    // for-like loop (a) outside
    // for-like loop (b) inside

    loop var a = 0; a < 5; a = a + 1 {
        a == 3 ? continue  :|
        loop var b = 0; b < 5; b = b + 1 {
            b == 3 ? continue  :|
            print(str(a) + str(b))
        }
    }
    print("done ab loops")

    // for-like loop (c) outside
    // while-like loop (d) inside

    loop var c = 0; c < 5; c = c + 1 {
        c == 3 ? continue  :|
        var d :int = -1
        loop {
            d = d + 1
            d == 3 ? continue  :>
            d == 5 ? break     :|
            print(str(c) + str(d))
        }
    }

    print("done cd loops")

    // while-like loop (e) outside
    // for-like loop (f) inside

    var e:int = -1
    loop {
        e = e + 1
        e == 3 ? continue :>
        e == 5 ? break    :|
        loop var f:int = 0; f < 5; f = f + 1 {
            f == 3 ? continue  :|
            print(str(e) + str(f))
        }
    }

    print("done ef loops")

    // while-like loop (g) outside
    // while-like loop (h) inside

    var g:int = -1
    loop {
        g = g + 1
        g == 3 ? continue :>
        g == 5 ? break    :|
        var h:int = -1
        loop  {
            h = h + 1
            h == 3 ? continue :>
            h == 5 ? break    :|
            print(str(g) + str(h))
        }
    }

    print("done gh loops")
}