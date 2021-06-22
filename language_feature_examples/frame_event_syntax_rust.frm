```
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(unused_mut)]
#![allow(dead_code)]
#![allow(unused_variables)]
#![allow(unused_parens)]

```

#FrameEventSyntax

    -interface-

    e1[data:String]:bool

    -machine-

    $S0


        @|e1|[data:String]:bool
            var this_event_msg:&FrameEvent = @
            var message_name:String = @||
            var message_param:String = @[data]
            @^ = true

            print(message_name)
            print(message_param)
            print_bool(@^)

            ^

    $S1[event:FrameEvent msg:string param:object ret:object]
        |>|
            --- print_parts(event msg param ret)
            -> $S0 ^

    -actions-

    print[msg:&String] {`
        println!("{}", &format!("{}",msg));
    `}
##

```
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(unused_mut)]
#![allow(dead_code)]
#![allow(unused_variables)]
#![allow(unused_parens)]

```

#FrameEventSyntax

    -interface-

    e1[data:String]:bool

    -machine-

    $S0

        @|e1|[data:String]:bool

            @^ = true


            print_bool(@^)

            ^

    -actions-

    print[msg:&String] {`
        println!("{}", &format!("{}",msg));
    `}

    print_bool[b:bool] {`
        println!("{}", &format!("{}",b.to_string()));
    `}


##

```
#![allow(non_snake_case)]
#![allow(non_camel_case_types)]
#![allow(unused_mut)]
#![allow(dead_code)]
#![allow(unused_variables)]
#![allow(unused_parens)]

```

#FrameEventSyntax

    -interface-

    e1[data:String]:bool

    -machine-

    $S0


        @|e1|[data:String]:bool
            var this_event_msg:&FrameEvent = @
            var message_name:String = @||
            var message_param:String = @[data]
            @^ = true

            print(&message_name)
            print(&message_param)
            print_bool(@^)

            ^


    -actions-

    print[msg:&String] {`
        println!("{}", &format!("{}",msg));
    `}


    print_bool[b:bool] {`
        println!("{}", &format!("{}",b.to_string()));
    `}
##