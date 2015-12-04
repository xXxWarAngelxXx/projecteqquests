-- 10th Ring War
-- Great Divide
-- 118167 Zrelik the Scout
--
-- When Event Starts:
-- - Zone Depops
-- - Extra Dwarf Defenders spawn to guard TODO: make these dwarves 
--   Player controalable.
-- - 13 waves of mobs will spawn in succession; each wave will have 
--   a wave master (Captain, General, Warlord) when the wave master 
--   dies; it will start a timer (5min) before the next wave spawns
-- - 14th wave is just Narandi.
-- - There are three locations in which the giants will spawn and
--   start pathing twards Thurgadin.
--
-- Fail Conditions:
-- - Any Giant reaches the final waypoint of their pathing (which is 
--   near Thurgain).
-- - Seneschal Aldikan dies
--

local current_wave_number;

-- This variable controls the time between waves; currently 5min.
local wave_cooldown_time = 5 * 60 * 1000;

function Stop_Event()
  -- Condition 1 is the general mobs in the zone
  eq.spawn_condition("greatdivide", 0, 1, 1);
  eq.spawn_condition("greatdivide", 0, 2, 0);
  eq.spawn_condition("greatdivide", 0, 3, 0);
  eq.spawn_condition("greatdivide", 0, 4, 0);
  eq.spawn_condition("greatdivide", 0, 5, 0);
  eq.spawn_condition("greatdivide", 0, 6, 0);
  eq.spawn_condition("greatdivide", 0, 7, 0);
  eq.spawn_condition("greatdivide", 0, 8, 0);
  eq.spawn_condition("greatdivide", 0, 9, 0);
  eq.spawn_condition("greatdivide", 0, 10, 0);
  eq.spawn_condition("greatdivide", 0, 11, 0);
  eq.spawn_condition("greatdivide", 0, 12, 0);
  eq.spawn_condition("greatdivide", 0, 13, 0);
  eq.spawn_condition("greatdivide", 0, 14, 0);
  eq.spawn_condition("greatdivide", 0, 15, 0);
  eq.spawn_condition("greatdivide", 0, 16, 0);
  eq.spawn_condition("greatdivide", 0, 17, 0);
  eq.spawn_condition("greatdivide", 0, 18, 0);
  eq.spawn_condition("greatdivide", 0, 19, 0);
  eq.spawn_condition("greatdivide", 0, 20, 0);
  eq.spawn_condition("greatdivide", 0, 21, 0);
end

function Ten_Start(e)
  -- The first spawn condition to work with is 3; so 
  -- if we reset the event; we need to reset this to 3
  current_spawn_condition = 3;

  -- Reset all the spawn conditions to a clean state.
  Stop_Event();

end

function Zrelik_Say(e)
  if (e.other:Admin() >= 80 and e.other:GetGM()) then
    if (e.message:findi('end')) then
      Stop_Event();

      eq.depop_all(118169);
      eq.depop_all(118171);
      eq.depop_all(118172);
      eq.depop_all(118170);
      eq.depop_all(118168);

    elseif (e.message:findi('start')) then
      eq.zone_emote(13, "and so it begins...");
      eq.spawn_condition("greatdivide", 0, 1, 0);
      eq.spawn_condition("greatdivide", 0, 2, 1);

      -- Signal the ringtemmaster to spawn the first wave...
      eq.signal(118173, 1);

      -- Spawn the Dwarf Generals with spawn commands 
      -- so they aren't depopped when Narandi is killed
      -- and the zone is reset to normal mode.
      eq.spawn2(118169, 0, 0, -44, -792, 51, 115);
      eq.spawn2(118172, 0, 0, -37, -788, 51, 115);
      eq.spawn2(118171, 0, 0, -27, -788, 51, 115);
      eq.spawn2(118170, 0, 0, -17, -788, 51, 115);
      eq.spawn2(118168, 0, 0, -7,  -788, 51, 115);

    elseif (e.message:findi('wave 14')) then
      eq.zone_emote(15, "Wave 14");
      eq.spawn_condition("greatdivide", 0, 16, 1);
    elseif (e.message:findi('wave 13')) then
      eq.zone_emote(15, "Wave 13");
      eq.spawn_condition("greatdivide", 0, 15, 1);
    elseif (e.message:findi('wave 12')) then
      eq.zone_emote(15, "Wave 12");
      eq.spawn_condition("greatdivide", 0, 14, 1);
    elseif (e.message:findi('wave 11')) then
      eq.zone_emote(15, "Wave 11");
      eq.spawn_condition("greatdivide", 0, 13, 1);
    elseif (e.message:findi('wave 10')) then
      eq.zone_emote(15, "Wave 10");
      eq.spawn_condition("greatdivide", 0, 12, 1);
    elseif (e.message:findi('wave 1')) then
      eq.zone_emote(15, "Wave 1");
      eq.spawn_condition("greatdivide", 0, 3, 1);
    elseif (e.message:findi('wave 2')) then
      eq.zone_emote(15, "Wave 2");
      eq.spawn_condition("greatdivide", 0, 4, 1);
    elseif (e.message:findi('wave 3')) then
      eq.zone_emote(15, "Wave 3");
      eq.spawn_condition("greatdivide", 0, 5, 1);
    elseif (e.message:findi('wave 4')) then
      eq.zone_emote(15, "Wave 4");
      eq.spawn_condition("greatdivide", 0, 6, 1);
    elseif (e.message:findi('wave 5')) then
      eq.zone_emote(15, "Wave 5");
      eq.spawn_condition("greatdivide", 0, 7, 1);
    elseif (e.message:findi('wave 6')) then
      eq.zone_emote(15, "Wave 6");
      eq.spawn_condition("greatdivide", 0, 8, 1);
    elseif (e.message:findi('wave 7')) then
      eq.zone_emote(15, "Wave 7");
      eq.spawn_condition("greatdivide", 0, 9, 1);
    elseif (e.message:findi('wave 8')) then
      eq.zone_emote(15, "Wave 8");
      eq.spawn_condition("greatdivide", 0, 10, 1);
    elseif (e.message:findi('wave 9')) then
      eq.zone_emote(15, "Wave 9");
      eq.spawn_condition("greatdivide", 0, 11, 1);
    end
  end
end

function Master_Signal(e)

  if (e.signal == 1) then
    eq.spawn_condition("greatdivide", 0, 3, 1);

  elseif (e.signal == 2) then 
    eq.set_timer('wave_cooldown', wave_cooldown_time);

  end

end

function Master_Timer(e)
  if (e.timer == 'wave_cooldown') then
    eq.stop_timer(e.timer);
    current_spawn_condition = current_spawn_condition + 1;

    eq.spawn_condition("greatdivide", 0, current_spawn_condition, 1);
  end
end

function Seneschal_Death(e)
  -- Event Fail
  -- Pop Giants outside of Thurgadin
  -- Depop all the mobs in Thurgadin for 2hours.
  Stop_Event();
  eq.zone_emote(13, "The forces defending the Grand Citadel of Thurgadin have failed, the Kromrif have overrun the first and oldest race.  The age of the dwarf has come to an end...");

  -- Depop the Dwarf Generals if they are still alive.
  eq.depop_all(118169);
  eq.depop_all(118171);
  eq.depop_all(118172);
  eq.depop_all(118170);
  eq.depop_all(118168);
end

function WaveMaster_Death(e)
  -- Send a signal to the ringtenmaster that one of the WaveMasters has 
  -- died; start a 5min timer before the next wave is spawned.
  eq.signal(118173, 2);
end

function Narandi_Spawn(e)
  eq.zone_emote(13, "So you have defeated my foot soldiers, now come and face me you vile, filthy dwarven rabble...");
end

function Narandi_Death(e)
  eq.zone_emote(13, 'No surprise the Age of the Dwarf continues with a Glorious victory of the Kromrif.');

  Stop_Event();
end

-- Hand in.: Shorn Head of Narandi (1741)
-- Get back: Crown of Narandi (1746)
-- Get back: Shorn Head of Narandi (1741)
function Churn_Trade(e)
  local item_lib = require("items");
  if (item_lib.check_turn_in(e.trade, {item1 = 1741})) then 
    e.other:SummonItem(1741);
    e.other:SummonItem(1746);

    e.self:Emote("pries a crown from the head of Narandi, 'The halls of Thurgadin will echo with praises to you for as long as we grace the face of this land. May this crown serve you well. Honor through battle!' ");

    e.self:Depop();
  end

  item_lib.return_items(e.self, e.other, e.trade);
end

-- Hand in.: Shorn Head of Narandi (1741)
-- Get back: Eye of Narandi (1745)
-- Get back: Shorn Head of Narandi (1741)
function Kargin_Trade(e)
  local item_lib = require("items");
  if (item_lib.check_turn_in(e.trade, {item1 = 1741})) then 
    e.other:SummonItem(1741);
    e.other:SummonItem(1745);

    e.self:Emote("picks up a stick and hits the back of the dismembered head with all his might, knocking one of its eyes out of the socket, 'Bastard killed my brother! Hope his ghost felt that one!' ");

    e.self:Depop();
  end

  item_lib.return_items(e.self, e.other, e.trade);
end

-- Hand in.: Shorn Head of Narandi (1741)
-- Get back: Earring of the Frozen Skull (1744)
-- Get back: Shorn Head of Narandi (1741)
function Corbin_Trade(e)
  local item_lib = require("items");
  if (item_lib.check_turn_in(e.trade, {item1 = 1741})) then 
    e.other:SummonItem(1741);
    e.other:SummonItem(1744);

    e.self:Emote("unhooks a glowing earring from Narandi's shorn head, 'Hmm, this looks like something special. Take it, " .. e.other:GetName() .. ", you've earned it! Be well.' ");

    e.self:Depop();
  end

  item_lib.return_items(e.self, e.other, e.trade);
end

-- Hand in.: Shorn Head of Narandi (1741)
-- Get back: Faceguard of Bentos the Hero (1743)
-- Get back: Shorn Head of Narandi (1741)
function Dobbin_Trade(e)
  local item_lib = require("items");
  if (item_lib.check_turn_in(e.trade, {item1 = 1741})) then 
    e.other:SummonItem(1741);
    e.other:SummonItem(1743);

    e.self:Emote("gives a gentle, warm smile and slight nod of his head in warm welcoming, 'Good day to you, " .. e.other:GetName() .. ", and welcome to the district of Selia. We are children of the light -- beings who valiantly uphold the ways of honor, valor, and merits of goodly faith and virtue. Rather, we are crusaders of these things, collectively comprising the beacon of these traits within the universe in our position in New Tanaan. We are quite pleased to have you approach us with such confidence -- perhaps the inner light has brought you to us, seeking a way to unlock the purity of these merits that you faintly mirror now. If you are seeking council in the ways of enchantments, then I would be more than pleased and honored to aid you where I can, my friend.'");

    e.self:Depop();
  end

  item_lib.return_items(e.self, e.other, e.trade);
end

-- Hand in.: Shorn Head of Narandi (1741)
-- Get back: Choker of the Wretched (1742)
-- Get back: Shorn Head of Narandi (1741)
function Garadain_Trade(e)
  local item_lib = require("items");
  if (item_lib.check_turn_in(e.trade, {item1 = 1741})) then 
    e.other:SummonItem(1741);
    e.other:SummonItem(1742);

    e.self:Emote("removes a choker from the severed head and returns both items to you, 'Congratulations on your victory, " .. e.other:GetName() .. ". I couldn't have done a better job myself. May Brell protect and watch over you and your friends. Farewell.'");

    e.self:Depop();
  end

  item_lib.return_items(e.self, e.other, e.trade);
end

function event_encounter_load(e)
  eq.register_npc_event('ring_war', Event.spawn,          118173, Ten_Start);
  eq.register_npc_event('ring_war', Event.signal,         118173, Master_Signal);
  eq.register_npc_event('ring_war', Event.timer,          118173, Master_Timer);

  eq.register_npc_event('ring_war', Event.say,            118167, Zrelik_Say);
  eq.register_npc_event('ring_war', Event.death_complete, 118166, Seneschal_Death);

  -- Kromrif Captain's Death
  eq.register_npc_event('ring_war', Event.death_complete, 118130, WaveMaster_Death);
  -- Kromrif General's Death
  eq.register_npc_event('ring_war', Event.death_complete, 118120, WaveMaster_Death);
  -- Kromrif Warlord's Death
  eq.register_npc_event('ring_war', Event.death_complete, 118158, WaveMaster_Death);

  -- Narandi's Death
  eq.register_npc_event('ring_war', Event.death_complete, 118145, Narandi_Death);
  eq.register_npc_event('ring_war', Event.spawn,          118145, Narandi_Spawn);

  -- Loot Mobs
  eq.register_npc_event('ring_war', Event.trade,          118169, Churn_Trade);
  eq.register_npc_event('ring_war', Event.trade,          118172, Kargin_Trade);
  eq.register_npc_event('ring_war', Event.trade,          118171, Corbin_Trade);
  eq.register_npc_event('ring_war', Event.trade,          118170, Dobbin_Trade);
  eq.register_npc_event('ring_war', Event.trade,          118168, Garadain_Trade);
end

function event_encounter_unload(e)
  Stop_Event();
end
