
//*******************************************************************
//* Author            | Mark Truluck (mark@frame-lang.org)
//* Copyright         | 2024 MIT License
//* File Name         | regex_parser.frm
//* Description       | Simple regex parser in Frame.
//*                    
//* Revision History  :
//* Date		 Author 			Comments
//* ------------------------------------------------------------------
//* 2024-Mar-23	 mark	            Created 
//*
//*******************************************************************/

//-------------------------------------------------------------------------
//
// A *very* simple regex parser in Frame for single alpha-numeric chars 
// using the '*', '+' and '?' operators.
// 
// Frame docs: https://docs.frame-lang.org/en/latest/
// Validate regex against https://regex101.com/
//
//-------------------------------------------------------------------------


fn main {

    var rep:# = #RegExParser()
    print("(regex,string) -> match?")
    print("(_,_) -> " + str(rep.run("",""))) // True
    print("(_,a) -> " + str(rep.run("","a"))) // True
    print("(a,_) -> " + str(rep.run("a",""))) // True
    print("(a,a) -> " + str(rep.run("a","a"))) // True
    print("(a,b) -> " + str(rep.run("a","b"))) // False
    print("(ab,abcde) -> " + str(rep.run("ab","abcde"))) // True
    print("(cd,abcde) -> " + str(rep.run("cd","abcde"))) // True
    print("(de,abcde) -> " + str(rep.run("de","abcde"))) // True
    print("(ce,abcde) -> " + str(rep.run("ce","abcde"))) // False
    print("(abcde,abcde) -> " + str(rep.run("abcde","abcde"))) // True
    print("(ab?c,ac) -> " + str(rep.run("ab?c","ac"))) // True
    print("(ab?c,abc) -> " + str(rep.run("ab?c","abc"))) // True
    print("(ab?c,ae) -> " + str(rep.run("ab?c","ae"))) // False
    print("(ab?c,abbc) -> " + str(rep.run("ab?c","abbc"))) // False
    print("(ab?c+,abb) -> " + str(rep.run("ab?c+","abb"))) // False
    print("(ab?c+,abcc) -> " + str(rep.run("ab?c+","abcc"))) // True
    print("(ab?c+,abbcc) -> " + str(rep.run("ab?c+","abbcc"))) // False
    print("(a*b?c+,abcc) -> " + str(rep.run("a*b?c+","abcc"))) // True
    print("(a*b?c+,a) -> " + str(rep.run("a*b?c+","a"))) // False
    print("(a*b?c+,b) -> " + str(rep.run("a*b?c+","b"))) // False
    print("(a*b?c+,c) -> " + str(rep.run("a*b?c+","c"))) // True
    print("(a*b?c+,ab) -> " + str(rep.run("a*b?c+","ab"))) // False
    print("(a*b?c+,bc) -> " + str(rep.run("a*b?c+","bc"))) // True
    print("(a*b?c+,cc) -> " + str(rep.run("a*b?c+","cc"))) // True
    print("(a*b?c+,ac) -> " + str(rep.run("a*b?c+","ac"))) // True
    print("(a*b?c+,axc) -> " + str(rep.run("a*b?c+","axc"))) // True
    print("(a*b?c+,axcd) -> " + str(rep.run("a*b?c+","axcd"))) // True
    print("(a*b?c+,cx) -> " + str(rep.run("a*b?c+","cx"))) // True
    print("(a*b?c+,ax) -> " + str(rep.run("a*b?c+","ax"))) // False
    print("(a*b?c+,bx) -> " + str(rep.run("a*b?c+","bx"))) // False
    print("(1*23,123) -> " + str(rep.run("123","123"))) // True
    print("(1*23,23) -> " + str(rep.run("1*23","23"))) // True
    print("(1*23,1123) -> " + str(rep.run("1*23","1123"))) // True
    print("(1*23,11223) -> " + str(rep.run("1*23","11223"))) // False
    print("(a1*b+23*c,11223) -> " + str(rep.run("a1*b+23*c","11223"))) // False
    print("(a1*b+23*c,ab23c) -> " + str(rep.run("a1*b+23*c","ab23c"))) // True
    print("(-,a) -> " + str(rep.run("-","a"))) // False
    print("(a,-) -> " + str(rep.run("a","-"))) // False
}

//-------------------------------------------------------------------------
//  #RegExParser is a parser for a very small subset of regex operators.
//  Currently it supports:
//      'a?' : char 'a' is optional
//      'a*' : char 'a' can repeat 0 or more times
//      'a+' : char 'a' can repeat 1 or more times
//-------------------------------------------------------------------------

#RegExParser

    -interface-

    // run    
    // @param regex the regex string to match
    // @param str   the string to search for regex match
    // @return bool true if pattern found in string 

    run [regex, str] : bool (false)

    -machine-
    
    //-------------------------------------------------------------------------
    // $Start
    // 
    // Handle the "run" message and reset internal state, then initialize 
    // regex pattern and string to search in.
    // 
    // Transition for processing in $StartMatchElement state.   
    //-------------------------------------------------------------------------

    $Start

        |run| [regex, str] : bool

            // Reset domain. 

            reset()

            // Initialize domain vars regex and str and set lengths.

            #.regex = regex 
            regex_len = len(regex)
            #.str = str 
            str_len = len(str) 

            // Search for the first regex element.

            -> $StartMatchElement ^
    
    //-------------------------------------------------------------------------
    // $StartMatchElement
    // 
    // Determine if analysis run is complete. If not, goto $FindNextRegexElement.
    //-------------------------------------------------------------------------

    $StartMatchElement

        |>|
            // If the regex has been fully traversed, there is a match.

            isEndOfRegex()  ? -> $Start ^(true)  :>

            // If the string has been fully traversed, there is no match
            // so continue run.

            isEndOfStr()    ? -> $Start ^(false) :> 
                            : -> $FindNextRegexElement :| ^

    //-------------------------------------------------------------------------
    // $FindNextRegexElement
    // 
    // Find the regex element (single char, char + operator).   
    // Determine if analysis run is complete. If not, goto $FindNextRegexElement.
    //-------------------------------------------------------------------------

    $FindNextRegexElement

        |>|
        
            var regex_char = regex[regex_pos]   

            regex_char.isalnum() ? 

                // Found alphanum char. Consume it. 

                matchRegexChar(regex_char) ?!
                    // At end of regex, evaluate last match.
                    -> $DoCharMatch(regex_char) ^ 
                :|
            
                matchRegexChar("?") ? 
                    // consume '?'
                    -> $DoCharOptionalMatch(regex_char) ^
                :|

                matchRegexChar("*") ? 
                    // consume '*'
                    -> $DoCharStarMatch(regex_char) ^
                :|
                
                matchRegexChar("+") ? 
                    // consume '+'
                    -> $DoCharPlusMatch(regex_char) ^
                :|

                -> $DoCharMatch(regex_char) ^
            :|

            // Not a valid character in the language. 

            -> $Error ^

    //-------------------------------------------------------------------------
    // $DoCharMatch
    // 
    // Match the found regex char to the char at the current string pos. 
    //-------------------------------------------------------------------------

    $DoCharMatch [regex_char]

        |>|

            matchChar(regex_char) ?

                // Match found. Find next one.

                -> $StartMatchElement ^
            :|

            // No match. Reset regex search pattern index 

            resetRegexPos()

            // Go to next string char.

            incStrPos()

            -> $StartMatchElement ^ 

    //-------------------------------------------------------------------------
    // $DoCharOptionalMatch
    // 
    // Optionally match the found regex char to the char at the 
    // current string pos. 
    // 
    // Regex example: "a?b" 
    //-------------------------------------------------------------------------

    $DoCharOptionalMatch [regex_char]

        |>|

            // Match may or may not succeed.

            matchChar(regex_char)

            // Start next regex element search.

            -> $StartMatchElement ^ 

    //-------------------------------------------------------------------------
    // $DoCharStarMatch
    // 
    // Match the found regex char to the char at the 
    // current string pos 0 or more times. 
    //
    // Regex example: "a*b" 
    //-------------------------------------------------------------------------

    $DoCharStarMatch [regex_char]

        |>|

            // Match string char with regex_char. 

            matchChar(regex_char) ?

                // If a match occurs, repeatedly loop back 
                // to this state  until another char type is found. 

                -> $DoCharStarMatch(regex_char) ^
            :|

            // Start next regex element search.

            -> $StartMatchElement ^ 

    //-------------------------------------------------------------------------
    // $DoCharPlusMatch
    // 
    // Match the found regex char to the char at the 
    // current string pos 1 or more times. 
    //
    // Regex example: "a+b" 
    //-------------------------------------------------------------------------

    $DoCharPlusMatch [regex_char]

        |>|

            // Match current string char with regex_char. 

            matchChar(regex_char) ?

                // If match occurs, transition to the 
                // star match state as the required 
                // one char match has occurred.  
                // Other matches are optional. 

                -> $DoCharStarMatch(regex_char) ^
            :|

            // Did not match. Reset regex index to 0.

            resetRegexPos()

            // Move to next string char. 

            incStrPos()

            // Look for next regex element. 

            -> $StartMatchElement ^ 

    //-------------------------------------------------------------------------
    // $Error
    // 
    // An invalid *regex* char was found - must be alpha numeric chars in regex.
    // (String chars, however, can be anything so not an error) Terminate run. 
    //-------------------------------------------------------------------------

    $Error  

    -actions-

    //-------------------------------------------------------------------------
    // Test if regex has been fully matched. 
    //-------------------------------------------------------------------------

    isEndOfRegex : bool {
        ^(regex_pos >= regex_len)
    }

    //-------------------------------------------------------------------------
    // Used as the parser searches the next regex element char by char.
    //-------------------------------------------------------------------------

    matchRegexChar [regex_char] : bool {

        // Guard for end of regex. 
        // This is the match success condition. 

        isEndOfRegex() ? ^(false) :|

        // Test found char with regex char at current index position. 

        regex[regex_pos] == regex_char ? 

            // If expected char is found, advance the regex index. 

            incRegexPos()

            ^(true)
        :
            // No match. 

            ^(false)          
        :|     
    }

    //-------------------------------------------------------------------------
    // One char lookahead for regex. 
    //-------------------------------------------------------------------------

    peekRegexChar [regex_char] : bool {
        isEndOfRegex() ? ^(false) :|
        ^(regex[regex_pos] == regex_char)
    }

    //-------------------------------------------------------------------------
    // Advance regex index position. 
    //-------------------------------------------------------------------------

    incRegexPos {
        regex_pos = regex_pos + 1
    }

    //-------------------------------------------------------------------------
    // Test for end of the string.
    //-------------------------------------------------------------------------

    isEndOfStr : bool {
        ^(str_pos >= str_len)
    }   

    //-------------------------------------------------------------------------
    // Match a regex char to the current char from the string.
    //-------------------------------------------------------------------------

    matchChar [regex_char] : bool {

        // Test for end of string. 
        // Run termination condition. 

        isEndOfStr() ? ^(false) :|

        // Test regex char match to string char. 

        str[str_pos] == regex_char ? 
            
            // Matched. Increment string char index.

            incStrPos()

            ^(true)
        :|

        ^(false)
    }

    //-------------------------------------------------------------------------
    // Advance string index position. 
    //-------------------------------------------------------------------------

    incStrPos {
        str_pos = str_pos + 1
    }

    //-------------------------------------------------------------------------
    // Reset regex index position. Used when current regex 
    // element does not match the current string sequence. 
    //-------------------------------------------------------------------------

    resetRegexPos {
        regex_pos = 0
    }

    //-------------------------------------------------------------------------
    // Reset domain prior to a new run.  
    //-------------------------------------------------------------------------

    reset {
        regex = nil 
        regex_len = 0
        regex_pos = 0
        str = nil
        str_len = 0
        str_pos = 0
        current_element = nil
        next_re_element = ""
        match = false 
    }

    -domain-

    var _debug = false 
    var regex = nil 
    var regex_len = 0
    var regex_pos = 0
    var str = nil
    var str_len = 0
    var str_pos = 0
    var current_element = nil
    var next_re_element = ""
    var match = false 
                
##