#NumberTestSpec

    -machine-

    $NumberTest
        |start|
            getSize() ?#
                #/1|2/   -> "1|2"  $Small  :>
                #/10.0/  -> "10.0" $Medium :>
                #/100/   -> "100"  $Large  :>
            :
                -> "Sumthin' else" $OtherSize 
            :| ^

    $Small 

    $Medium

    $Large 

    $OtherSize

##