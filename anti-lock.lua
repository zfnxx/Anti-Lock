if getgenv().antilockh then
    return
end
getgenv().antilockh = true
local UIS = game:GetService("UserInputService")
local Antilocking = false
local Animate = game.Players.LocalPlayer.Character.Animate
local Idle1 = Animate.idle.Animation1.AnimationId
local Idle2 = Animate.idle.Animation2.AnimationId

loadstring(game:HttpGet("https://raw.githubusercontent.com/zfnxx/Da-Hood-Anti-Cheat-Bypass/main/anti-cheat-bypass.lua"))()

UIS.InputBegan:Connect(function(input, pressed)
    if pressed == false and input.KeyCode == Enum.KeyCode.Z then
        if Antilocking == false then
            Antilocking = true
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "oxz#0001 anti lock",
                Text = "Enabled",
                Duration = 1,
            })
        else
            Antilocking = false
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "oxz#0001 anti lock",
                Text = "Disabled",
                Duration = 1,
            })
        end
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if Antilocking == true then
        Animate.idle.Animation1.AnimationId = Animate.run.RunAnim.AnimationId
        Animate.idle.Animation2.AnimationId = Animate.run.RunAnim.AnimationId
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * 0.052
    else
        Animate.idle.Animation1.AnimationId = Idle1
        Animate.idle.Animation2.AnimationId = Idle2
    end
end)
