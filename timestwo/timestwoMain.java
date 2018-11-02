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
      System.out.println("Calling initialize");
      timestwo.timestwo_initialize();
      
      // 2-by-3 input
      int m = 2;
      int n = 3;
      intArray dims = new intArray(2);
      dims.setitem(0, m);
      dims.setitem(1, n);
      
      // Data
      int numel = m*n;
      doubleArray data = new doubleArray(6);
      for (int i = 0; i < numel; i++) {
          data.setitem(i,i);
      }
      System.out.println("Initial data");
      timestwoMain.printArray(data,numel);
      // Create input
      emxArray_real_T x = timestwo.emxCreateWrapper_real_T(data.cast(),m,n);
      
      // Create output
      emxArray_real_T y = timestwo.emxCreate_real_T(0,0);
      
      // Call entry-point
      timestwo.timestwo(x,y);
      
      // Gather returned data
      doubleArray output = doubleArray.frompointer(y.getData());
      int outputND = y.getNumDimensions();
      intArray outputSize = intArray.frompointer(y.getSize());
      int outputNumel = 1;
      for (int dim = 0; dim < outputND; dim++) {
          outputNumel *= outputSize.getitem(dim);
      }
      timestwoMain.printArray(output,outputNumel);
      System.out.println("Calling terminate");
      timestwo.timestwo_terminate();

      // No need to clean up as destructors are automatically called
   }
}
