function event_click_door(e)
  local door_id = e.door:GetDoorID();
  if (door_id == 2) then  
      e.self:MovePC(302, -2050.25, 606.5,202.3,114); -- Zone: draniksscar
  end
end
