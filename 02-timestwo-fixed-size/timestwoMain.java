import java.lang.System;
import timestwoJava.*;
public class timestwoMain {
    static {
        System.loadLibrary("timestwo"); // Load native library at runtime
        // timestwo.dll (Windows) or libtimestwo.so (Unixes)
    }

    public static void printArray(doubleArray d, int n) {
        if (n == 0) {
            System.out.println("Empty array");
            return;
        }
        for (int i = 0; i < n-1; i++) {
            System.out.println(d.getitem(i) + ", ");
        }
        System.out.println(d.getitem(n-1));

    }

    // Test Driver
    public static void main(String[] args) {
        // Call initialize function to set up any necessary state
        System.out.println("Calling initialize");
        timestwo.timestwo_initialize();

        // 2-by-3 input
        int m = 2;
        int n = 3;
        int numel = m*n;

        // Input data
        doubleArray input = new doubleArray(numel);
        for (int i = 0; i < numel; i++) {
            input.setitem(i,i);
        }
        System.out.println("Initial data");
        timestwoMain.printArray(input, numel);

        // Result data
        doubleArray result = new doubleArray(numel);

        // Call entry-point
        timestwo.timestwo(input.cast(), result.cast());

        // Gather returned data
        timestwoMain.printArray(result, numel);

        // Call terminate function to perform any necessary clean up
        System.out.println("Calling terminate");
        timestwo.timestwo_terminate();
    }
}
