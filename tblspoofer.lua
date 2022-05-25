local function spoofTable(tbl)
    assert(type(tbl) == "table", "Pass me a table")
    local siz = #tbl
   -- if not siz or siz == 0 then return end
    for i = 1, siz do
        table.insert(tbl,1, nil)    
    end
    table.insert(tbl, nil)
    return tbl
end
