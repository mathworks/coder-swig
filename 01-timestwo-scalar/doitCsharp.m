% Driver script to show codegen, SWIG, and C#
cfg = coder.config('dll');
cfg.PostCodeGenCommand = 'csharphook';

codegen timestwo -args 1 -config cfg -o libtimestwo.so

% Run test program
disp(checkedSystem('./timestwoMain.exe'))
