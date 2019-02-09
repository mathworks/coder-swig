% Driver script to show codegen, SWIG, and Java
cfg = coder.config('dll');
cfg.PostCodeGenCommand = 'javahook';

codegen timestwo -args 1 -config cfg -o libtimestwo.so

% Run test program
disp(checkedSystem(['java -Djava.library.path=codegen/dll/timestwo/ ' ...
                    '-classpath .:timestwoJava timestwoMain']));