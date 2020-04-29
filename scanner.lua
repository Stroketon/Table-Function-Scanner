local function Return(i, v)
    local v = v or "getupvalues"
    if typeof(i) == "table" then
        return i
    elseif typeof(i) == "function" then
        return debug[v](i)
    else
        return {}
    end
end

local function FindLocal(i, v)
    for i1, v1 in next, getgc() do
        if tostring(i1) == i and v then return getgc() elseif tostring(i1) == i then return v1 end
        for i2, v2 in next, Return(v1) do
            if tostring(i2) == i and v then return v1 elseif tostring(i2) == i then return v2 end
            for i3, v3 in next, Return(v2) do
                if tostring(i3) == i and v then return v2 elseif tostring(i3) == i then return v3 end
            end
        end
    end
end