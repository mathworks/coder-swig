% Generate Java SWIG wrappers, set up JNI include paths, and include
% wrapper C code in Coder build. Designed to be used as a post codegen
% command:
%
%  cfg = coder.config('dll');
%  cfg.PostCodeGenCommand = 'javahook';
%  codegen -config cfg ...

% Call SWIG to generate wrappers
d = 'timestwoJava';
if exist(d,'dir')
    rmdir(d,'s');
end
mkdir(d);
checkedSystem('swig -java -package timestwoJava -outdir timestwoJava -o timestwoJava/timestwo_wrap.c timestwo.i')

% Add JNI includes and wrapper C file. Update this to point to your
% Java installation
if exist('/usr/lib/jvm/java-8-openjdk-amd64','dir')
    d = '/usr/lib/jvm/java-8-openjdk-amd64';
else
    d = '/usr/lib/jvm/java-11-openjdk-amd64';
end
buildInfo.addIncludePaths({fullfile(d,'include'), ...
                    fullfile(d,'include','linux')});
buildInfo.addSourceFiles('timestwo_wrap.c',fullfile(pwd,'timestwoJava'));

% Build Java
checkedSystem('javac timestwoJava/*.java')
checkedSystem('javac timestwoMain.java')
