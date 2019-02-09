import java.lang.System;
import timestwoJava.*;
public class timestwoMain {
    static {
        System.loadLibrary("timestwo"); // Load native library at runtime
        // timestwo.dll (Windows) or libtimestwo.so (Unixes)
    }

    // Test Driver
    public static void main(String[] args) {
        // Call initialize function to set up any necessary state
        System.out.println("Calling initialize");
        timestwo.timestwo_initialize();

        double input = 3.0;
        System.out.println("Input = " + input);

        // Call entry-point
        double result = timestwo.timestwo(input);

        System.out.println("Result = " + result);

        // Call terminate function to perform any necessary clean up
        System.out.println("Calling terminate");
        timestwo.timestwo_terminate();
    }
}
