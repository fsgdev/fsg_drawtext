local texts = {}
local baseY = 0.54
local yOffset = 0.035
local fadeSpeed = 3
local moveSpeed = 0.002

function DrawFadingText(text, duration)
    local fadeAlpha = 255
    local displayTime = duration or 500

    local startY = baseY - (#texts * yOffset)

    table.insert(texts, {
        text = text,
        alpha = fadeAlpha,
        yPos = startY,
        startTime = GetGameTimer(),
        displayTime = displayTime,
        active = true
    })

    if #texts == 1 then
        Citizen.CreateThread(function()
            while #texts > 0 do
                Citizen.Wait(0)
                local currentTime = GetGameTimer()

                for k, v in ipairs(texts) do
                    local elapsedTime = currentTime - v.startTime

                    if elapsedTime > v.displayTime then
                        v.alpha = math.max(0, v.alpha - fadeSpeed)
                        v.yPos = v.yPos - moveSpeed

                        if v.alpha <= 0 then
                            v.active = false
                        end
                    end

                    if v.active then
                        DrawTextOnScreen(v.text, v.alpha, v.yPos)
                    end
                end

                for i = #texts, 1, -1 do
                    if not texts[i].active then
                        table.remove(texts, i)
                    end
                end
            end
        end)
    end
end

function DrawTextOnScreen(text, alpha, yPos)
    SetTextScale(0.47, 0.47)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextCentre(true)
    SetTextColour(255, 255, 255, alpha)
    SetTextOutline()

    SetTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawText(0.5, yPos)
end

RegisterNetEvent("fsg_drawtext:displayText")
AddEventHandler("fsg_drawtext:displayText", function(text, duration)
    DrawFadingText(text, duration)
end)

exports('displayText', DrawFadingText)