local app, module = require('umfal')('ore-sorter');
local cli  = app.utils.cli;
local tr   = app.items.transposers;

local function showStepStartScreen()
  local allTransposers = tr.getAllTransposers();
  
  cli.clear();
  cli.printBanner('STEP 1: MAPPING THE SETUP');
  print('At this step, an internal "map" will be');
  print('created to allow the system to route');
  print('items between inventories');
  print('');
  print('To continue, put a single item in the first slot');
  print('of the buffer that serve as input, then proceed');
  print('')
  print('Other connected inventories should be EMPTY');

  if not cli.getConfirmationOrExit('Proceed?', true) then
    cli.fancyExit(false);
    return false;
  end

  return true;
end

local function ensureHasTransposersConnected()
  local transposers = tr.getAllTransposers();

  while #transposers == 0 do
    cli.clear();
    cli.printBanner('ERROR: NO TRANSPOSERS FOUND');
    print('Computer has no transposers connected!');
    print('');
    print('Make sure that transposers are either');
    print('adjacent to a computer, or connected')
    print('to it via cable, then proceed')

    if not cli.getConfirmationOrExit('Try to reconnect transposers?', true) then
      cli.fancyExit(false);
      return false;
    end

    transposers = tr.getAllTransposers();
  end

  return true;
end


local function showTooManyItemsError()
  cli.clear();
  cli.printBanner('ERROR: TOO MANY ITEMS');
  print('One of the connected inventories has');
  print('too many items in it');
  print('');
  print('Remove all the items except for one');
  print('in the input buffer, then proceed');

  if not cli.getConfirmationOrExit('Retry?', true) then
    cli.fancyExit(false);
    return false;
  end  
end

local function showTooManyInventoriesError()
  cli.clear();
  cli.printBanner('ERROR: TOO MANY INVENTORIES');
  print('There are more than one inventory');
  print('with items in them');
  print('');
  print('Remove all the items except for one');
  print('in the input buffer, then proceed');

  if not cli.getConfirmationOrExit('Retry?', true) then
    cli.fancyExit(false);
    return false;
  end
end

module.commenceStep = function()
  local shouldContinue;

  shouldContinue = showStepStartScreen();
  if not shouldContinue then return false end;

  shouldContinue = ensureHasTransposersConnected();
  if not shouldContinue then return false end;
end