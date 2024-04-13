fn main {
    var truthy:# = #Truthy()
    print(truthy.input(false))
    print(truthy.input(true))
}

#Truthy

    -interface-

    input [x] // By default return value is 'None'

    -machine-

    $Start
        |input| [x]
            x ?
                -> "x == true" $True
            :  
                -> "x == false" $False
            :| ^


    $True
        |>|
            ^= "True"
            -> $Start^

    $False
        |>|
            -> $Start
            ^("False")
##