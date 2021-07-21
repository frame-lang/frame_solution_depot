
#StringTestSpec

    -interface-

    showRole[name:String]

    -machine-

    $RockGroupTest
        |showRole|[name:String]
            name ?~
                /Mick Jagger/    -> "The Mick" $Singer :>
                /Keith Richards/  -> "Keith"  $Guitarist :>
                /Charlie Watts/     -> "Charlie" $Drummer 
            :
                -> "Others" $OtherStones 
            :: ^

    $Singer 
        |>| print("Singer") -> $RockGroupTest ^

    $Guitarist
       |>| print("Guitarist") -> $RockGroupTest ^

    $Drummer 
       |>| print("Drummer") -> $RockGroupTest ^

    $OtherStones
       |>| print("OtherStones") -> $RockGroupTest ^
    
    -actions-

    print[msg:String]
##

