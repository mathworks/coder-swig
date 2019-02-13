def main():
    "Main function to test timestwo generated code"
    from timestwoPython import timestwo

    # Call initialize function to set up any necessary state
    print "Calling initialize"
    timestwo.timestwo_initialize();
    m = 2
    n = 3
    numel = m*n

    # Input date
    input = timestwo.doubleArray(numel)
    for i in range(0,numel):
        input[i] = i

    print "Initial data"
    print_array(input, numel)

    # Result data
    result = timestwo.doubleArray(numel)

    #Call entry-point
    timestwo.timestwo(input.cast(), result.cast());

    # Gather returned data
    print_array(result, numel)

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
