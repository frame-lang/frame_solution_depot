// https://docs.frame-lang.org/en/latest/intermediate_frame/lists.html

fn main {
    var l = [0,1,2]

    print("l = " + str(l))

    loop var i = 0; i < len(l); i = i + 1 {
        print("l[" + str(i) + "] = " + str(l[i]))
    }

    loop var i = 0; i < len(l); i = i + 1 {
        l[i] = i + 10
        print("l[" + str(i) + "] = " + str(l[i]))
    }
}