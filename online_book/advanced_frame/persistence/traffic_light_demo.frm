// https://docs.frame-lang.org/en/latest/advanced_frame/persistence.html#id12

`import sys`
`import time`
`import jsonpickle`

fn main {

    var tl:# = #TrafficLight()
    var data = tl.marshal()
    tl = nil
    time.sleep(.5)

    loop var x = 0; x < 9; x = x + 1 {
        tl = #TrafficLight.unmarshal(data)
        tl.tick()
        time.sleep(.5)
        data = tl.marshal()
        tl = nil
    }
}

#TrafficLight

    -operations-

    #[static]
    unmarshal [data] : #TrafficLight  {
        ^(jsonpickle.decode(data))
    }

    marshal : JSON {
        ^(jsonpickle.encode(self))
    }

    -interface-

    tick

    -machine-

    $Green
        |>|
            print("Green") ^

        |tick|
            -> $Yellow ^

    $Yellow
        |>|
            print("Yellow") ^

        |tick|
            -> $Red ^

    $Red
        |>|
            print("Red") ^

        |tick|
            -> $Green ^

##