% Generate Python SWIG wrappers and include wrapper C code in Coder
% build. Designed to be used as a post codegen command:
%
%  cfg = coder.config('dll');
%  cfg.PostCodeGenCommand = 'pythonhook';
%  codegen -config cfg ...

% Call SWIG to generate wrappers
d = 'timestwoPython';
if exist(d,'dir')
    rmdir(d,'s');
end
mkdir(d);
checkedSystem(['swig -module timestwo -python -outdir timestwoPython ' ...
               '-o timestwoPython/timestwo_wrap.c timestwo.i'])

buildInfo.addSourceFiles('timestwo_wrap.c',fullfile(pwd, 'timestwoPython'));

% Update this to match your Python installation by querying python-config:
%
% $ python-config --includes
% -I/usr/include/python2.7 -I/usr/include/x86_64-linux-gnu/python2.7
buildInfo.addIncludePaths({'/usr/include/python2.7', '/usr/include/x86_64-linux-gnu/python2.7'});

% For libraries
%
% $ python-config --ldflags
% -L/usr/lib/python2.7/config-x86_64-linux-gnu -L/usr/lib -lpython2.7 -lpthread -ldl  -lutil -lm  -Xlinker -export-dynamic -Wl,-O1 -Wl,-Bsymbolic-functions
libPriority = '';
libPreCompiled = true;
libLinkOnly = true;
libName = 'libpython2.7.so';
libPath = '/usr/lib/python2.7/config-x86_64-linux-gnu';
buildInfo.addLinkObjects(libName, libPath, ...
                         libPriority, libPreCompiled, libLinkOnly);