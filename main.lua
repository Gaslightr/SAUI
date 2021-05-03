--[[
    Simple Ass UI
    Created by Gaslighter
    V1.0
]]

local plr = game.Players.LocalPlayer
local cam = workspace.CurrentCamera
local uis = game:GetService("UserInputService")
local ui = {
    y = 32,
    non = {},
    interactive = {},
    selected = 1,
    active = true
}

function draw(t, p)
    local d = Drawing.new(t)
    for i, t in next, p do
        d[i] = t
    end
    return d
end

function ui:CreateHeader(name)
    local h = {}
    h.bg = draw("Square", {
        Visible = true,
        Transparency = 1,
        Position = Vector2.new(10, ui.y),
        Color = Color3.new(0, 0, 0),
        Filled = true
    })
    h.text = draw("Text", {
        Visible = true,
        Transparency = 1,
        Position = Vector2.new(10, ui.y),
        Size = 16,
        Text = name,
        Font = Drawing.Fonts.Monospace,
        Color = Color3.new(1, 1, 1)
    })
    h.bg.Position -= Vector2.new(4, 4)
    h.bg.Size = h.text.TextBounds+Vector2.new(8, 8)
    ui.y += h.text.TextBounds.Y+8
    table.insert(ui.non, h)
    return h
end

function ui:CreateButton(name, callback)
    local b = {
        name = name,
        type = "Button",
        callback = callback
    }
    b.bg = draw("Square", {
        Visible = true,
        Transparency = 1,
        Position = Vector2.new(20, ui.y),
        Color = Color3.new(0, 0, 0),
        Filled = true
    })
    b.text = draw("Text", {
        Visible = true,
        Transparency = 1,
        Position = Vector2.new(20, ui.y),
        Size = 16,
        Text = #ui.interactive == 0 and "> "..name or name,
        Font = Drawing.Fonts.Monospace,
        Color = Color3.new(1, 1, 1)
    })
    b.bg.Position -= Vector2.new(4, 4)
    b.bg.Size = b.text.TextBounds+Vector2.new(8, 8)
    ui.y += b.text.TextBounds.Y+8
    table.insert(ui.interactive, b)
    return b
end

function ui:CreateToggle(name, on, callback)
    local t = {
        name = name,
        type = "Toggle",
        on = on,
        callback = callback
    }
    t.bg = draw("Square", {
        Visible = true,
        Transparency = 1,
        Position = Vector2.new(20, ui.y),
        Color = Color3.new(0, 0, 0),
        Filled = true
    })
    t.text = draw("Text", {
        Visible = true,
        Transparency = 1,
        Position = Vector2.new(20, ui.y),
        Size = 16,
        Text = #ui.interactive == 0 and "> "..name or name,
        Font = Drawing.Fonts.Monospace,
        Color = on and Color3.fromRGB(235, 175, 0) or Color3.new(1, 1, 1)
    })
    t.bg.Position -= Vector2.new(4, 4)
    t.bg.Size = t.text.TextBounds+Vector2.new(8, 8)
    ui.y += t.text.TextBounds.Y+8
    table.insert(ui.interactive, t)
    return t
end

function ui:CreateSlider(name, min, max, current, callback)
    local s = {
        name = name,
        type = "Slider",
        value = current,
        min = min,
        max = max,
        callback = callback
    }
    s.bg = draw("Square", {
        Visible = true,
        Transparency = 1,
        Position = Vector2.new(20, ui.y),
        Color = Color3.new(0, 0, 0),
        Filled = true
    })
    s.text = draw("Text", {
        Visible = true,
        Transparency = 1,
        Position = Vector2.new(20, ui.y),
        Size = 16,
        Text = #ui.interactive == 0 and "> "..name.." ("..tostring(current)..")" or name.." ("..tostring(current)..")",
        Font = Drawing.Fonts.Monospace,
        Color = on and Color3.fromRGB(235, 175, 0) or Color3.new(1, 1, 1)
    })
    s.bg.Position -= Vector2.new(4, 4)
    s.bg.Size = s.text.TextBounds+Vector2.new(8, 8)
    ui.y += s.text.TextBounds.Y+8
    table.insert(ui.interactive, s)
    return s
end

function ui:ToggleVisiblity()
    ui.active = not ui.active
    print(ui.active)
    for i, t in next, ui.non do
        t.bg.Visible = ui.active
        t.text.Visible = ui.active
    end
    for i, t in next, ui.interactive do
        t.bg.Visible = ui.active
        t.text.Visible = ui.active
    end
end

function updateui()
    for i, t in next, ui.interactive do
        if i == ui.selected then
            if t.type == "Toggle" or t.type == "Button" then
                t.text.Text = "> "..t.name
            end
            if t.type == "Slider" then
                t.text.Text = "> "..t.name.." ("..tostring(t.value)..")"
            end
        else
            if t.type == "Toggle" or t.type == "Button" then
                t.text.Text = t.name
            end
            if t.type == "Slider" then
                t.text.Text = t.name.." ("..tostring(t.value)..")"
            end
        end
        t.bg.Size = t.text.TextBounds+Vector2.new(8, 8)
        t.bg.Position = t.text.Position-Vector2.new(4, 4)
    end
end

function inputhandler(object)
    if object.UserInputType == Enum.UserInputType.Keyboard then
        if ui.active and object.KeyCode == Enum.KeyCode.KeypadNine then -- Toggle
            ui:ToggleVisiblity()
        end
        if object.KeyCode == Enum.KeyCode.KeypadTwo then -- UP
            ui.selected += 1
            if ui.selected > #ui.interactive then
                ui.selected = 1
            end
            updateui()
        end
        if ui.active and object.KeyCode == Enum.KeyCode.KeypadEight then -- DOWN
            ui.selected -= 1
            if ui.selected < 1 then
                ui.selected = #ui.interactive
            end
            updateui()
        end
        if ui.active and object.KeyCode == Enum.KeyCode.KeypadFive then -- SELECT
            local object = ui.interactive[ui.selected]
            if object.type == "Button" and object.callback then
                object.callback()
            end
            if object.type == "Toggle" then
                object.on = not object.on
                object.text.Color = object.on and Color3.fromRGB(235, 175, 0) or Color3.new(1, 1, 1)
                if object.callback then
                    object.callback(object.on)
                end
            end
        end
        if ui.active and object.KeyCode == Enum.KeyCode.KeypadFour then -- LEFT
            local object = ui.interactive[ui.selected]
            if object.type == "Slider" then
                object.value -= 1 
                if object.value < object.min then
                    object.value = object.max
                end
                if object.callback then
                    object.callback(object.value)
                end
                updateui()
            end
        end
        if object.KeyCode == Enum.KeyCode.KeypadSix then -- RIGHT
            local object = ui.interactive[ui.selected]
            if object.type == "Slider" then
                object.value += 1 
                if object.value > object.max then
                    object.value = object.min
                end
                if object.callback then
                    object.callback(object.value)
                end
                updateui()
            end
        end
    end
end

uis.InputBegan:Connect(inputhandler)

return ui 
