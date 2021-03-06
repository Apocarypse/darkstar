-----------------------------------
--
-- Zone: Qufim_Island (126)
--
-----------------------------------
local ID = require("scripts/zones/Qufim_Island/IDs");
require("scripts/globals/conquest");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    dsp.conq.setRegionalConquestOverseers(zone:getRegionID())
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-286.271,-21.619,320.084,255);
    end
    if (prevZone == dsp.zone.BEHEMOTHS_DOMINION and player:getVar("theTalekeepersGiftKilledNM") >= 3) then
        cs = 100;
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 100) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,12638); -- Fighter's Lorica
        else
            player:addTitle(dsp.title.PARAGON_OF_WARRIOR_EXCELLENCE);
            player:addItem(12638);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 12638); -- Fighter's Lorica
            player:setVar("theTalekeeperGiftCS",0);
            player:setVar("theTalekeepersGiftKilledNM",0);
            player:addFame(BASTOK,AF3_FAME);
            player:completeQuest(BASTOK,THE_TALEKEEPER_S_GIFT);
        end
    end
end;
