-- local zone = "The Emerald Nightmare"
local zoneid = 1094
local GridStatusRaidDebuff = GridStatusRaidDebuff;
local function import(self)
-- Nythendra
GridStatusRaidDebuff:BossNameId(zoneid, 10, "Nythendra")
-- Infested (Heroic)
GridStatusRaidDebuff:DebuffId(zoneid, 204504, 11, 2, 2, false, true) -- Infested
-- Stage One
-- Infested Ground
GridStatusRaidDebuff:DebuffId(zoneid, 203045, 12, 5, 5) -- Infested Ground (standing in pool)
-- Rot
GridStatusRaidDebuff:DebuffId(zoneid, 203096, 13, 6, 6, true) -- Rot (AoE people around you)
-- Volatile Rot
GridStatusRaidDebuff:DebuffId(zoneid, 204463, 14, 6, 6, true) -- Volatile Rot (exploding tank)
-- Stage Two
-- Heart of the Swarm/Burst of Corruption
GridStatusRaidDebuff:DebuffId(zoneid, 203646, 15, 5, 5, true, true) -- Burst of Corruption

-- Il'gynoth, Heart of Corruption
GridStatusRaidDebuff:BossNameId(zoneid, 20, "Il'gynoth, Heart of Corruption")

-- Elerethe Renferal
GridStatusRaidDebuff:BossNameId(zoneid, 30, "Erethe Renferal")

-- Ursoc
GridStatusRaidDebuff:BossNameId(zoneid, 40, "Ursoc")

-- Dragons of Nightmare
GridStatusRaidDebuff:BossNameId(zoneid, 50, "Dragons of Nightmare")

-- Cenarius
GridStatusRaidDebuff:BossNameId(zoneid, 60, "Cenarius")

-- Xavius
GridStatusRaidDebuff:BossNameId(zoneid, 70, "Xavius")

end

GridStatusRaidDebuff:Import(import)