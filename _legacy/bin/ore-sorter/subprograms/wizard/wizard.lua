local app  = require('umfal')('ore-sorter');
local term = require('term');
local cli  = app.utils.cli;
local steps = app.subprograms.wizard.steps;

return function(args, ops, context)
  local shouldContinue;
  
  -- Step 0; Intro
  shouldContinue = steps.intro.commenceStep();
  if not shouldContinue then return end;
  -- Step 1; Mapping the setup
  shouldContinue = steps.mapping.commenceStep();
  if not shouldContinue then return end;
end