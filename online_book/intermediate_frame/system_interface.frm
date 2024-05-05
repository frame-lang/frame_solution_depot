// https://docs.frame-lang.org/en/latest/intermediate_frame/systems.html#system-factory

#SystemInterface

    -interface-

    simple_method                           // no params, no return type
    method_untyped_params [p1,p2]           // untyped params, no return type
    method_superstring_params [p1:`[]int`]  // superstring param type, no return type
    method_typed_params [p1:T1,p2:T2]       // typed parameters, no return type
    method_params_ret [p1:T1,p2:T2] : T3    // typed parameters, has return type
    method_superstring_ret : `[]int`        // no parameters, superstring return type
    method_alias [p1,p2:T2] : T3            // mixed parameter types, has return type


##