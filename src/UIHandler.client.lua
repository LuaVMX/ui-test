local Fusion = require(game:GetService("ReplicatedStorage"):WaitForChild("Packages").fusion)
local TweenService = game:GetService("TweenService")

local New = Fusion.New
local Children = Fusion.Children

local SpawnInterval = 0.05
local Colour = Color3.fromRGB(91, 79, 136)

local ParticleTweenInfo = TweenInfo.new(
    5,
    Enum.EasingStyle.Linear,
    Enum.EasingDirection.InOut
)

local UI = New "ScreenGui" {
    Name = "UI",
    IgnoreGuiInset = true,
    ResetOnSpawn = false,
    Parent = script.Parent,

    [Children] = {
		New "Frame" {
			Name = "Outline",
			BackgroundTransparency = 0.4,
			BackgroundColor3 = Colour,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.5, 0, 0.5, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			
			[Children] = {
				New "UICorner" {
					CornerRadius = UDim.new(0, 8)
				},

                New "Frame" {
                    Name = "Background",
                    BackgroundTransparency = 0.1,
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.new(0.985, 0, 0.96, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    ClipsDescendants = true,

                    [Children] = {
                        New "UICorner" {
                            CornerRadius = UDim.new(0, 8)
                        },

                        New "Frame" {
                            Name = "Particles",
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 1, 0),
                        }
                    }
                }
			}
		}
	}
}

while task.wait(SpawnInterval) do
    local Particle = New "Frame" {
        Name = "Particle",
        Size = UDim2.new(0.025, 0, 0.025, 0),
        SizeConstraint = Enum.SizeConstraint.RelativeXX,
        Position = UDim2.new(tonumber("0."..math.random(-50, 950)), 0, 1, 0),
        BackgroundColor3 = Colour,
        BackgroundTransparency = 0.7,
        Parent = UI.Outline.Background.Particles,
        
        [Children] = {
            New "UICorner" {
                CornerRadius = UDim.new(0, 2)
            }
        }
    }

    coroutine.wrap(function()
        local Tween = game:GetService("TweenService"):Create(Particle, ParticleTweenInfo, {Position = UDim2.new(Particle.Position.X.Scale, Particle.Position.X.Offset, -0.1, 0), Transparency = 1, Rotation = 360})
        Tween:Play()
        Tween.Completed:Wait()

        Particle:Destroy()
    end)()
end