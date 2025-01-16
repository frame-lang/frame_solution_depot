
system S {

   operations:

    marshal() : JSON {
        return self
    }

    marshal1() : JSON {
        return (self)
    }
    marshal2() : JSON {
        return (((self)))
    }

    marshal3() : JSON {
        var c = self.a + self.b 
        return (jsonpickle.encode(self))
    }


    machine:


        $S1 => $S2 {
            a() {  
                 loop {
                    continue
                 }
            }
        }

        $S2 {
            a() {

            }
        }

        $S3 => $S4 {
            a0() {
                
            }

            a() {
                return self
            }

            b() {
                return (self)
            }
            
            c() {
                return (((self)))
            }
            
            d() {
                return (((self.a + self.b)))
            }

                        
            e() {
                x() + y()
                
            }
        }

        $S4 {

        }

    actions:

    a1() : int { 
        var c = self.a + self.b 
        print(c) 
        return c
    }
    

    domain:

        var a = 1
        var b = 2
}
