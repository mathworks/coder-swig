% Driver script to show codegen, SWIG, and Java
cfg = coder.config('dll');
cfg.PostCodeGenCommand = 'javahook';

codegen timestwo -args coder.typeof(1,[Inf,Inf]) -config cfg -o libtimestwo.so

% Run test program
disp(checkedSystem(['java -Djava.library.path=codegen/dll/timestwo/ ' ...
                    '-classpath .:timestwoJava timestwoMain']));