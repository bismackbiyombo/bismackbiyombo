--nothing in here has to be touched im lazy
function search()
    -- if you're wondering why I didn't just add the visible line with the rest of the script don't ask i'm lazy
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Overlay.ServerFrame.Servers:GetChildren()) do
        if v:IsA("TextButton") then
            v.Visible = false
        end
    end
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Overlay.ServerFrame.Servers:GetChildren()) do
        if v:IsA("TextButton") and v:FindFirstChild("Age") then
            if v.Age.Text ~= "???" then
                raw = string.gsub(v.Age.Text, "%s+", "")
                local rd,rh,rm = raw:match('^(.-)d'), raw:match('^(.-)h'), raw:match('^(.-)m')
                local d = tonumber(rd)
                local hr = string.gsub(rh, rd .. "d", "")
                local m = string.gsub(rm, d .. "d" .. hr .. "h", "")
                if d>=_G.tosearch.Days and tonumber(hr)>=_G.tosearch.Hours and tonumber(m)>=_G.tosearch.Minutes then
                    v.Visible = true
                end
            end
        end
    end
end

search()
game:GetService("Players").LocalPlayer.PlayerGui.LoadingGui.Overlay.ServerFrame.Servers.Changed:Connect(function()
    search()
end)
