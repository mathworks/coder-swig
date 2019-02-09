public class timestwoMain {
    // Test Driver
    public static void Main(string[] args) {
        System.Console.WriteLine("Calling initialize");

        // Call initialize function to set up any necessary state
        timestwocs.timestwo_initialize();

        double input = 3.0;
        System.Console.WriteLine("Input = " + input);

        // Call entry-point
        double result = timestwocs.timestwo(input);

        System.Console.WriteLine("Result = " + result);

        // Call terminate function to perform any necessary clean up
        System.Console.WriteLine("Calling terminate");
        timestwocs.timestwo_terminate();
    }
}
