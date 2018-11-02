% Driver script to show codegen, SWIG, and C#
cfg = coder.config('dll');
cfg.PostCodeGenCommand = 'csharphook';

codegen timestwo -args coder.typeof(1,[Inf,Inf]) -config cfg -o libtimestwo.so

% Run test program
disp(checkedSystem('./timestwoMain.exe'))
