%module timestwo
%include "carrays.i"
%array_class(double, doubleArray);
%array_class(int, intArray);

/* Generate includes for required headers */
%{
#include "codegen/dll/timestwo/timestwo_types.h"
#include "codegen/dll/timestwo/timestwo.h"
#include "codegen/dll/timestwo/timestwo_emxAPI.h"
#include "codegen/dll/timestwo/timestwo_initialize.h"
#include "codegen/dll/timestwo/timestwo_terminate.h"
%}

/* Tell SWIG about allocators */
%newobject emxCreate_real_T;
%newobject emxCreateWrapper_real_T;
%newobject emxCreateND_real_T;
%newobject emxCreateWrapperND_real_T;

/* Parse necessary headers */
%include codegen/dll/timestwo/timestwo_types.h
%include codegen/dll/timestwo/timestwo.h
%include codegen/dll/timestwo/timestwo_emxAPI.h
%include codegen/dll/timestwo/timestwo_initialize.h
%include codegen/dll/timestwo/timestwo_terminate.h

/* Destructor for emxArray_real_T  */
%extend emxArray_real_T {
    ~emxArray_real_T() {
        emxDestroyArray_real_T($self);
    }
}
