% Driver script to show codegen, SWIG, and Python
cfg = coder.config('dll');
cfg.PostCodeGenCommand = 'pythonhook';

% For Python SWIG this must be named _<module> so _timestwo
codegen timestwo -args coder.typeof(1,[Inf,Inf]) -config cfg -o _timestwo.so

% Copy module library to Python folder so that code can find it
copyfile codegen/dll/timestwo/_timestwo.so timestwoPython/

% Run test program
disp(checkedSystem('python timestwoMain.py'));