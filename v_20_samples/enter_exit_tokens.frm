system EnterExit {

    machine:

        $Start {


            // v0.20: $> token for enter
            $>() {
                print("Started") 
                return 5
            }

            // v0.20: $> token for exit
            <$() {

            }
        }

}
