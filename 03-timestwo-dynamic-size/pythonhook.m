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

% Treat timestwoPython as a package
!touch timestwoPython/__init__.py

checkedSystem(['swig -module timestwo -python -outdir timestwoPython ' ...
               '-o timestwoPython/timestwo_wrap.c timestwo.i'])

buildInfo.addSourceFiles('timestwo_wrap.c',fullfile(pwd, 'timestwoPython'));

% Update this to match your Python installation by querying python3-config:
%
% $ python3-config --includes
% -I/usr/include/python3.9 -I/usr/include/python3.9
buildInfo.addIncludePaths({'/usr/include/python3.9', '/usr/include/python3.9'})

% For libraries
%
% $ python-config --ldflags
% -L/usr/lib/python3.9/config-3.9-x86_64-linux-gnu -L/usr/lib  -lcrypt -lpthread -ldl  -lutil -lm -lm
libPriority = '';
libPreCompiled = true;
libLinkOnly = true;
libName = 'libpython3.9.so';
libPath = '/usr/lib/python3.9/config-3.9-x86_64-linux-gnu';
buildInfo.addLinkObjects(libName, libPath, ...
                         libPriority, libPreCompiled, libLinkOnly);
