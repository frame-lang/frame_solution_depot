// https://docs.frame-lang.org/en/latest/advanced_frame/persistence.html#id11

`import sys`
`import time`
`import jsonpickle`

fn main {

    var demo:# = #PersistDemo()

    // get deep copy
    var data = demo.marshal()

    // remove reference to system
    demo = nil

    loop var i = 0; i < 3; i = i + 1 {

        // Restore system using static operation
        demo = #PersistDemo.unmarshal(data)

        // get deep copy
        data = demo.marshal()

        // remove reference to the system
        demo = nil
    }

}

#PersistDemo

    -operations-

    #[static]
    unmarshal [data] : #PersistDemo  {
        var demo:# = jsonpickle.decode(data)
        demo.revived()
        ^(demo)
    }

    marshal : JSON {
        ^(jsonpickle.encode(self))
    }

    -interface-

    revived

    -machine-

    $Start
        var revived_count = 0

        |>|
            print("Started") ^

        |revived|
            revived_count = revived_count + 1
            print("Revived = " + str(revived_count) + " times")
            ^

##