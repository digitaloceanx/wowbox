--[[ Asteroid 1.0 ]]

local LBF = LibStub("LibButtonFacade", true)
if not LBF then
	return
end

-- Asteroid
LBF:AddSkin("Asteroid", {

	-- Skin data start.
	Backdrop = {
		Width = 39,
		Height = 39,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Asteroid\Textures\Backdrop]],
	},
	Icon = {
		Width = 30,
		Height = 30,
		OffsetX = -1,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 39,
		Height = 39,
		Color = {1, 0, 0, 0.5},
		Texture = [[Interface\AddOns\\Duowan\ButonFacae\ButtonFacade_Asteroid\Textures\Overlay]],
	},
	Cooldown = {
		Width = 30,
		Height = 30,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		AboveNormal = true,
	},
	Normal = {
		Width = 42,
		Height = 42,
		Static = true,
		Color = {0.25, 0.25, 0.25, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Asteroid\Textures\Normal]],
	},
	Pushed = {
		Width = 39,
		Height = 39,
		Color = {0, 0, 0, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Asteroid\Textures\Overlay]],
	},
	Border = {
		Width = 39,
		Height = 39,
		BlendMode = "ADD",
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Asteroid\Textures\Border]],
	},
	Disabled = {
		Hide = true,
	},
	Checked = {
		Width = 39,
		Height = 39,
		Color = {0, 0.75, 1, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Asteroid\Textures\Border]],
	},
	AutoCastable = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 39,
		Height = 39,
		BlendMode = "ADD",
		Color = {1, 1, 1, 0.5},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Asteroid\Textures\Highlight]],
	},
	Gloss = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Asteroid\Textures\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		OffsetX = -2,
		OffsetY = 10,
	},
	Count = {
		Width = 42,
		Height = 10,
		OffsetX = -2,
		OffsetY = -10,
	},
	Name = {
		Width = 42,
		Height = 10,
		OffsetY = -10,
	},
	-- Skin data end.

}, true)
