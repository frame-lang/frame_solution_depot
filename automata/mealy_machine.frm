// https://www.geeksforgeeks.org/mealy-and-moore-machines-in-toc/

fn main {

    var machine:# = #MealyMachine()

    machine.i_0()
    machine.i_0()
    machine.i_1()
}

#MealyMachine

    -interface-

    i_0
    i_1

    -machine-

    $Q0
        |i_0| 
            setOutput(0)
            -> "0/0" $Q1 ^
        |i_1| 
            setOutput(0) 
            -> "1/0" $Q2 ^

    $Q1
        |i_0|
            setOutput(0) 
            -> "0/0" $Q1 ^
        |i_1| 
            setOutput(1) 
            -> "1/1" $Q2 ^

    $Q2 
       |i_0|
            setOutput(1) 
            -> "0/1" $Q1 ^
        |i_1| 
            setOutput(0) 
            -> "1/0" $Q2 ^

    -actions-

    setOutput [value] {
        print(value)
    }
##