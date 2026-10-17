local Players = game:GetService("Players")
local player = Players.LocalPlayer

local animationId = "rbxassetid://156179233864990"

local animation = Instance.new("Animation")
animation.AnimationId = animationId

local function applyAnimation(character)
	local humanoid = character:WaitForChild("Humanoid")
	local animator = humanoid:WaitForChild("Animator")

	task.wait()

	local track = animator:LoadAnimation(animation)
	track.Priority = Enum.AnimationPriority.Action
	track.Looped = true
	
	track:Play()
	track:AdjustWeight(1, 0)

	humanoid.Died:Connect(function()
		if track then
			track:Stop()
		end
	end)
end

local function onCharacterAdded(character)
	character:WaitForChild("Humanoid")
	task.wait(0.1)
	applyAnimation(character)
end

player.CharacterAdded:Connect(onCharacterAdded)

if player.Character then
	onCharacterAdded(player.Character)
end
