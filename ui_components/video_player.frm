
--- A talk by Netflix engineer on the benefits of state machine solutions

--- see talk video: https://www.youtube.com/watch?v=I1Mzx_tSpew
--- see Frame solution: https://framepiler.frame-lang.org/gist/aHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vZnJhbWUtbGFuZy9kYmU5ZWMwYTJlZDg3ODNhMjg3YzlmMTU2MDlkMjUwOQ==
--- get Frame: http://framepiler.frame-lang.org
--- more Frame solutions: https://github.com/frame-lang/frame_solution_depot

#VideoPlayer

    -machine-

    $Stopped
        |play| -> $Playing ^

    $Playing => $Stoppable  
        |>| startPlaying() ^
        |<| stopPlaying() ^
        |pause| -> $Paused ^
        |rewind| -> $Rewinding ^

    $Paused => $Stoppable
        |>| pause() ^
        |play| -> $Playing ^
        |rewind| -> $Rewinding ^

    $Rewinding => $Stoppable
        |>| rewind() ^
        |<| stopRewinding() ^
        |play| -> $Playing ^
        |pause| -> $Paused ^

    $Stoppable 
        |stop| -> $Stopped ^

##