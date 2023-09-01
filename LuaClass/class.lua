--生成类的方法
ClassList = {}

function Class(clsname, super)
    local curClass = {}
    curClass.super = super
    curClass.__type__ = "class"
    curClass.__cls__ = clsname
	
	local _info = debug.getinfo(2, "S");
    local __path = string.sub(_info.source, 2, -1);
	curClass.__path__ = __path;
	
    local function getInstance(param)
        local instance = {}
        setmetatable(instance,{__index = curClass})

        local function create(tempClass,param)
            if tempClass.super then 
                setmetatable(tempClass,{__index = tempClass.super})
                create(tempClass.super,param)
            end 
            if tempClass.Init then 
                tempClass.Init(instance,param)
            end 
        end 

        create(curClass,param)

        return instance
    end

    curClass.new = function(param)
        if curClass.GetInst then
            print("单例类不能通过NEW的方式创建")
            return nil
        end 
        return getInstance(param)
    end

    curClass.instance = function(param)
        return getInstance(param)
    end

    ClassList[curClass.__cls__] = curClass

    return curClass
end


--获取单例类实例
function GetInst(clsname)
    if clsname == nil then
        print("======GetInst nil =======")
        return nil
    end
    if ClassList[clsname] == nil then
        return  nil
    end     
    return ClassList[clsname]:GetInst()
end

