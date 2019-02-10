# Description
Shows a simple timestwo elementwise multiplication example. This
example shows how generated emxArray types can be used from C# and
Java. Run `doitCsharp` and `doitJava` to see the C# and Java examples,
respectively.

You should see output similar to:

**C#**
```
>> doitCsharp
Evaluating command

    ./timestwoMain.exe

produced output:

Calling initialize
Initial data
0,
1,
2,
3,
4,
5
Generated code from MATLAB fprintf: Entering timestwo
Generated code from MATLAB fprintf: Exiting timestwo
0,
2,
4,
6,
8,
10
Calling terminate
```

**Java**
```
>> doitJava
Evaluating command

    java -Djava.library.path=codegen/dll/timestwo/ -classpath .:timestwoJava timestwoMain

produced output:

Calling initialize
Initial data
0.0,
1.0,
2.0,
3.0,
4.0,
5.0
Generated code from MATLAB fprintf: Entering timestwo
Generated code from MATLAB fprintf: Exiting timestwo
0.0,
2.0,
4.0,
6.0,
8.0,
10.0
Calling terminate
```
