-- Snake en Love2D

local CELL = 20
local COLS = 30
local ROWS = 25
local W = COLS * CELL
local H = ROWS * CELL
local SPEED = 0.12 -- secondes entre chaque déplacement

local snake, dir, nextDir, food, score, state, timer

local function randomFood()
    local occupied = {}
    for _, s in ipairs(snake) do
        occupied[s.x .. "," .. s.y] = true
    end
    local x, y
    repeat
        x = math.random(1, COLS)
        y = math.random(1, ROWS)
    until not occupied[x .. "," .. y]
    return { x = x, y = y }
end

local function init()
    local sx = math.floor(COLS / 2)
    local sy = math.floor(ROWS / 2)
    snake = {
        { x = sx,     y = sy },
        { x = sx - 1, y = sy },
        { x = sx - 2, y = sy },
    }
    dir     = { x = 1, y = 0 }
    nextDir = { x = 1, y = 0 }
    score   = 0
    timer   = 0
    state   = "playing"
    food    = randomFood()
end

function love.load()
    love.window.setTitle("Snake")
    love.window.setMode(W, H, { resizable = false, vsync = true })
    math.randomseed(os.time())
    init()
end

function love.keypressed(key)
    if state == "playing" then
        if (key == "up"    or key == "w") and dir.y == 0 then nextDir = { x = 0, y = -1 } end
        if (key == "down"  or key == "s") and dir.y == 0 then nextDir = { x = 0, y =  1 } end
        if (key == "left"  or key == "a") and dir.x == 0 then nextDir = { x = -1, y = 0 } end
        if (key == "right" or key == "d") and dir.x == 0 then nextDir = { x =  1, y = 0 } end
    elseif state == "gameover" then
        if key == "return" or key == "space" then init() end
    end
    if key == "escape" then love.event.quit() end
end

function love.update(dt)
    if state ~= "playing" then return end
    timer = timer + dt
    if timer < SPEED then return end
    timer = timer - SPEED

    dir = nextDir

    -- Nouvelle tête
    local head = snake[1]
    local newHead = { x = head.x + dir.x, y = head.y + dir.y }

    -- Collision murs
    if newHead.x < 1 or newHead.x > COLS or newHead.y < 1 or newHead.y > ROWS then
        state = "gameover"
        return
    end

    -- Collision avec soi-même
    for _, s in ipairs(snake) do
        if s.x == newHead.x and s.y == newHead.y then
            state = "gameover"
            return
        end
    end

    table.insert(snake, 1, newHead)

    -- Mange la nourriture
    if newHead.x == food.x and newHead.y == food.y then
        score = score + 1
        food = randomFood()
    else
        table.remove(snake)
    end
end

function love.draw()
    -- Fond
    love.graphics.setColor(0.1, 0.1, 0.1)
    love.graphics.rectangle("fill", 0, 0, W, H)

    -- Grille subtile
    love.graphics.setColor(0.15, 0.15, 0.15)
    for x = 0, COLS - 1 do
        love.graphics.line(x * CELL, 0, x * CELL, H)
    end
    for y = 0, ROWS - 1 do
        love.graphics.line(0, y * CELL, W, y * CELL)
    end

    -- Nourriture
    love.graphics.setColor(0.95, 0.3, 0.3)
    love.graphics.rectangle("fill",
        (food.x - 1) * CELL + 3,
        (food.y - 1) * CELL + 3,
        CELL - 6, CELL - 6,
        4, 4)

    -- Serpent
    for i, s in ipairs(snake) do
        local ratio = 1 - (i - 1) / #snake
        love.graphics.setColor(0.2 + ratio * 0.3, 0.7 + ratio * 0.2, 0.2)
        love.graphics.rectangle("fill",
            (s.x - 1) * CELL + 1,
            (s.y - 1) * CELL + 1,
            CELL - 2, CELL - 2,
            3, 3)
    end

    -- Tête plus claire
    local h = snake[1]
    love.graphics.setColor(0.6, 1.0, 0.4)
    love.graphics.rectangle("fill",
        (h.x - 1) * CELL + 1,
        (h.y - 1) * CELL + 1,
        CELL - 2, CELL - 2,
        3, 3)

    -- Score
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score : " .. score, 8, 6)

    -- Game Over
    if state == "gameover" then
        love.graphics.setColor(0, 0, 0, 0.6)
        love.graphics.rectangle("fill", 0, 0, W, H)

        love.graphics.setColor(0.95, 0.3, 0.3)
        love.graphics.printf("GAME OVER", 0, H / 2 - 40, W, "center")

        love.graphics.setColor(1, 1, 1)
        love.graphics.printf("Score : " .. score, 0, H / 2, W, "center")
        love.graphics.printf("Appuie sur Entrée pour rejouer", 0, H / 2 + 30, W, "center")
    end
end
