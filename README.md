# Intro
[![View coder-swig on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/69305-coder-swig)

This project collects examples of using MATLAB Coder to generate C
code and bringing into another language. The languages shown here are
C#, Java, and Python. [SWIG](http://www.swig.org/), a software
development tool that connects programs written in C and C++ with a
variety of high-level programming languages, is used to perform this
interfacing.

Each subdirectory contains a separate example with:

* MATLAB computational code
* A SWIG interface file
* MATLAB scripts to call codegen, invoke SWIG, and build the resultant
  code for each language. E.g.: `doitCsharp.m`, `doitJava.m`,
  `doitPython.m`, etc.
* Example C#, Java, and Python main functions using the generated C
  and SWIG code

# Getting started

There are a set of beginning examples based on a simple `timestwo`
function that are a good starting point. Follow them in numeric order
to see progressively increasing complexity.

* **01-timestwo-scalar**: Simple scalar input, scalar output example
  that multiplies the input by 2
* **02-timestwo-fixed-size**: Element-wise multiplication by 2 with
  fixed size matrix input/output
* **03-timestwo-dynamic-size**: Element-wise multiplication by 2 with
  variable size, dynamically allocated input/output

# Recipe for using MATLAB Coder and SWIG

1. Generate code using MATLAB Coder.
1. Inspect the generated interface header `foo.h` to see the signature
   of the generated code.
1. Construct your SWIG interface file. For scalar inputs/outputs, this
   file will be trivial, just referencing necessary generated API
   headers like
   [01-timestwo-scalar/timestwo.i](01-timestwo-scalar/timestwo.i). For
   more complicated interfaces with variable size inputs, `structs`,
   etc. the interface file will be more complex like
   [03-timestwo-dynamic-size/timestwo.i](03-timestwo-dynamic-size/timestwo.i). Include
   declarations for the `emxArray` types used in the generated code
   interface.

   In all of the non-scalar examples the SWIG
   [carrays.i](http://www.swig.org/Doc1.3/Library.html#Library_carrays)
   interface to wrap array data efficiently without copies. For a more
   idiomatic interface see other options that SWIG provides.
1. To run SWIG and compile the generated code and SWIG wrapper during
   the MATLAB Coder build process, construct your Coder build hook
   (e.g. [csharphook.m](03-timestwo-dynamic-size/csharphook.m)). You
   can also compile the SWIG wrapper outside of MATLAB Coder.
1. Set that as the Coder `PostCodeGenCommand`: `cfg =
   coder.config('dll'); cfg.PostCodeGenCommand = 'csharphook';`

# Requirements

This is tested with MATLAB R2018a on Ubuntu and Debian and requires:

* SWIG
* A Java JDK
* Mono command-line development tools
* Python development headers, libraries, and tools
* C or C++ build tools

```bash
apt install swig build-essential default-jdk mono-mcs python2.7-dev python-dev
```
