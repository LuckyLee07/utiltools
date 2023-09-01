-----------------------一些实用小方法--------------------------
-- 去掉字符串首尾空格
function string.trim(strx)
   return (string.gsub(strx, "^%s*(.-)%s*$", "%1"))
end

-- 分割字符串
function string.split(str, mark)

 	if string.len(str)==0 then return nil end
 
	local index = 1
	local tbl_sub = {}
	while true do
		local pos = string.find(str, mark, index, true)
	   	if not pos then break end

	    table.insert(tbl_sub, string.sub(str, index, pos-1))
	    index = pos + string.len(mark)
	end
  	table.insert (tbl_sub, string.sub(str, index))

	return tbl_sub
end

-- table转换成string
local function __th_tostring(tbl)

	local function _tostrx(param)
		local result = tostring(param)
		local pattrs = string.sub(result, -8)

		local ptype = type(param)
		if ptype == "table" then
			result = ('table: 0x%s'):format(pattrs)
		elseif ptype == "function" then
			result = ('function: 0x%s'):format(pattrs)
		elseif ptype == "userdata" then
			result = ('userdata: 0x%s'):format(pattrs)
		end
		return result
	end

	local function get_key(key, level)
		local keystr = nil
		local ptype = type(key)

		if ptype == "number" then
			keystr = ('[%d]'):format(key)
        elseif ptype == "string" then
			keystr = ('[%q]'):format(key)
        else
			keystr = ('[%s]'):format(_tostrx(key))
		end
		return ('  '):rep(level) .. keystr
	end

	local function get_value(value)
		if type(value) == "number" then
			value = ('%d'):format(value)
        elseif type(value) == "string" then
            value = ('%q'):format(value)
        else
			value = ('%s'):format(_tostrx(value))
		end
		return value
	end

	local ref_cache = {} -- 记录ref
    local function get_table(ptbl, level)
    	ref_cache[ptbl] = true
    	local tmpstr = _tostrx(ptbl)
        local buffer = ('{ --%s\n'):format(tmpstr)

		local key, value = next(ptbl, nil)
		while key ~= nil do
			local _key = get_key(key, level)
			local __key = _key .. ' : '
            if type(value) == "table" then
				if ref_cache[value] then
					buffer = buffer .. __key ..('ref%q').format(_tostrx(value)) 
				else
					buffer = buffer .. __key .. get_table(value, level+1) 
				end
            else
				buffer = buffer .. __key .. get_value(value)
            end

            key, value = next(ptbl, key)
            buffer = buffer .. (key and ',\n' or '\n')
		end
        buffer = buffer .. ('  '):rep(level-1) .. '}'
        return buffer
    end
    return get_table(tbl, 1)
end
table.tostring = __th_tostring


-- 封装print支持打印table
local __print = _G.print;
_G.print = function( ... )
	local args = {...}
	local n_args = {}
	for key, value in ipairs(args) do
		if type(value) ~= 'table' then
			n_args[key] = value
		else
			n_args[key] = table.tostring(value)
		end
	end
	__print(table.unpack(n_args))
end
