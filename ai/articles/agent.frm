// From https://medium.com/thoughts-on-machine-learning/building-a-decision-making-ai-agent-with-dspy-and-finite-state-machines-for-complex-queries-dd822b732062


#Agent

    -machine-

    $Start
        |>|
            think() 
            -> $Thought ^

    $Thought 
        |>|
            act()
            -> $Acted ^

    $Acted 
        |>|
            observe()
            -> $Observed ^

    $Observed 
        |>|
            decide() ? 
                -> "decided" $Concluded ^
            :
                -> "undecided" $Start ^ 
            :| ^

    $Concluded


    -actions-

    think {
        print("Thinking...")
    }

    act {
        print("Acting...")
    }

    observe {
        print("Observing...")
    }

    decide {
        print("Deciding...")

        ^(true)
    }
##