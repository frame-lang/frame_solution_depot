#EchoSpec 

    -interface-

    echo[msg:String] : String 

    -machine-

    $WhatSay 
        |echo| [msg:String] : String
            ^(msg)
##
