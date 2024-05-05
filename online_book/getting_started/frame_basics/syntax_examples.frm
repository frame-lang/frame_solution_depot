// https://docs.frame-lang.org/en/latest/getting_started/basics.html

// NOTE: This program doesn't run, just validates syntax examples. 

fn main [sys_arg1, sys_arg2] : int {

    // this is a single line comment

    // Superstrings

    var foo:`&[**]!` = `%#@!$%`

    ```
    Block of arbitrary
    content in the target language
    ```

    var x = 0
    var name:String = "Spock"

    // var <name>:<`type`> = <intializer_expr>
    var array:`[4][2]int` =  `[4][2]int{{10, 11}, {20, 21}, {30, 31}, {40, 41}}`

    print(sys_arg1 + "," + sys_arg2)
    ^(0)


}