getgenv().AutoSkip = false
getgenv().AutoAbilityByFriends = false

function ToggleAutoSkip()
    spawn(function()
        while getgenv().AutoSkip == true do
            local args = {
                [1] = "AutoSkip"
            }
            
            game:GetService("ReplicatedStorage").Remote.Setting:FireServer(unpack(args))
            wait(999999)
        end
    end)
end

function ToggleAutoAbilityByFriends()
    spawn(function()
        while getgenv().AutoAbilityByFriends == true do
            local args = {
                [1] = "FriendActive"
            }
            
            game:GetService("ReplicatedStorage").Remote.Setting:FireServer(unpack(args))
            wait(999999)
        end
    end)
end


-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Venyx", 5013109572)

-- themes
local themes = {
Background = Color3.fromRGB(24, 24, 24),
Glow = Color3.fromRGB(0, 0, 0),
Accent = Color3.fromRGB(10, 10, 10),
LightContrast = Color3.fromRGB(20, 20, 20),
DarkContrast = Color3.fromRGB(14, 14, 14),  
TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Game", 5012544693)
local section1 = page:addSection("Main")

section1:addToggle("Auto Skip", nil, function(value)
    getgenv().AutoSkip = value
    print("Auto Skip ON", value)
    if value then
        ToggleAutoSkip()
    end
end)

section1:addToggle("Auto Ability By Friends", nil, function(value)
    getgenv().AutoAbilityByFriends = value
    print("Ability By Friends ON", value)
    if value then
        ToggleAutoAbilityByFriends()
    end
end)

-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
colors:addColorPicker(theme, color, function(color3)
venyx:setTheme(theme, color3)
end)
end

-- load
venyx:SelectPage(venyx.pages[1], true)