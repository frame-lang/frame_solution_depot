//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | mealy_machine.frm
//* Description       | Example of a Mealy FSM.
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-May-10	 mark	            Created  
//*******************************************************************/

//-------------------------------------------------------------------------
//
// A machine for accepting strings with an even number of zeros.
// 
// Frame docs: https://docs.frame-lang.org/en/latest/
//
//-------------------------------------------------------------------------


// From https://medium.com/thoughts-on-machine-learning/building-a-deterministic-state-machine-in-python-64afe794a831

fn main {

    var digits = "0101"

    var dfa:# = #DFA_Even_0s_Acceptor()

    print(dfa.accepts("0101"))  // Should return True, even number of 0s
    print(dfa.accepts("010101"))  // Should return False, odd number of 0s
}

#DFA_Even_0s_Acceptor

    -interface-

    accepts [digits] ^(false)

    -machine-

    $Start 
        |accepts| [digits]
            #.digits = digits
            #.pos = 0
            -> $q0 ^
    $q0
        |>|
            ^= true
            var digit = getDigit() 
            // NOTE! After any transition is an implicit "return" 
            // if not explicitly added.
            digit == "0" ? -> "0" $q1 :>
            digit == "1" ? -> "1" $q0 :>
            : -> "EOL" $Start :|
            ^

    $q1
        |>|
            ^= false
            var digit = getDigit() 
            digit == "0" ? -> "0" $q0 :>
            digit == "1" ? -> "1" $q1 :>
            : -> "EOL" $Start :|
            ^


    -actions-

    getDigit {
        i < len(digits) ? 
            var digit = digits[i]
            i = i + 1
            ^(digit)
        :
            ^(None) 
        :|
    }

    -domain-

    var digits = nil
    var i = 0

##