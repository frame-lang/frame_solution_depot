#Figure2

    -machine-

    // Dispatch any unhandled events to $D
    $A => $D
        |c| -> $C ^

    // Dispatch any unhandled events to $D
    $C => $D

    $D 
        |b| -> $B ^ 
        
    $B 
        |a| -> $A ^
        |c| -> $C ^

##