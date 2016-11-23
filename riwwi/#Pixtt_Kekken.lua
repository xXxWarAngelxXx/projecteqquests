local min_players = 18;

function event_say(e)
  local qglobals = eq.get_qglobals();
  if (e.message:findi("hail")) then
    e:self:Say("It's a good thing Taskmistress Krisz doesn't know what we're up to.  Wow, does she have a temper, and enough skill with a blade to back it up.  No one would [" .. eq.say_link("dare", false, "dare") .. "] cross her.");
  end

  if (e.message:findi("dare")) then
    if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(282105)) then
      if (qglobals["taskmistress"] ~= nil) then

        local player_list = requestor:GetRaid();
        local player_list_count = player_list:RaidCount();

        if (player_list.valid == true and player_list_count >= min_players) then
          e.self:Emote("laughs, 'Think you could teach that old goat a lesson!?'");
          eq.spawn2(282105, 21, 0, -1117, -408, 33, 251);
        else
          e.other:Message(12, "You must assemble a raid force of at least three groups to attract the attention of Taskmistress Krisz");
        end
      else
        e.self:Say("She hasn't been around much lately, but I'm sure she'll be back.");
      end
    end
  end
end
