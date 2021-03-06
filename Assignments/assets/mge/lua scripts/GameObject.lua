GameObject = { name = "nil", x = 0, y = 0, z = 0 }

--creates a GameObject
function GameObject:new (obj)

	obj = obj or {}   -- create object if user does not provide one
	setmetatable(obj, self) -- obj metatable is of type GameObject
	self.__index = self
	
	if obj.name == "nil" then
		error "Error creating GameObject: no name specified"
		return nil
	end
	
	if exists(obj.name) then
		error "error creating GameObject: object already exists"
		return nil
	end
	
	spawn(obj.name, obj.x, obj.y, obj.z)
	
	return obj
end


--gets the gameObject by name
function GameObject:get(name)
	
	if not exists(name) then
		error "error getting GameObject: object doesn't exist"
		return nil
	end
	
	pos = getPos(name)
	
	obj = {name = name, x = pos[1], y = pos[2], z = pos[3]}
	setmetatable(obj, self)
	self.__index = self
	
	return obj
end


--gets the position of the gameObject
function GameObject:getPos()

	if not exists(self.name) then
		error "error getting position: object doesn't exist"
		return nil
	end
	
	self.x, self.y, self.z = getPos(self.name)
	
	return {self.x, self.y, self.z}
end


--sets the position of the GameObject
function GameObject:setPos(x, y, x)
	pos = v2s(self.x, self.y, self.z)

	self.x = x
	self.y = y
	self.z = z
	
	--move(name, x, y, z)
	print("Moved " .. self.name .. " from " .. pos .. " to " .. self:v2s())	
end


--moves a GameObject, by adding (or subtracting) from the original position
function GameObject:move(x, y, z)
	pos = v2s(self.x, self.y, self.z)
	
	self.x = self.x + x
	self.y = self.y + y
	self.z = self.z + z
end
	
	
--renames the GameObject
function GameObject:rename(name)
	rename(self.name, name)
	self.name = name
end


--deletes the GameObject
function GameObject:delete()
	delete(self.name)
end
	
	
--prints information about the GameObject
function GameObject:info()
	print(self.name .. ": " .. self:v2s())
end
	
	
--returns the positon of the GameObject
function GameObject:v2s()
	return v2s(self.x, self.y, self.z)
end


--returns a string vector from 3 components
function v2s(x, y, z)
	return "(" .. x .. "," .. y .. "," .. z .. ")"
end
