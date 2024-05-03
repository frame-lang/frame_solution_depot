//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | scopes.frm
//* Description       | Demonstrates Frame scope syntax. 
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ////////////////////////////////////////////
//* 2024-May-03  mark               Created
//*******************************************************************/

// Scope Glossary
// ||.x  --- The x variable declared in the event handler scope. 
// ||[x] --- The x parameter in the event handler parameter list.
// $.x   --- The x variable declared in the state scope.
// $[x]  --- The x parameter in the state parameter list. 
// #.x   --- The x domain variable.

fn main {
    #ScopeIdentifiers()
}

#ScopeIdentifiers

    -machine-

    $Begin
        |>| -> (2) $Scopes(4) ^

    $Scopes[d:int] // 4

        var c:int = 3

        |>| [b:int] // 2

            var a:int = 1

            output(a, b, c, d, e)
            output(||.a, ||[b], $.c, $[d], #.e) ^

    -actions-

    output[a:int, b:int, c:int, d:int, e:int] {
        print(str(a) + str(b) + str(c) + str(d) + str(e))
    }

    -domain-

    var e:int = 5
##
