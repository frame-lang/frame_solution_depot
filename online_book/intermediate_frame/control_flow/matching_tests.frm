// https://docs.frame-lang.org/en/latest/intermediate_frame/control_flow.html#matching-tests

fn main {

    // Basic string matches.  
    letter ?~
        ~/a|e|i|o|u/    vowel(letter)     :>
        ~/y/            notSure(letter)   :>
        :               consonant(letter) :|


    food ?~
        ~/Pea|Potato/     logFoodKind("Vegetable")  :>
        ~/Apple|Bananna/  logFoodKind("Fruit")      :>
        ~/Kansas|City/    logFoodKind("Not a food") :>
        :                 logFoodKind("Not sure")   :|

    // Empty and Null string matches.

    name ?~
        ~/Alice|Bob/    log("person")       :>
        ~//             log("empty string") :>
        !//             log("null")         :>
        :               log("unknown")      :|

    // Number matching.
    number ?#
        #/1|2/        log("small")      :>
        #/3|4/        log("medium")     :>
        #/5|6/        log("large")      :>
        #/1.2|7.1/    log("mixed")      :>
        :             log("unknown")    :|

}

// Currently enum types are only declared in a system.

#DaysSystem

    -actions-

    test {
        // Enum matching.
        today ?:(Day)
            :/Monday/                       print("I don't like today") :>
            :/Tuesday|Wednesday|Thursday/   print("Not great either.")  :>
            :/Friday/                       print("Pretty good day")    :>
            :    
                                            print("Yea!")               :|  
    }

    -domain-

    enum Day {
        Sunday
        Monday
        Tuesday
        Wednesday
        Thursday
        Friday
        Saturday
        Sunday
    }

##