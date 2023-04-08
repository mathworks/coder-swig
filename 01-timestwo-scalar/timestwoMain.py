def main():
    "Main function to test timestwo generated code"
    from timestwoPython import timestwo

    # Call initialize function to set up any necessary state
    print("Calling initialize")
    timestwo.timestwo_initialize()
    input = 3.0;
    print("Input = {0:g}".format(input))

    #Call entry-point
    result = timestwo.timestwo(input)

    print("Result = {0:g}".format(result))

    # Call terminate function to perform any necessary clean up
    print("Calling terminate")
    timestwo.timestwo_terminate()

if __name__ == "__main__":
    main()
