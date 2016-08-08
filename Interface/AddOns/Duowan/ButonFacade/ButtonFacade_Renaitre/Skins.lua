--[[ Renaitre ]]

local LBF = LibStub("LibButtonFacade", true)
if not LBF then return end

-- Renaitre: Circle
LBF:AddSkin("Renaitre: Circle", {
	Backdrop = {
		Width = 44,
		Height = 44,
		Color = {0.4, 0.4, 0.4, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Circle\Backdrop]],
	},
	Icon = {
		Width = 26,
		Height = 26,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 44,
		Height = 44,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Circle\Overlay]],
	},
	Cooldown = {
		Width = 26,
		Height = 26,
	},
	AutoCast = {
		Width = 24,
		Height = 24,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 44,
		Height = 44,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Circle\Normal]],
	},
	Pushed = {
		Width = 44,
		Height = 44,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Circle\Highlight]],
	},
	Border = {
		Width = 44,
		Height = 44,
		BlendMode = "ALPHAKEY",
		Color = {0, 0.5, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Circle\Border]],
	},
	Disabled = {
		Width = 44,
		Height = 44,
		BlendMode = "ALPHAKEY",
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Circle\Border]],
	},
	Checked = {
		Width = 44,
		Height = 44,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Circle\Border]],
	},
	AutoCastable = {
		Width = 48,
		Height = 48,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 44,
		Height = 44,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Circle\Highlight]],
	},
	Gloss = {
		Width = 44,
		Height = 44,
		BlendMode = "BLEND",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Circle\Gloss]],
	},
	HotKey = {
		Width = 44,
		Height = 10,
		OffsetX = -12,
		OffsetY = 12,
	},
	Count = {
		Width = 44,
		Height = 10,
		OffsetX = -12,
		OffsetY = -12,
	},
	Name = {
		Width = 44,
		Height = 12,
		OffsetY = -12,
	},
}, true)

-- Renaitre: Rounded
LBF:AddSkin("Renaitre: Rounded", {
	Backdrop = {
		Width = 42,
		Height = 42,
		Color = {0.4, 0.4, 0.4, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Rounded\Backdrop]],
	},
	Icon = {
		Width = 32,
		Height = 32,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Rounded\Overlay]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 42,
		Height = 42,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Rounded\Normal]],
	},
	Pushed = {
		Width = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Rounded\Highlight]],
	},
	Border = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0, 0.5, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Rounded\Border]],
	},
	Disabled = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Rounded\Border]],
	},
	Checked = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Rounded\Border]],
	},
	AutoCastable = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Rounded\Highlight]],
	},
	Gloss = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Rounded\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		OffsetX = -6,
		OffsetY = 10,
	},
	Count = {
		Width = 42,
		Height = 10,
		OffsetX = -6,
		OffsetY = -10,
	},
	Name = {
		Width = 42,
		Height = 10,
		OffsetY = -10,
	},
}, true)

-- Renaitre: Square
LBF:AddSkin("Renaitre: Square", {
	Backdrop = {
		Width = 42,
		Height = 42,
		Color = {0.4, 0.4, 0.4, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Square\Backdrop]],
	},
	Icon = {
		Width = 30,
		Height = 30,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Square\Overlay]],
	},
	Cooldown = {
		Width = 30,
		Height = 30,
	},
	AutoCast = {
		Width = 30,
		Height = 30,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 42,
		Height = 42,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Square\Normal]],
	},
	Pushed = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Square\Highlight]],
	},
	Border = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0, 0.5, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Square\Border]],
	},
	Disabled = {
		Width = 44,
		Height = 44,
		BlendMode = "ALPHAKEY",
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Square\Border]],
	},
	Checked = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Square\Border]],
	},
	AutoCastable = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Square\Highlight]],
	},
	Gloss = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Square\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		OffsetX = -6,
		OffsetY = 10,
	},
	Count = {
		Width = 42,
		Height = 10,
		OffsetX = -6,
		OffsetY = -10,
	},
	Name = {
		Width = 42,
		Height = 10,
		OffsetY = -10,
	},
}, true)

-- Renaitre: Beveled
LBF:AddSkin("Renaitre: Beveled", {
	Backdrop = {
		Width = 42,
		Height = 42,
		Color = {0.4, 0.4, 0.4, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Beveled\Backdrop]],
	},
	Icon = {
		Width = 30,
		Height = 30,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Beveled\Overlay]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 42,
		Height = 42,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Beveled\Normal]],
	},
	Pushed = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Beveled\Highlight]],
	},
	Border = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0, 0.5, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Beveled\Border]],
	},
	Disabled = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Beveled\Border]],
	},
	Checked = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Beveled\Border]],
	},
	AutoCastable = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Beveled\Highlight]],
	},
	Gloss = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\Beveled\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		OffsetX = -6,
		OffsetY = 10,
	},
	Count = {
		Width = 42,
		Height = 10,
		OffsetX = -6,
		OffsetY = -10,
	},
	Name = {
		Width = 42,
		Height = 10,
		OffsetY = -10,
	},
}, true)

-- Renaitre: Square Thin
LBF:AddSkin("Renaitre: Square Thin", {
	Backdrop = {
		Width = 42,
		Height = 42,
		Color = {0.4, 0.4, 0.4, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\SquareThin\Backdrop]],
	},
	Icon = {
		Width = 34,
		Height = 34,
		TexCoords = {0.07,0.93,0.07,0.93},
	},
	Flash = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 0.6},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\SquareThin\Overlay]],
	},
	Cooldown = {
		Width = 32,
		Height = 32,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 1,
		OffsetY = -1,
		AboveNormal = true,
	},
	Normal = {
		Width = 42,
		Height = 42,
		Static = true,
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\SquareThin\Normal]],
	},
	Pushed = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\SquareThin\Highlight]],
	},
	Border = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0, 0.5, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\SquareThin\Border]],
	},
	Disabled = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {1, 0, 0, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\SquareThin\Border]],
	},
	Checked = {
		Width = 42,
		Height = 42,
		BlendMode = "BLEND",
		Color = {0, 0.12, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\SquareThin\Border]],
	},
	AutoCastable = {
		Width = 42,
		Height = 42,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Highlight = {
		Width = 42,
		Height = 42,
		BlendMode = "ALPHAKEY",
		Color = {0.5, 0, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\SquareThin\Highlight]],
	},
	Gloss = {
		Width = 44,
		Height = 44,
		BlendMode = "BLEND",
		Color = {1, 1, 1, 1},
		Texture = [[Interface\AddOns\Duowan\ButonFacade\ButtonFacade_Renaitre\Textures\SquareThin\Gloss]],
	},
	HotKey = {
		Width = 42,
		Height = 10,
		OffsetX = -6,
		OffsetY = 10,
	},
	Count = {
		Width = 42,
		Height = 10,
		OffsetX = -6,
		OffsetY = -10,
	},
	Name = {
		Width = 42,
		Height = 10,
		OffsetY = -10,
	},
}, true)
