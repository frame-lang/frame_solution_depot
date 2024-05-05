// https://docs.frame-lang.org/en/latest/advanced_frame/operations.html#id3

fn main {

    var t:# = #Thermometer()
    print(t.getTemp())
}

#Thermometer

    -operations-

    getTemp  {
        ^(temp)
    }

    -domain-

    var temp : float = 1234.5

##