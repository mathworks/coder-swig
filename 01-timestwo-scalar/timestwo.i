%module timestwo

/* Generate includes for required headers */
%{
#include "codegen/dll/timestwo/timestwo_types.h"
#include "codegen/dll/timestwo/timestwo.h"
#include "codegen/dll/timestwo/timestwo_initialize.h"
#include "codegen/dll/timestwo/timestwo_terminate.h"
%}

/* Parse necessary headers */
%include codegen/dll/timestwo/timestwo_types.h
%include codegen/dll/timestwo/timestwo.h
%include codegen/dll/timestwo/timestwo_initialize.h
%include codegen/dll/timestwo/timestwo_terminate.h
