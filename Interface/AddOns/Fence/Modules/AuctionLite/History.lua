-------------------------------------------------------------------------------
-- History.lua
--
-- Track historical information about auction prices.
-------------------------------------------------------------------------------

local _
local L = LibStub("AceLocale-3.0"):GetLocale("AuctionLite", false)

local MIN_TIME_BETWEEN_SCANS = 0;
local HALF_LIFE = 604800; -- 1 week
local INDEPENDENT_SCANS = 172800; -- 2 days

-- Retrieve historical price data for an item by id/suffix.
function AuctionLite:GetHistoricalPriceById(id, suffix)
  local info = self.db.factionrealm.prices[id];

  -- Check whether this item has sub-tables for each item suffix.
  if info ~= nil then
    if suffix == nil then
      suffix = 0;
    end
    if suffix ~= 0 or info.suffix then
      if suffix ~= 0 and info.suffix then
        info = info[suffix];
      else
        info = nil;
      end
    end
  end

  -- Make sure we have the right format.
  if info ~= nil then
    self:ValidateHistoricalPrice(info);
  end

  return info;
end

-- Retrieve historical price data for an item.
function AuctionLite:GetHistoricalPrice(link)
  local name, _, id, suffix = self:SplitLink(link);
  local info = AuctionLite:GetHistoricalPriceById(id, suffix);

  if info == nil then
    -- Check to see whether we're using a database generated by v0.1,
    -- which indexed by name instead of id.  If so, migrate it.
    info = self.db.factionrealm.prices[name];
    if info ~= nil then
      self:ValidateHistoricalPrice(info);
      self:SetHistoricalPrice(link, info);
      self.db.factionrealm.prices[name] = nil;
    end
  end

  return info;
end

-- Set historical price data for an item.
function AuctionLite:SetHistoricalPrice(link, info)
  local _, _, id, suffix = self:SplitLink(link);

  if suffix == 0 then
    -- This item has no suffix, so just use the id.
    self.db.factionrealm.prices[id] = info;
  else
    -- This item has a suffix, so index by suffix as well.
    local parent = self.db.factionrealm.prices[id];
    if parent == nil or not parent.suffix then
      parent = { suffix = true };
      self.db.factionrealm.prices[id] = parent;
    end
    parent[suffix] = info;
  end
end

-- Make sure that the price data structure is a valid one.
function AuctionLite:ValidateHistoricalPrice(info)
  local field;
  for _, field in ipairs({"price", "listings", "scans", "time", "items"}) do
    if info[field] == nil then
      info[field] = 0;
    end
  end
end

-- Update historical price data for an item given a price (per item) and
-- the number of listings seen in the latest scan.
function AuctionLite:UpdateHistoricalPrice(link, data)
  if self.db.profile.storePrices then
    -- Get the current data.
    local info = self:GetHistoricalPrice(link)

    -- If we have no data for this item, start a new one.
    if info == nil then
      info = { price = 0, listings = 0, scans = 0, time = 0, items = 0 };
      self:SetHistoricalPrice(link, info);
    end

    -- Update the current data with our new data.
    local time = time();
    if info.time + MIN_TIME_BETWEEN_SCANS < time and data.listings > 0 then
      local pastDiscountFactor = 0.5 ^ ((time - info.time) / HALF_LIFE);
      local presentDiscountFactor = 1 - 0.5 ^ ((time - info.time) / INDEPENDENT_SCANS);
      info.price = (data.price * data.listings * presentDiscountFactor +
                    info.price * info.listings * pastDiscountFactor) /
                   (data.listings * presentDiscountFactor +
                    info.listings * pastDiscountFactor);
      info.listings = data.listings * presentDiscountFactor +
                      info.listings * pastDiscountFactor;
      info.items = data.items * presentDiscountFactor + info.items * pastDiscountFactor;
      info.scans = 1 * presentDiscountFactor + info.scans * pastDiscountFactor;
      info.time = time;
    end
  end
end

-- Get saved item info for the sell frame.
function AuctionLite:GetSavedPrices(link)
  local name, _, id, suffix = self:SplitLink(link);
  local info = self.db.factionrealm.prefs[id];

  -- Check whether this item has sub-tables for each item suffix.
  if info ~= nil then
    if suffix == nil then
      suffix = 0;
    end
    if suffix ~= 0 or info.suffix then
      if suffix ~= 0 and info.suffix then
        info = info[suffix];
      else
        info = nil;
      end
    end
  end

  if info == nil then
    info = {};
  end

  return info;
end

-- Set saved item info for the sell frame.
function AuctionLite:SetSavedPrices(link, info)
  local _, _, id, suffix = self:SplitLink(link);

  -- Set info to nil if there are no saved prices.
  if info ~= nil then
    local hasPrices = false;
    for _, _ in pairs(info) do
      hasPrices = true;
      break;
    end
    if not hasPrices then
      info = nil;
    end
  end

  if suffix == 0 then
    -- This item has no suffix, so just use the id.
    self.db.factionrealm.prefs[id] = info;
  else
    -- This item has a suffix, so index by suffix as well.
    local parent = self.db.factionrealm.prefs[id];
    if parent == nil or not parent.suffix then
      parent = { suffix = true };
      self.db.factionrealm.prefs[id] = parent;
    end
    parent[suffix] = info;
  end
end

-- Static popup warning for clearing data.
dwStaticPopupDialogs["AL_CLEAR_DATA"] = {
  text = L["CLEAR_DATA_WARNING"],
  button1 = L["Do it!"],
  button2 = L["Cancel"],
  OnAccept = function(self)
    AuctionLite.db.factionrealm.prices = {};
    AuctionLite:Print(L["Auction house data cleared."]);
    collectgarbage("collect");
  end,
  showAlert = 1,
  timeout = 0,
  exclusive = 1,
  hideOnEscape = 1,
  preferredIndex = 3
};

-- The user requested to clear all AH data.
function AuctionLite:ClearData()
  dwStaticPopup_Show("AL_CLEAR_DATA");
end
