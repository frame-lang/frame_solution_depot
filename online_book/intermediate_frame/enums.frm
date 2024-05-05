// https://docs.frame-lang.org/en/latest/intermediate_frame/enums.html#id8

`from enum import Enum`
`import random`

fn main {
    var grocery:# = #Grocery()
    print("We are selling " + grocery.getFruitOfTheDay() + " today.")
    print("We sold " + grocery.getFruitOfTheDay() + " yesterday.")
    print("We are selling " + grocery.getFruitOfTheDay() + " tomorrow.")
}

#Grocery

    -interface-

    getFruitOfTheDay : String

    -machine-

    $Start
        |getFruitOfTheDay| : String

            var f:Fruit = getFruitOfTheDay()

            // Demonstrate boolean tests for enums

            f == Fruit.Peach  ? print("Found a Peach.")  :>
            Fruit.Pear == f   ? print("Found a Pear.")   :>
            f == Fruit.Banana ? print("Found a Banana.") :|

            // Demonstrate enum matching

            f ?:(Fruit)
                :/Peach/   ^("Peaches") :>
                :/Pear/    ^("Pears")   :>
                :/Banana/  ^("Bananas") :|

            ^("None")

    -actions-

    getFruitOfTheDay : Fruit {
        var val = random.randint(1, 3)

        val ?#
            #/1/ ^(Fruit.Peach)  :>
            #/2/ ^(Fruit.Pear)   :>
            #/3/ ^(Fruit.Banana) :|
    }

    -domain-

    enum Fruit {
        Peach
        Pear
        Banana
    }
##