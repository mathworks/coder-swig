# Description
Shows a simple timestwo scalar multiplication example. This example
shows how to call generated code taking and returning scalar doubles
can be used from C# and Java. Run `doitCsharp` and `doitJava` to see
the C# and Java examples, respectively.

You should see output similar to:

```
>> doitJava
Evaluating command

    java -Djava.library.path=codegen/dll/timestwo/ -classpath .:timestwoJava timestwoMain

produced output:

Calling initialize
Input = 3.0
Generated code from MATLAB fprintf: Entering timestwo
Generated code from MATLAB fprintf: Exiting timestwo
Result = 6.0
Calling terminate

>> doitCsharp
Evaluating command

    ./timestwoMain.exe

produced output:

Calling initialize
Input = 3
Generated code from MATLAB fprintf: Entering timestwo
Generated code from MATLAB fprintf: Exiting timestwo
Result = 6
Calling terminate
```
