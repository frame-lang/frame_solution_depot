// https://www.geeksforgeeks.org/mealy-and-moore-machines-in-toc/

fn main {

    var machine:# = #MooreMachine()

    machine.i_0()
    machine.i_0()
    machine.i_1()
}

#MooreMachine

    -interface-

    i_0
    i_1

    -machine-

    $Q0
        |>| 
            setOutput(0) ^
        |i_0| 
            -> "0" $Q1 ^
        |i_1| 
            -> "1" $Q2 ^

    $Q1
        |>| 
            setOutput(0) ^
        |i_0| 
            -> "0" $Q1 ^
        |i_1| 
            -> "1" $Q3 ^

    $Q2 
        |>| 
            setOutput(0) ^
        |i_0| 
            -> "0" $Q4 ^
        |i_1| 
            -> "1" $Q2 ^


    $Q3 
        |>| 
            setOutput(1) ^
        |i_0| 
            -> "0" $Q4 ^
        |i_1| 
            -> "1" $Q2 ^

    $Q4 
        |>| 
            setOutput(1) ^
        |i_0| 
            -> "0" $Q1 ^
        |i_1| 
            -> "1" $Q3 ^

    -actions-

    setOutput [value] {
        print(value)
    }
##