% Generate C# SWIG wrappers, set up JNI include paths, and include
% wrapper C code in Coder build. Designed to be used as a post codegen
% command:
%
%  cfg = coder.config('dll');
%  cfg.PostCodeGenCommand = 'csharphook';
%  codegen -config cfg ...

% Call SWIG to generate wrappers
d = 'timestwoCsharp';
if exist(d,'dir')
    rmdir(d,'s');
end
mkdir(d);
checkedSystem(['swig -dllimport codegen/dll/timestwo/libtimestwo.so ' ...
               '-module timestwocs -csharp -outdir timestwoCsharp ' ...
               '-o timestwoCsharp/timestwo_wrap.c timestwo.i'])

buildInfo.addSourceFiles('timestwo_wrap.c',fullfile(pwd,'timestwoCsharp'));

% Build C#
checkedSystem('mcs timestwoMain.cs timestwoCsharp/*.cs')
