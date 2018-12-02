-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["description"] = "Kenneth asked me to bring him some shovels.";
	["hidden"] = false;
	["logs"] = {
		["Finish"] = "I brought Kenneth a shovel. He told me to check his secret stashes everytime i bring him a shovel.";
	};
	["nodes"] = {
		["condition_00004"] = {
			["ID"] = 4;
			["connectionsID"] = {
			};
			["event"] = "discuss";
			["posX"] = 330;
			["posY"] = 60;
			["script"] = "function Condition:onCheck(obj)\
if self.startup then\
self:writeLog(\"Finish\")\
self.startup = false\
end\
   removeItemFromPlayer( \"shovel.wpn\", self.clothReq )\
   self:goToStep(\"kenneth_get_shovels\")\
  return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "kenneth_give_shovels";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00006"] = {
			["ID"] = 6;
			["connectionsID"] = {
				[1] = 3;
			};
			["event"] = "discuss";
			["posX"] = 600;
			["posY"] = 240;
			["script"] = "function Condition:onCheck(obj)\
local hlp = require \"helpers\"\
  if kenneth_hidden_stash then\
   hlp.safeDestroyEntity(kenneth_hidden_stash)\
  end\
  local coord = {\
\9  { pos={x=-2264.9318847656,y=5826.0883789063,z=124586.3125},rot={w=0.25881922245026,x=0,y=0.9659258723259,z=0}},\
\9  { pos={x=47.500457763672,y=5654.923828125,z=117931.015625},rot={w=0.9238795042038,x=0,y=0.38268342614174,z=0}},\
\9  { pos = {x=-3932.11328125,y=5268.6684570313,z=119529.2109375},rot={w=0.30070593953133, x=0,y=0.95371687412262,z=0}},\
\9  { pos = {x = -3765.6044921875, y = 5197.6157226563, z = 121961.6953125}, rot = {w = 1, x = 0, y = 0, z = 0}},\
\9  { pos = {x = -1698.2446289063, y = 5123.935546875, z = 122735.453125}, rot = {w = 1, x = 0, y = 0, z = 0}},\
\9  }\
\9  local item = {}\
\9  item[1] = \"cleaver.wpn\"\
\9  item[2] = \"scamp_22.gun\"\
\9  item[3] = \"revolver.gun\"\
\9  local coordindex = math.floor(rand(5)) + 1\
\9  local position = nil\
\9  local rotation = nil\
\9  for index, coordinate in pairs(coord)do\
\9   if tostring(index) == tostring(coordindex) then\
\9     position = coordinate.pos\
\9     rotation = coordinate.rot\
            end\
\9  end\
      if position and rotation then\
       kenneth_hidden_stash = hlp.safeCreateEntity(\"rockclump_1.sbg\", \"CContainer\")\
       kenneth_hidden_stash:getPose():setPos(position)\
       kenneth_hidden_stash:getPose():setRotQuat(rotation)\
\9  local i = 0\
\9  local qualitypercent = math.floor(rand(100)) + 1\
\9  if qualitypercent <= 68 then\
\9  i = 1\
\9  elseif qualitypercent >= 69 and qualitypercent <= 88 then\
\9  i = 2\
\9  elseif qualitypercent >= 89 and qualitypercent <= 98 then\
\9  i = 3\
\9  elseif qualitypercent >= 99 then\
\9  i = 4\
\9  end\
\9  local ii = 1\
\9  local itemindexchance = math.floor(rand(100)) + 1\
\9  if itemindexchance <= 93 then\
\9  ii = 1\
\9  elseif itemindexchance >= 94 or itemindexchance <= 98 then\
\9  ii = 2\
\9  elseif itemindexchance >= 99 then\
\9  ii = 3\
\9  end\
          local itemspawn = kenneth_hidden_stash:getInventory():addItem(item[ii])\
          itemspawn:setQuality(i)\
\9  end\
   return false\
end\
\
";
			["targetsAll"] = "";
			["targetsAny"] = "finish";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["condition_00009"] = {
			["ID"] = 9;
			["connectionsID"] = {
				[1] = 1;
			};
			["event"] = "discuss";
			["posX"] = 60;
			["posY"] = 240;
			["script"] = "";
			["targetsAll"] = "";
			["targetsAny"] = "start";
			["targetsCount"] = 1;
			["type"] = "condition";
		};
		["finish"] = {
			["ID"] = 3;
			["connectionsID"] = {
			};
			["name"] = "finish";
			["posX"] = 870;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
		["start"] = {
			["ID"] = 1;
			["connectionsID"] = {
				[1] = 6;
			};
			["name"] = "start";
			["posX"] = 360;
			["posY"] = 270;
			["script"] = "";
			["type"] = "step";
		};
	};
	["script"] = "function Quest:onCreate()\
   self:setTopicVisible(\"start\", true)\
   self:setTopicVisible(\"kenneth_get_shovels\", true)\
   self:setTopicVisible(\"kenneth_give_shovels\", true)\
   self:setTopicVisible(\"kenneth_got_shovels \", true) --is hidden by give_cloth\
   self:declareVar(\"clothReq\", 1)\
   self:declareVar(\"startup\", true)\
end\
\
function Quest:onStart()\
   self:setTopicVisible(\"start\", false)\
end\
\
function Quest:onFinish()\
end\
\
\
function Quest:getTopicVisible_kenneth_give_shovels()\
   return hasPlayerItem(\"shovel.wpn\", self.clothReq) and not self:getTopicVisible( \"start\" )\
end";
	["title"] = "A man in need";
}
return obj1
