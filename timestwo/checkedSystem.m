function output = checkedSystem(cmd)
% Call system(cmd) and verify successful completion reporting
% errors if any
[status,msg] = system(cmd);
msg = sprintf(['Evaluating ' ...
               'command\n\n    %s\n\nproduced output:\n\n%s\n'], ...
              cmd, strip(msg));
assert(status == 0, 'CoderSwig:System:Failure',msg);
if nargout > 0
    output = msg;
end