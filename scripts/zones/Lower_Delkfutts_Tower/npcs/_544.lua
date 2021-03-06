-----------------------------------
-- Area: Lower Delkfutt's Tower
--  NPC: Cermet Door
-- Notes: Door opens when you trade Delkfutt Key to it
-- !pos 345 0.1 20 184
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Lower_Delkfutts_Tower/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(549,1) and trade:getItemCount() == 1) then -- Trade Delkfutt Key
        player:startEvent(16);
    end

end;

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.DELKFUTT_KEY)) then
        player:startEvent(16);
    else
        player:startEvent(10); -- door is firmly shut
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option,npc)
--print("CSID:",csid);
--print("RESULT:",option);

    if (csid == 16 and option == 1) then
        if (player:hasKeyItem(dsp.ki.DELKFUTT_KEY) == false) then
            player:tradeComplete();
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.DELKFUTT_KEY);
            player:addKeyItem(dsp.ki.DELKFUTT_KEY);
        end
    end

end;
