fn main {

    print("\n")
    print("Individual Equality Tests Demo") 
    print("------------------------------")
    print("")
    print("y|")
    print("--")
    loop var y = 0; y <= 5; y = y + 1 {
        prefix = str(y) + "| "
        y == 0 ? print(prefix + "y == 0") :|
        y == 1 ? print(prefix + "y == 1") :|
        y <  2 ? print(prefix + "y <  2") :|
        y >= 3  && y < 4 ? print(prefix + "y >= 3  && y < 4") :|
    }

    print("\n")
    print("Test-Else-Continue Equality Tests Demo") 
    print("------------------------------")
    print("")
    print("y|")
    print("--")
    loop var y = 0; y <= 5; y = y + 1 {
        prefix = str(y) + "| "
        y == 0 ? print(prefix + "y == 0") :>
        y == 1 ? print(prefix + "y == 1") :>
        y <  2 ? print(prefix + "y <  2") :>
        y >= 3  && y < 4 ? print(prefix + "y >= 3  && y < 4") :
                        print(prefix + "No match") :|
    }
}