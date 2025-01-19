// https://docs.frame-lang.org/en/latest/advanced_frame/persistence.html#id14

`import sys`
`import time`
`import jsonpickle`

fn main() {

    // instantiate system
    var flow = Workflow()

    // delay
    time.sleep(1)

    loop var i = 0; i < 4; i = i + 1 {
        flow.next()

        // Persist workflow
        var data = flow.marshal()

        // dereference system
        flow = nil

        // delay
        time.sleep(1)

        // Revive workflow
        flow = Workflow.unmarshal(data)
    }

    flow.next()
    flow = nil
}

system Workflow {

    operations:

    #[static]
    unmarshal (data) : Workflow  {
        return (jsonpickle.decode(data))
    }

    marshal() : JSON {
        return (jsonpickle.encode(self))
    }

    interface:

        next()

    machine:

        $Ready {

            $>() {
                print("Ready") 
            }

            next() {
                -> $Step1 
            }

        }


        $Step1 {

            $>() {
                print("Doing Step1")
            }

            next() {
                -> $Step2 
            }

        }


        $Step2 {
            $>() {
                print("Doing Step2") 
            }


            next() {
                -> $Done 
            }

        }


        $Done {
            var exclaimation_count = 1

            $>() {
                print("Done.") 
            }


            next() {
                print("I told you I was done", end="")
                loop var i = 0; i < exclaimation_count; i = i + 1 {
                    print("!",end="")
                }
                exclaimation_count = exclaimation_count + 1
                print("") 
            }

        }


}
