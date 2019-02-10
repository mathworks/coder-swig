public class timestwoMain {
    public static void printArray(doubleArray d, int n) {
        if (n == 0) {
            System.Console.WriteLine("Empty array");
            return;
        }
        for (int i = 0; i < n-1; i++) {
            System.Console.WriteLine(d.getitem(i) + ", ");
        }
        System.Console.WriteLine(d.getitem(n-1));

    }

    // Test Driver
    public static void Main(string[] args) {
        // Call initialize function to set up any necessary state
        System.Console.WriteLine("Calling initialize");
        timestwocs.timestwo_initialize();

        // 2-by-3 input
        int m = 2;
        int n = 3;
        int numel = m*n;
        using (doubleArray input = new doubleArray(numel))    // Input data
        using (doubleArray result = new doubleArray(numel)) { // Result data
            // Data
            for (int i = 0; i < numel; i++) {
                input.setitem(i, i);
            }
            System.Console.WriteLine("Initial data");
            timestwoMain.printArray(input, numel);

            // Call entry-point
            timestwocs.timestwo(input.cast(), result.cast());

            // Gather returned data
            timestwoMain.printArray(result, numel);

            // Call terminate function to perform any necessary clean up
            System.Console.WriteLine("Calling terminate");
            timestwocs.timestwo_terminate();
        }
    }
}
