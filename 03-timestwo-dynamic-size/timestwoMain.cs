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

        using (intArray dims = new intArray(2)) // Size vector
        using (doubleArray data = new doubleArray(6)) // Data
        using (emxArray_real_T x = timestwocs.emxCreateWrapper_real_T(data.cast(),m,n)) // Input
        using (emxArray_real_T y = timestwocs.emxCreate_real_T(0,0)) {  // Output
            // 2-by-3 input
            dims.setitem(0, m);
            dims.setitem(1, n);

            // Data
            int numel = m*n;
            for (int i = 0; i < numel; i++) {
                data.setitem(i,i);
            }
            System.Console.WriteLine("Initial data");
            timestwoMain.printArray(data,numel);
            // Call entry-point
            timestwocs.timestwo(x,y);

            // Gather returned data
            doubleArray output = doubleArray.frompointer(y.data);
            int outputND = y.numDimensions;
            intArray outputSize = intArray.frompointer(y.size);
            int outputNumel = 1;
            for (int dim = 0; dim < outputND; dim++) {
                outputNumel *= outputSize.getitem(dim);
            }
            timestwoMain.printArray(output,outputNumel);

            // Call terminate function to perform any necessary clean up
            System.Console.WriteLine("Calling terminate");
            timestwocs.timestwo_terminate();

            // No need to clean up emxArray variables as destructors are
            // automatically called and have the call to emxDestroy_real_T
            // injected in them
        }
    }
}
