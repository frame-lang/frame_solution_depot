// Regex parser for single alpha-numeric chars using 
// the '*', '+' and '?' operators.
// Validate against https://regex101.com/

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
    print("(a*b?c+,a) -> " + str(rep.run("a*b?c+","a"))) // True
    print("(a*b?c+,b) -> " + str(rep.run("a*b?c+","b"))) // True
    print("(a*b?c+,c) -> " + str(rep.run("a*b?c+","c"))) // True
    print("(a*b?c+,ab) -> " + str(rep.run("a*b?c+","ab"))) // True
    print("(a*b?c+,bc) -> " + str(rep.run("a*b?c+","bc"))) // True
    print("(a*b?c+,cc) -> " + str(rep.run("a*b?c+","cc"))) // True
    print("(a*b?c+,ac) -> " + str(rep.run("a*b?c+","ac"))) // True
    print("(a*b?c+,axc) -> " + str(rep.run("a*b?c+","axc"))) // True
    print("(a*b?c+,axcd) -> " + str(rep.run("a*b?c+","axcd"))) // True
    print("(a*b?c+,cx) -> " + str(rep.run("a*b?c+","cx"))) // True
    print("(a*b?c+,ax) -> " + str(rep.run("a*b?c+","ax"))) // False
    print("(a*b?c+,bx) -> " + str(rep.run("a*b?c+","bx"))) // False
}


#RegExParser

    -interface-

    run [regex, str] : bool (false)

    -machine-

    $Start
        |run| [regex, str] : bool
            reset()
            #.regex = regex 
            regex_len = len(regex)
            #.str = str 
            str_len = len(str) 
            -> $StartMatchElement ^
     
       
    $StartMatchElement
        |>|
            debugPrint("Enter $FindNextRegexElement")
            debugPrintState()
            // printRegexCurrentChar("$StartMatchElement:")

            // If the regex has been fully traversed, there is a match.
            isEndOfRegex()  ? -> $Start ^(true)  :>
            // If the string has been fully traversed, there is no match.
            isEndOfStr()    ? -> $Start ^(false) :> 
                            : -> $FindNextRegexElement :| ^

    $FindNextRegexElement

        |>|
            debugPrint("Enter $FindNextRegexElement")
            debugPrintState()
        
            var regex_char = regex[regex_pos]           
            regex_char.isalnum() ? 

                // found alphanum char

                matchRegexChar(regex_char)

                isEndOfRegex() ? 
                    // At end of regex, evaluate.
                    -> $DoCharMatch(regex_char) ^ :|
              
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

            -> $Error ^


    // Match a string of chars like 'abc'
     $DoCharMatch [regex_char]
        var re_elem_pos = 0
        |>|
            debugPrint("Enter $DoCharMatch[" + regex_char + "]")
            debugPrintState()
            matchChar(regex_char) ?
                -> $StartMatchElement ^
            :|

            resetRegexPos()
            incStrPos()
            -> $StartMatchElement ^ 

    $DoCharOptionalMatch [regex_char]
        |>|
            debugPrint("Enter $DoCharOptionalMatch[" + regex_char + "]")
            debugPrintState()
            matchChar(regex_char)
            -> $StartMatchElement ^ 

    $DoCharStarMatch [regex_char]
        |>|
            debugPrint("Enter $DoCharStarMatch[" + regex_char + "]")
            debugPrintState()
            matchChar(regex_char) ?
                -> $DoCharStarMatch(regex_char) ^
            :|

            -> $StartMatchElement ^ 

    $DoCharPlusMatch [regex_char]
        |>|
            debugPrint("Enter $DoCharPlusMatch[" + regex_char + "]")
            debugPrintState()
            matchChar(regex_char) ?
                -> $DoCharStarMatch(regex_char) ^
            :|

            resetRegexPos()
            incStrPos()
            -> $StartMatchElement ^ 

    $Error  
        |>| print("Error") ^


    -actions-

    isEndOfRegex : bool {
        ^(regex_pos >= regex_len)
    }

    matchRegexChar [regex_char] : bool {
        isEndOfRegex() ? ^(false) :|
        regex[regex_pos] == regex_char ? 
            debugPrint("matched regex char " + regex_char)
            incRegexPos()
            ^(true)
        :
             debugPrint("No regex char match: " + regex_char)           
        :|

        ^(false)
    }

    peekRegexChar [regex_char]: bool {
        isEndOfRegex() ? ^(false) :|
        ^(regex[regex_pos] == regex_char)
    }

    incRegexPos {
        regex_pos = regex_pos + 1
        isEndOfRegex() ?
            debugPrint("regex_pos = End ")
        :
            debugPrint("regex_pos = " + str(regex_pos))
        :|
    }

    printRegexCurrentChar [location] {
        isEndOfRegex() ? 
            debugPrint("End of regex") 
        :
            debugPrint(location + " Regex char = " + regex[regex_pos])
        :|
    }

    isEndOfStr : bool {
        ^(str_pos >= str_len)
    }   

    matchChar [regex_char] : bool {
        isEndOfStr() ? ^(false) :|
        str[str_pos] == regex_char ? 
            debugPrint("matched char " + regex_char)
            incStrPos()
            ^(true)
        : 
            debugPrint("No match: (re=" + regex_char + ",str=" + str[str_pos] +  ")")
        :|

        ^(false)
    }

    incStrPos {
        str_pos = str_pos + 1
    }

    resetRegexPos {
        regex_pos = 0
    }

    debugPrint[msg] {
        _debug ?! ^ :|
        print(msg)
    }

    debugPrintState {
        _debug ?! ^ :|
        var regex_char = nil 
        var str_char = nil
        isEndOfRegex() ? 
            regex_char = "End"
        :
            regex_char = regex[regex_pos] 
        :|  
        isEndOfStr() ? 
            str_char = "End"
        :
            str_char = str[str_pos] 
        :|               
        debugPrint("regex[" + str(regex_pos) + "] = " + regex_char + ",str[" + str(str_pos) + "] = " + str_char)
    }

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