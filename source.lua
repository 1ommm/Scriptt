-- Configuración de Poderes
local walkSpeedValue = 50  -- Velocidad aumentada
local jumpPowerValue = 70  -- Salto aumentado

local Player = game.Players.LocalPlayer

local function ApplyGodMode(character)
    local humanoid = character:WaitForChild("Humanoid")
    
    -- 1. Salud Infinita
    humanoid.MaxHealth = 9e9
    humanoid.Health = 9e9
    
    -- 2. Evitar estado de muerte
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    
    -- 3. Mejoras de Movimiento (para escapar del cringe rápido)
    humanoid.WalkSpeed = walkSpeedValue
    humanoid.JumpPower = jumpPowerValue
    
    -- 4. Anti-Daño por Contacto (Lava/Tsunami)
    -- Esto intenta borrar los scripts de daño que toquen tu cuerpo
    character.ChildAdded:Connect(function(child)
        if child:IsA("TouchTransmitter") then
            child:Destroy()
        end
    end)
end

-- Ejecutar al cargar
if Player.Character then ApplyGodMode(Player.Character) end

-- Re-aplicar al reaparecer
Player.CharacterAdded:Connect(function(char)
    wait(0.5)
    ApplyGodMode(char)
end)

print("Brainrot Defeated: God Mode & Speed Activo")
