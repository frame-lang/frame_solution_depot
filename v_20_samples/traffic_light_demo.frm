
`import sys`
`import time`
`import jsonpickle`

fn main() {

    // Instantiate System Controller
    var tl = TrafficLight()

    // Save off internal state
    var data = tl.marshal()

    // Set controller variable to nil
    tl = nil

    // Sleep a bit
    time.sleep(.5)

    loop var x = 0; x < 9; x = x + 1 {
        
        // Now reinstantiate controller from 
        // persisted data using the unmarshal operation
        tl = TrafficLight.unmarshal(data)

        // Send tick event to drive state machine
        tl.tick()

        // Sleep some more
        time.sleep(.5)

        // Repeat saving off state and removing 
        // reference to system controller 
        data = tl.marshal()
        tl = nil
    }
}

system TrafficLight {

    operations:

    #[static]
    unmarshal (data) : TrafficLight  {
        return (jsonpickle.decode(data))
    }

    marshal() : JSON {
        return (jsonpickle.encode(self))
    }

    interface:

    tick()

    machine:

    $Green {
        >() {
            print("Green")
        }

        tick() {
            -> $Yellow
        }

    }


    $Yellow {

        >() {
            print("Yellow")
        }

        tick() {
            -> $Red
        }
    }

    $Red {

        >() {
            print("Red")
        }

        tick() {
            -> $Green
        }
    }

}
