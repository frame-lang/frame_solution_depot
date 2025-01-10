fn main() {
    var s = S()
    print(s.a(1,2))
    print(s.b())
    s.c()
    print(s.d())
}

system S {

    operations:

        a(x,y) : int {
            return (x+y)
        }

        b() : int {
            return 1+2/3
        }

        c() {
            print(self.x)
        }

        d() {
            var a = 1

            return a + self.x
        }

    interface:

        a(x,y) : int
        b() : int
        c()
        d()

    domain:

        var x = 1
}
