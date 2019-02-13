def main():
    "Main function to test timestwo generated code"
    from timestwoPython import timestwo

    # Call initialize function to set up any necessary state
    print "Calling initialize"
    timestwo.timestwo_initialize();
    m = 2
    n = 3
    dims = timestwo.intArray(2);
    dims[0] = m;
    dims[1] = n;

    numel = m*n

    # Input data
    input = timestwo.doubleArray(numel)
    for i in range(0,numel):
        input[i] = i

    print "Initial data"
    print_array(input, numel)

    # Construct input emxArray
    x = timestwo.emxCreateWrapper_real_T(input.cast(), m, n)

    # Construct output emxArray
    y = timestwo.emxCreate_real_T(0, 0)

    # Call entry-point
    timestwo.timestwo(x, y)

    # Gather returned data
    output = timestwo.doubleArray.frompointer(y.data)
    outputND = y.numDimensions
    outputSize = timestwo.intArray.frompointer(y.size)
    outputNumel = 1
    for dim in range(0, outputND):
        outputNumel *= outputSize[dim];

    print_array(output, outputNumel)

    # Call terminate function to perform any necessary clean up
    print "Calling terminate"
    timestwo.timestwo_terminate();

def print_array(d, n):
    "Print out values in a doubleArray"
    if n == 0:
        print "Empty array"
        return
    for i in range(0,n-1):
        print "{0:g},".format(d[i])
    print "{0:g},".format(d[n-1])

if __name__ == "__main__":
    main()
