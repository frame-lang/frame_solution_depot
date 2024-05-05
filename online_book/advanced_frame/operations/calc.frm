// https://docs.frame-lang.org/en/latest/advanced_frame/operations.html#id5

fn main {
    print(#Calc.add(1,1))
    print(#Calc.sub(1,1))
}

#Calc

    -operations-

    #[static]
    add [a,b] {
        ^(a+b)
    }

    #[static]
    sub [a,b] {
        ^(a-b)
    }

##