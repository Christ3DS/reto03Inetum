package karate;

import com.intuit.karate.junit5.Karate;

public class UserRunner {

    @Karate.Test
    Karate testTodo(){

        return Karate.run("classpath:functional/features/user");
    }
}
