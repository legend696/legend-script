wait(6.5)
getgenv().AutoPlaceRedHair = true
getgenv().AutoSellRedHair = true
getgenv().AutoSkip = true
getgenv().AutoFirstSkip = true
getgenv().AutoTPToRedHair = true


if game.PlaceId == 6593190090 then
    spawn(function()
    while getgenv().AutoTPToRedHair == true do
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-781.734375, 317.183319091797, -607.158203125))
        wait()
    end
end)


spawn(function()
    while getgenv().AutoPlaceRedHair == true do
        local args = {
            [1] = "RedHair",
            [2] = CFrame.new(-781.6093139648438, 317.3208312988281, -607.3359375) * CFrame.Angles(-0, 0, -0)
        }

        game:GetService("ReplicatedStorage").Remote.SpawnUnit:InvokeServer(unpack(args))
        wait()
    end
end)

local clock = os.clock
function sleep(n)
    local t = os.clock()
    while os.clock() - t <= n do
        while getgenv().AutoSellRedHair == true do
            local args = {
                [1] = workspace.Units.RedHair
            }

            game:GetService("ReplicatedStorage").Remote.SellUnit:InvokeServer(unpack(args))
        end
    end
end

spawn(function()
    while getgenv().AutoSkip == true do
        local args = {
        [1] = "AutoSkip"
     }

        game:GetService("ReplicatedStorage").Remote.Setting:FireServer(unpack(args))
        wait(999999)
    end
end)

spawn(function()
    while getgenv().AutoFirstSkip == true do
        game:GetService("ReplicatedStorage").Remote.SkipEvent:FireServer()
        wait(999999)
    end
end)
end