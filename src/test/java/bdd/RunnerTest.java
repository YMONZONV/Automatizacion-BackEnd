package bdd;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;


public class RunnerTest {
    @Test
    Karate testSample(){
        return Karate.run("classpath:bdd/api_serverest/Post_Usuarios.feature")
                .tags("@PostUsuariosOK")
                .relativeTo(getClass());
    }
}
