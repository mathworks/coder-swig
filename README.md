# Intro

This project collects examples of generating code from MATLAB programs
with MATLAB Coder and interfacing that generated code to various
languages like Java and C#. Each subdirectory contains a separate example with:

* MATLAB computational code
* A SWIG interface file
* MATLAB scripts to call codegen, invoke SWIG, and build the resultant
  code for each language. E.g.: `doitCsharp.m`, `doitJava.m`, etc.
* Example Java and C# tests using the generated C and SWIG code

# Requirements

This is tested with MATLAB R2018a on Ubuntu and Debian and requires:

* SWIG
* A Java JDK
* Mono command-line development tools
* C or C++ build tools

```bash
apt install swig build-essential default-jdk mono-mcs
```

