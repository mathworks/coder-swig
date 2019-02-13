# Description
Shows a simple timestwo elementwise multiplication example with a
fixed size 2x3 input. This example shows how generated C array types
can be used from C#, Java, and Python. Run `doitCsharp`, `doitJava`,
and `doitPython` to see the C#, Java, and Python examples,
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

**Python**
```
>> doitPython
Evaluating command

    python timestwoMain.py

produced output:

Calling initialize
Initial data
0,
1,
2,
3,
4,
5,
Generated code from MATLAB fprintf: Entering timestwo
Generated code from MATLAB fprintf: Exiting timestwo
0,
2,
4,
6,
8,
10,
Calling terminate
```
