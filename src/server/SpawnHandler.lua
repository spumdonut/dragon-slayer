local SpawnHandler = {}

function SpawnHandler.spawnCoin(coin, position)
    local coinClone = coin:Clone()
    coinClone.Name = "Coin"
    coinClone.Position = position
    coinClone.Parent = workspace
end

function SpawnHandler.spawnSword(swords, position)
    local swords = swords:GetChildren()
    local randomIndex = math.random(1, #swords)
    local randomSword = swords[randomIndex]
    local swordClone = randomSword.Handle:Clone()
    swordClone.Name = "Sword"
    swordClone.Position = position
    swordClone.Parent = workspace

    local proximityPrompt = Instance.new("ProximityPrompt")
    proximityPrompt.Parent = swordClone

    proximityPrompt.Triggered:Connect(function(player)
        local randomSwordClone = randomSword:Clone()
        randomSwordClone.Name = "Sword"
        randomSwordClone.Parent = player.Backpack
        swordClone:Destroy()
    end)
end

function SpawnHandler.spawnDragons(args)
    local dragonLevelGui = args.gui
    local currentLevel = args.level
    local monsters = args.monsters
    local monstersToSpawn = args.amount
    local dragons = args.dragons:GetChildren()

    for _ = 1, monstersToSpawn do
        local randomIndex = math.random(1, #dragons)
        local dragonClone = dragons[randomIndex]:Clone()
        dragonClone.Name = "Dragon"
        dragonClone.HumanoidRootPart.Position = Vector3.new(56.299, 3.448, 10.166)
        dragonClone.Parent = workspace

        local dragonLevelGuiClone = dragonLevelGui:Clone()
        dragonLevelGuiClone.TextLabel.Text = "level" .. currentLevel
        dragonLevelGuiClone.Parent = dragonClone.Head

        table.insert(monsters, dragonClone)
    end
end

return SpawnHandler