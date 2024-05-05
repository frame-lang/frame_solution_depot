// https://docs.frame-lang.org/en/latest/intermediate_frame/transitions.html#id19

#TransitionLabels

    -interface-

    click

    -machine-

    $Start
        |click| -> $One ^

    $One
        |click| -> "Second Click" $Two ^

    $Two
        |click| -> ("three") "Third\nClick" $Done ^

    $Done
        |>| [click_count]
            print("Done in " + click_count + " clicks.") ^
##