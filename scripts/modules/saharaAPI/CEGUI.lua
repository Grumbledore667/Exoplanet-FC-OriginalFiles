-----------------------------------------------
-- LuaDoc generated with tolua++

 CEGUI = {}

 CEGUI.AM_IGNORE = 1
 CEGUI.AM_SHRINK = 2
 CEGUI.AM_EXPAND = 3
 CEGUI.XREA_RETURN = 1
 CEGUI.XREA_REPLACE = 2
 CEGUI.XREA_THROW = 3
---------------------------------------------------------------------------------
---Vector2f
---@class CEGUI.Vector2_float_
 local Vector2f = {}
 CEGUI.Vector2_float_ = Vector2f
 CEGUI.Vector2f = Vector2f


---
-- @field [parent=#CEGUI.Vector2_float_] #number x

---
-- @field [parent=#CEGUI.Vector2_float_] #number y

---.add
---@param vec CEGUI.Vector2_float_
---@return CEGUI.Vector2_float_
 function CEGUI.Vector2_float_:__add(vec) end

---.sub
---@param vec CEGUI.Vector2_float_
---@return CEGUI.Vector2_float_
 function CEGUI.Vector2_float_:__sub(vec) end

---.mul
---@param vec CEGUI.Vector2_float_
---@return CEGUI.Vector2_float_
 function CEGUI.Vector2_float_:__mul(vec) end

---.eq
---@param vec CEGUI.Vector2_float_
---@return boolean
 function CEGUI.Vector2_float_:__eq(vec) end

---new
---@return CEGUI.Vector2_float_
 function CEGUI.Vector2_float_:new() end

---
-- new_local 
-- @function [parent=#CEGUI.Vector2_float_] new_local
-- @param self
-- @return #CEGUI.Vector2_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Vector2_float_
-- @param self
-- @return #CEGUI.Vector2_float_

---new
---@param x number
---@param y number
---@return CEGUI.Vector2_float_
 function CEGUI.Vector2_float_:new(x, y) end

---
-- new_local 
-- @function [parent=#CEGUI.Vector2_float_] new_local
-- @param self
-- @param #number x
-- @param #number y
-- @return #CEGUI.Vector2_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Vector2_float_
-- @param self
-- @return #CEGUI.Vector2_float_


---------------------------------------------------------------------------------
---Vector3f
---@class CEGUI.Vector3_float_
 local Vector3f = {}
 CEGUI.Vector3_float_ = Vector3f
 CEGUI.Vector3f = Vector3f


---
-- @field [parent=#CEGUI.Vector3_float_] #number x

---
-- @field [parent=#CEGUI.Vector3_float_] #number y

---
-- @field [parent=#CEGUI.Vector3_float_] #number z

---.eq
---@param vec CEGUI.Vector3_float_
---@return boolean
 function CEGUI.Vector3_float_:__eq(vec) end

---new
---@return CEGUI.Vector3_float_
 function CEGUI.Vector3_float_:new() end

---
-- new_local 
-- @function [parent=#CEGUI.Vector3_float_] new_local
-- @param self
-- @return #CEGUI.Vector3_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Vector3_float_
-- @param self
-- @return #CEGUI.Vector3_float_

---new
---@param x number
---@param y number
---@param z number
---@return CEGUI.Vector3_float_
 function CEGUI.Vector3_float_:new(x, y, z) end

---
-- new_local 
-- @function [parent=#CEGUI.Vector3_float_] new_local
-- @param self
-- @param #number x
-- @param #number y
-- @param #number z
-- @return #CEGUI.Vector3_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Vector3_float_
-- @param self
-- @return #CEGUI.Vector3_float_


---------------------------------------------------------------------------------
---Sizef
---@class CEGUI.Size_float_
 local Sizef = {}
 CEGUI.Size_float_ = Sizef
 CEGUI.Sizef = Sizef


---
-- @field [parent=#CEGUI.Size_float_] #number width

---
-- @field [parent=#CEGUI.Size_float_] #number height

---.eq
---@param sz CEGUI.Size_float_
---@return boolean
 function CEGUI.Size_float_:__eq(sz) end

---clamp
---@param min CEGUI.Size_float_
---@param max CEGUI.Size_float_
 function CEGUI.Size_float_:clamp(min, max) end

---scaleToAspect
---@param mode CEGUI.AspectMode
---@param ratio number
 function CEGUI.Size_float_:scaleToAspect(mode, ratio) end

---new
---@return CEGUI.Size_float_
 function CEGUI.Size_float_:new() end

---
-- new_local 
-- @function [parent=#CEGUI.Size_float_] new_local
-- @param self
-- @return #CEGUI.Size_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Size_float_
-- @param self
-- @return #CEGUI.Size_float_

---new
---@param w number
---@param h number
---@return CEGUI.Size_float_
 function CEGUI.Size_float_:new(w, h) end

---
-- new_local 
-- @function [parent=#CEGUI.Size_float_] new_local
-- @param self
-- @param #number w
-- @param #number h
-- @return #CEGUI.Size_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Size_float_
-- @param self
-- @return #CEGUI.Size_float_


---------------------------------------------------------------------------------
---Rectf
---@class CEGUI.Rect_float_
 local Rectf = {}
 CEGUI.Rect_float_ = Rectf
 CEGUI.Rectf = Rectf


---
-- @field [parent=#CEGUI.Rect_float_] #CEGUI.Vector2_float_ min

---
-- @field [parent=#CEGUI.Rect_float_] #CEGUI.Vector2_float_ max

---new
---@return CEGUI.Rect_float_
 function CEGUI.Rect_float_:new() end

---
-- new_local 
-- @function [parent=#CEGUI.Rect_float_] new_local
-- @param self
-- @return #CEGUI.Rect_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Rect_float_
-- @param self
-- @return #CEGUI.Rect_float_

---new
---@param left number
---@param top number
---@param right number
---@param bottom number
---@return CEGUI.Rect_float_
 function CEGUI.Rect_float_:new(left, top, right, bottom) end

---
-- new_local 
-- @function [parent=#CEGUI.Rect_float_] new_local
-- @param self
-- @param #number left
-- @param #number top
-- @param #number right
-- @param #number bottom
-- @return #CEGUI.Rect_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Rect_float_
-- @param self
-- @return #CEGUI.Rect_float_

---new
---@param min CEGUI.Vector2_float_
---@param max CEGUI.Vector2_float_
---@return CEGUI.Rect_float_
 function CEGUI.Rect_float_:new(min, max) end

---
-- new_local 
-- @function [parent=#CEGUI.Rect_float_] new_local
-- @param self
-- @param #CEGUI.Vector2_float_ min
-- @param #CEGUI.Vector2_float_ max
-- @return #CEGUI.Rect_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Rect_float_
-- @param self
-- @return #CEGUI.Rect_float_

---new
---@param pos CEGUI.Vector2_float_
---@param size CEGUI.Size_float_
---@return CEGUI.Rect_float_
 function CEGUI.Rect_float_:new(pos, size) end

---
-- new_local 
-- @function [parent=#CEGUI.Rect_float_] new_local
-- @param self
-- @param #CEGUI.Vector2_float_ pos
-- @param #CEGUI.Size_float_ size
-- @return #CEGUI.Rect_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Rect_float_
-- @param self
-- @return #CEGUI.Rect_float_

---new
---@param r CEGUI.Rect_float_
---@return CEGUI.Rect_float_
 function CEGUI.Rect_float_:new(r) end

---
-- new_local 
-- @function [parent=#CEGUI.Rect_float_] new_local
-- @param self
-- @param #CEGUI.Rect_float_ r
-- @return #CEGUI.Rect_float_

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Rect_float_
-- @param self
-- @return #CEGUI.Rect_float_

---left
---@param v number
 function CEGUI.Rect_float_:left(v) end

---top
---@param v number
 function CEGUI.Rect_float_:top(v) end

---right
---@param v number
 function CEGUI.Rect_float_:right(v) end

---bottom
---@param v number
 function CEGUI.Rect_float_:bottom(v) end

---left
---@return number
 function CEGUI.Rect_float_:left() end

---top
---@return number
 function CEGUI.Rect_float_:top() end

---right
---@return number
 function CEGUI.Rect_float_:right() end

---bottom
---@return number
 function CEGUI.Rect_float_:bottom() end

---setPosition
---@param min CEGUI.Vector2_float_
 function CEGUI.Rect_float_:setPosition(min) end

---getPosition
---@return CEGUI.Vector2_float_
 function CEGUI.Rect_float_:getPosition() end

---setSize
---@param size CEGUI.Size_float_
 function CEGUI.Rect_float_:setSize(size) end

---getSize
---@return CEGUI.Size_float_
 function CEGUI.Rect_float_:getSize() end

---setWidth
---@param w number
 function CEGUI.Rect_float_:setWidth(w) end

---getWidth
---@return number
 function CEGUI.Rect_float_:getWidth() end

---setHeight
---@param h number
 function CEGUI.Rect_float_:setHeight(h) end

---getHeight
---@return number
 function CEGUI.Rect_float_:getHeight() end

---getIntersection
---@param rect CEGUI.Rect_float_
---@return CEGUI.Rect_float_
 function CEGUI.Rect_float_:getIntersection(rect) end

---offset
---@param v CEGUI.Vector2_float_
 function CEGUI.Rect_float_:offset(v) end

---isPointInRect
---@param v CEGUI.Vector2_float_
---@return boolean
 function CEGUI.Rect_float_:isPointInRect(v) end

---constrainSizeMax
---@param size CEGUI.Size_float_
 function CEGUI.Rect_float_:constrainSizeMax(size) end

---constrainSizeMin
---@param size CEGUI.Size_float_
 function CEGUI.Rect_float_:constrainSizeMin(size) end

---constrainSize
---@param max_sz CEGUI.Size_float_
---@param min_sz CEGUI.Size_float_
 function CEGUI.Rect_float_:constrainSize(max_sz, min_sz) end

---.eq
---@param rhs CEGUI.Rect_float_
---@return boolean
 function CEGUI.Rect_float_:__eq(rhs) end

---.mul
---@param scalar number
---@return CEGUI.Rect_float_
 function CEGUI.Rect_float_:__mul(scalar) end

---.add
---@param r CEGUI.Rect_float_
---@return CEGUI.Rect_float_
 function CEGUI.Rect_float_:__add(r) end


---------------------------------------------------------------------------------
---Quaternion
---@class CEGUI.Quaternion
 local Quaternion = {}
 CEGUI.Quaternion = Quaternion
 CEGUI.Quaternion = Quaternion


---
-- @field [parent=#CEGUI.Quaternion] #number w

---
-- @field [parent=#CEGUI.Quaternion] #number x

---
-- @field [parent=#CEGUI.Quaternion] #number y

---
-- @field [parent=#CEGUI.Quaternion] #number z

---
-- @field [parent=#CEGUI.Quaternion] #CEGUI.Quaternion ZERO

---
-- @field [parent=#CEGUI.Quaternion] #CEGUI.Quaternion IDENTITY

---eulerAnglesRadians
---@param x number
---@param y number
---@param z number
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:eulerAnglesRadians(x, y, z) end

---eulerAnglesDegrees
---@param x number
---@param y number
---@param z number
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:eulerAnglesDegrees(x, y, z) end

---axisAngleRadians
---@param axis CEGUI.Vector3_float_
---@param rotation number
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:axisAngleRadians(axis, rotation) end

---axisAngleDegrees
---@param axis CEGUI.Vector3_float_
---@param rotation number
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:axisAngleDegrees(axis, rotation) end

---slerp
---@param left CEGUI.Quaternion
---@param right CEGUI.Quaternion
---@param position number
---@param shortestPath boolean
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:slerp(left, right, position, shortestPath) end

---new
---@param w number
---@param x number
---@param y number
---@param z number
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:new(w, x, y, z) end

---
-- new_local 
-- @function [parent=#CEGUI.Quaternion] new_local
-- @param self
-- @param #number w
-- @param #number x
-- @param #number y
-- @param #number z
-- @return #CEGUI.Quaternion

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Quaternion
-- @param self
-- @return #CEGUI.Quaternion

---new
---@param v CEGUI.Quaternion
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:new(v) end

---
-- new_local 
-- @function [parent=#CEGUI.Quaternion] new_local
-- @param self
-- @param #CEGUI.Quaternion v
-- @return #CEGUI.Quaternion

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Quaternion
-- @param self
-- @return #CEGUI.Quaternion

---.eq
---@param v CEGUI.Quaternion
---@return boolean
 function CEGUI.Quaternion:__eq(v) end

---.sub
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:__sub() end

---.add
---@param v CEGUI.Quaternion
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:__add(v) end

---.mul
---@param v CEGUI.Quaternion
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:__mul(v) end

---.mul
---@param v number
---@return CEGUI.Quaternion
 function CEGUI.Quaternion:__mul(v) end

---dot
---@param v CEGUI.Quaternion
---@return number
 function CEGUI.Quaternion:dot(v) end

---length
---@return number
 function CEGUI.Quaternion:length() end

---normalise
---@return number
 function CEGUI.Quaternion:normalise() end


---------------------------------------------------------------------------------
---Colour
---@class CEGUI.Colour
 local Colour = {}
 CEGUI.Colour = Colour
 CEGUI.Colour = Colour


---getAlpha
---@return number
 function CEGUI.Colour:getAlpha() end

---getRed
---@return number
 function CEGUI.Colour:getRed() end

---getGreen
---@return number
 function CEGUI.Colour:getGreen() end

---getBlue
---@return number
 function CEGUI.Colour:getBlue() end

---getHue
---@return number
 function CEGUI.Colour:getHue() end

---getSaturation
---@return number
 function CEGUI.Colour:getSaturation() end

---getLumination
---@return number
 function CEGUI.Colour:getLumination() end

---set
---@param r number
---@param g number
---@param b number
---@param a number
 function CEGUI.Colour:set(r, g, b, a) end

---setAlpha
---@param a number
 function CEGUI.Colour:setAlpha(a) end

---setRed
---@param r number
 function CEGUI.Colour:setRed(r) end

---setGreen
---@param g number
 function CEGUI.Colour:setGreen(g) end

---setBlue
---@param b number
 function CEGUI.Colour:setBlue(b) end

---setRGB
---@param r number
---@param g number
---@param b number
 function CEGUI.Colour:setRGB(r, g, b) end

---setHSL
---@param hue number
---@param saturation number
---@param luminance number
---@param alpha number
 function CEGUI.Colour:setHSL(hue, saturation, luminance, alpha) end

---.add
---@param c CEGUI.Colour
---@return CEGUI.Colour
 function CEGUI.Colour:__add(c) end

---.sub
---@param c CEGUI.Colour
---@return CEGUI.Colour
 function CEGUI.Colour:__sub(c) end

---.eq
---@param c CEGUI.Colour
---@return boolean
 function CEGUI.Colour:__eq(c) end

---new
---@return CEGUI.Colour
 function CEGUI.Colour:new() end

---
-- new_local 
-- @function [parent=#CEGUI.Colour] new_local
-- @param self
-- @return #CEGUI.Colour

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Colour
-- @param self
-- @return #CEGUI.Colour

---new
---@param r number
---@param g number
---@param b number
---@param a number
---@return CEGUI.Colour
 function CEGUI.Colour:new(r, g, b, a) end

---
-- new_local 
-- @function [parent=#CEGUI.Colour] new_local
-- @param self
-- @param #number r
-- @param #number g
-- @param #number b
-- @param #number a
-- @return #CEGUI.Colour

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Colour
-- @param self
-- @return #CEGUI.Colour


---------------------------------------------------------------------------------
---ColourRect
---@class CEGUI.ColourRect
 local ColourRect = {}
 CEGUI.ColourRect = ColourRect
 CEGUI.ColourRect = ColourRect


---
-- @field [parent=#CEGUI.ColourRect] #CEGUI.Colour top_left

---
-- @field [parent=#CEGUI.ColourRect] #CEGUI.Colour top_right

---
-- @field [parent=#CEGUI.ColourRect] #CEGUI.Colour bottom_left

---
-- @field [parent=#CEGUI.ColourRect] #CEGUI.Colour bottom_right

---setAlpha
---@param alpha number
 function CEGUI.ColourRect:setAlpha(alpha) end

---setTopAlpha
---@param alpha number
 function CEGUI.ColourRect:setTopAlpha(alpha) end

---setBottomAlpha
---@param alpha number
 function CEGUI.ColourRect:setBottomAlpha(alpha) end

---setLeftAlpha
---@param alpha number
 function CEGUI.ColourRect:setLeftAlpha(alpha) end

---setRightAlpha
---@param alpha number
 function CEGUI.ColourRect:setRightAlpha(alpha) end

---modulateAlpha
---@param alpha number
 function CEGUI.ColourRect:modulateAlpha(alpha) end

---setColours
---@param col CEGUI.Colour
 function CEGUI.ColourRect:setColours(col) end

---isMonochromatic
---@return boolean
 function CEGUI.ColourRect:isMonochromatic() end

---getSubRectangle
---@param left number
---@param right number
---@param top number
---@param bottom number
---@return CEGUI.ColourRect
 function CEGUI.ColourRect:getSubRectangle(left, right, top, bottom) end

---getColourAtPoint
---@param x number
---@param y number
---@return CEGUI.Colour
 function CEGUI.ColourRect:getColourAtPoint(x, y) end

---new
---@return CEGUI.ColourRect
 function CEGUI.ColourRect:new() end

---
-- new_local 
-- @function [parent=#CEGUI.ColourRect] new_local
-- @param self
-- @return #CEGUI.ColourRect

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ColourRect
-- @param self
-- @return #CEGUI.ColourRect

---new
---@param col CEGUI.Colour
---@return CEGUI.ColourRect
 function CEGUI.ColourRect:new(col) end

---
-- new_local 
-- @function [parent=#CEGUI.ColourRect] new_local
-- @param self
-- @param #CEGUI.Colour col
-- @return #CEGUI.ColourRect

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ColourRect
-- @param self
-- @return #CEGUI.ColourRect

---new
---@param top_left CEGUI.Colour
---@param top_right CEGUI.Colour
---@param bottom_left CEGUI.Colour
---@param bottom_right CEGUI.Colour
---@return CEGUI.ColourRect
 function CEGUI.ColourRect:new(top_left, top_right, bottom_left, bottom_right) end

---
-- new_local 
-- @function [parent=#CEGUI.ColourRect] new_local
-- @param self
-- @param #CEGUI.Colour top_left
-- @param #CEGUI.Colour top_right
-- @param #CEGUI.Colour bottom_left
-- @param #CEGUI.Colour bottom_right
-- @return #CEGUI.ColourRect

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ColourRect
-- @param self
-- @return #CEGUI.ColourRect


---------------------------------------------------------------------------------
---String
---@class CEGUI.String
 local String = {}
 CEGUI.String = String
 CEGUI.String = String


---
-- @field [parent=#CEGUI.String] #number npos

---size
---@return number
 function CEGUI.String:size() end

---length
---@return number
 function CEGUI.String:length() end

---empty
---@return boolean
 function CEGUI.String:empty() end

---capacity
---@return number
 function CEGUI.String:capacity() end

---.seti
---@param i number
---@param tolua_value number
---@return number
 function CEGUI.String:__seti(i, tolua_value) end

---.geti
---@param i number
---@return number
 function CEGUI.String:__geti(i) end

---at
---@param i number
---@return number
 function CEGUI.String:at(i) end

---c_str
---@return string
 function CEGUI.String:c_str() end

---reserve
---@param num number
 function CEGUI.String:reserve(num) end

---resize
---@param num number
 function CEGUI.String:resize(num) end

---resize
---@param num number
---@param codepoint number
 function CEGUI.String:resize(num, codepoint) end

---clear
 function CEGUI.String:clear() end

---erase
---@return CEGUI.String
 function CEGUI.String:erase() end

---erase
---@param idx number
---@param len number
---@return CEGUI.String
 function CEGUI.String:erase(idx, len) end

---replace
---@param begin number
---@param len number
---@param s CEGUI.String
---@return CEGUI.String
 function CEGUI.String:replace(begin, len, s) end

---swap
---@param s CEGUI.String
 function CEGUI.String:swap(s) end

---insert
---@param pos number
---@param s CEGUI.String
---@return CEGUI.String
 function CEGUI.String:insert(pos, s) end

---find
---@param codepoint number
---@param idx number
---@return number
 function CEGUI.String:find(codepoint, idx) end

---rfind
---@param codepoint number
---@param idx number
---@return number
 function CEGUI.String:rfind(codepoint, idx) end

---find
---@param sub CEGUI.String
---@param idx number
---@return number
 function CEGUI.String:find(sub, idx) end

---rfind
---@param sub CEGUI.String
---@param idx number
---@return number
 function CEGUI.String:rfind(sub, idx) end

---substr
---@param idx number
---@param len number
---@return CEGUI.String
 function CEGUI.String:substr(idx, len) end

---push_back
---@param codepoint number
 function CEGUI.String:push_back(codepoint) end

---new
---@return CEGUI.String
 function CEGUI.String:new() end

---
-- new_local 
-- @function [parent=#CEGUI.String] new_local
-- @param self
-- @return #CEGUI.String

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.String
-- @param self
-- @return #CEGUI.String

---new
---@param num number
---@param codepoint number
---@return CEGUI.String
 function CEGUI.String:new(num, codepoint) end

---
-- new_local 
-- @function [parent=#CEGUI.String] new_local
-- @param self
-- @param #number num
-- @param #number codepoint
-- @return #CEGUI.String

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.String
-- @param self
-- @return #CEGUI.String

---new
---@param s string
---@return CEGUI.String
 function CEGUI.String:new(s) end

---
-- new_local 
-- @function [parent=#CEGUI.String] new_local
-- @param self
-- @param #string s
-- @return #CEGUI.String

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.String
-- @param self
-- @return #CEGUI.String

---new
---@param s CEGUI.String
---@return CEGUI.String
 function CEGUI.String:new(s) end

---
-- new_local 
-- @function [parent=#CEGUI.String] new_local
-- @param self
-- @param #CEGUI.String s
-- @return #CEGUI.String

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.String
-- @param self
-- @return #CEGUI.String


---------------------------------------------------------------------------------
---UDim
---@class CEGUI.UDim
 local UDim = {}
 CEGUI.UDim = UDim
 CEGUI.UDim = UDim


---
-- @field [parent=#CEGUI.UDim] #number scale

---
-- @field [parent=#CEGUI.UDim] #number offset

---.add
---@param other CEGUI.UDim
---@return CEGUI.UDim
 function CEGUI.UDim:__add(other) end

---.sub
---@param other CEGUI.UDim
---@return CEGUI.UDim
 function CEGUI.UDim:__sub(other) end

---.div
---@param other CEGUI.UDim
---@return CEGUI.UDim
 function CEGUI.UDim:__div(other) end

---.mul
---@param other CEGUI.UDim
---@return CEGUI.UDim
 function CEGUI.UDim:__mul(other) end

---.eq
---@param other CEGUI.UDim
---@return boolean
 function CEGUI.UDim:__eq(other) end

---new
---@return CEGUI.UDim
 function CEGUI.UDim:new() end

---
-- new_local 
-- @function [parent=#CEGUI.UDim] new_local
-- @param self
-- @return #CEGUI.UDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.UDim
-- @param self
-- @return #CEGUI.UDim

---new
---@param scale number
---@param offset number
---@return CEGUI.UDim
 function CEGUI.UDim:new(scale, offset) end

---
-- new_local 
-- @function [parent=#CEGUI.UDim] new_local
-- @param self
-- @param #number scale
-- @param #number offset
-- @return #CEGUI.UDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.UDim
-- @param self
-- @return #CEGUI.UDim


---------------------------------------------------------------------------------
---UVector2
---@class CEGUI.UVector2
 local UVector2 = {}
 CEGUI.UVector2 = UVector2
 CEGUI.UVector2 = UVector2


---
-- @field [parent=#CEGUI.UVector2] #CEGUI.UDim x

---
-- @field [parent=#CEGUI.UVector2] #CEGUI.UDim y

---.add
---@param other CEGUI.UVector2
---@return CEGUI.UVector2
 function CEGUI.UVector2:__add(other) end

---.sub
---@param other CEGUI.UVector2
---@return CEGUI.UVector2
 function CEGUI.UVector2:__sub(other) end

---.div
---@param other CEGUI.UVector2
---@return CEGUI.UVector2
 function CEGUI.UVector2:__div(other) end

---.mul
---@param other CEGUI.UVector2
---@return CEGUI.UVector2
 function CEGUI.UVector2:__mul(other) end

---.eq
---@param other CEGUI.UVector2
---@return boolean
 function CEGUI.UVector2:__eq(other) end

---new
---@return CEGUI.UVector2
 function CEGUI.UVector2:new() end

---
-- new_local 
-- @function [parent=#CEGUI.UVector2] new_local
-- @param self
-- @return #CEGUI.UVector2

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.UVector2
-- @param self
-- @return #CEGUI.UVector2

---new
---@param scale CEGUI.UDim
---@param offset CEGUI.UDim
---@return CEGUI.UVector2
 function CEGUI.UVector2:new(scale, offset) end

---
-- new_local 
-- @function [parent=#CEGUI.UVector2] new_local
-- @param self
-- @param #CEGUI.UDim scale
-- @param #CEGUI.UDim offset
-- @return #CEGUI.UVector2

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.UVector2
-- @param self
-- @return #CEGUI.UVector2


---------------------------------------------------------------------------------
---USize
---@class CEGUI.USize
 local USize = {}
 CEGUI.USize = USize
 CEGUI.USize = USize


---
-- @field [parent=#CEGUI.USize] #CEGUI.UDim width

---
-- @field [parent=#CEGUI.USize] #CEGUI.UDim height

---.eq
---@param sz CEGUI.USize
---@return boolean
 function CEGUI.USize:__eq(sz) end

---new
---@return CEGUI.USize
 function CEGUI.USize:new() end

---
-- new_local 
-- @function [parent=#CEGUI.USize] new_local
-- @param self
-- @return #CEGUI.USize

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.USize
-- @param self
-- @return #CEGUI.USize

---new
---@param w CEGUI.UDim
---@param h CEGUI.UDim
---@return CEGUI.USize
 function CEGUI.USize:new(w, h) end

---
-- new_local 
-- @function [parent=#CEGUI.USize] new_local
-- @param self
-- @param #CEGUI.UDim w
-- @param #CEGUI.UDim h
-- @return #CEGUI.USize

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.USize
-- @param self
-- @return #CEGUI.USize


---------------------------------------------------------------------------------
---URect
---@class CEGUI.URect
 local URect = {}
 CEGUI.URect = URect
 CEGUI.URect = URect


---
-- @field [parent=#CEGUI.URect] #CEGUI.UVector2 min

---
-- @field [parent=#CEGUI.URect] #CEGUI.UVector2 max

---getPosition
---@return CEGUI.UVector2
 function CEGUI.URect:getPosition() end

---getSize
---@return CEGUI.USize
 function CEGUI.URect:getSize() end

---getWidth
---@return CEGUI.UDim
 function CEGUI.URect:getWidth() end

---getHeight
---@return CEGUI.UDim
 function CEGUI.URect:getHeight() end

---setPosition
---@param pos CEGUI.UVector2
 function CEGUI.URect:setPosition(pos) end

---setSize
---@param sz CEGUI.USize
 function CEGUI.URect:setSize(sz) end

---setWidth
---@param w CEGUI.UDim
 function CEGUI.URect:setWidth(w) end

---setHeight
---@param h CEGUI.UDim
 function CEGUI.URect:setHeight(h) end

---offset
---@param sz CEGUI.UVector2
 function CEGUI.URect:offset(sz) end

---new
---@return CEGUI.URect
 function CEGUI.URect:new() end

---
-- new_local 
-- @function [parent=#CEGUI.URect] new_local
-- @param self
-- @return #CEGUI.URect

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.URect
-- @param self
-- @return #CEGUI.URect

---new
---@param min CEGUI.UVector2
---@param max CEGUI.UVector2
---@return CEGUI.URect
 function CEGUI.URect:new(min, max) end

---
-- new_local 
-- @function [parent=#CEGUI.URect] new_local
-- @param self
-- @param #CEGUI.UVector2 min
-- @param #CEGUI.UVector2 max
-- @return #CEGUI.URect

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.URect
-- @param self
-- @return #CEGUI.URect

---new
---@param left CEGUI.UDim
---@param top CEGUI.UDim
---@param right CEGUI.UDim
---@param bottom CEGUI.UDim
---@return CEGUI.URect
 function CEGUI.URect:new(left, top, right, bottom) end

---
-- new_local 
-- @function [parent=#CEGUI.URect] new_local
-- @param self
-- @param #CEGUI.UDim left
-- @param #CEGUI.UDim top
-- @param #CEGUI.UDim right
-- @param #CEGUI.UDim bottom
-- @return #CEGUI.URect

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.URect
-- @param self
-- @return #CEGUI.URect


---------------------------------------------------------------------------------
---UBox
---@class CEGUI.UBox
 local UBox = {}
 CEGUI.UBox = UBox
 CEGUI.UBox = UBox


---new
---@return CEGUI.UBox
 function CEGUI.UBox:new() end

---
-- new_local 
-- @function [parent=#CEGUI.UBox] new_local
-- @param self
-- @return #CEGUI.UBox

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.UBox
-- @param self
-- @return #CEGUI.UBox

---new
---@param margin CEGUI.UDim
---@return CEGUI.UBox
 function CEGUI.UBox:new(margin) end

---
-- new_local 
-- @function [parent=#CEGUI.UBox] new_local
-- @param self
-- @param #CEGUI.UDim margin
-- @return #CEGUI.UBox

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.UBox
-- @param self
-- @return #CEGUI.UBox

---new
---@param top CEGUI.UDim
---@param left CEGUI.UDim
---@param bottom CEGUI.UDim
---@param right CEGUI.UDim
---@return CEGUI.UBox
 function CEGUI.UBox:new(top, left, bottom, right) end

---
-- new_local 
-- @function [parent=#CEGUI.UBox] new_local
-- @param self
-- @param #CEGUI.UDim top
-- @param #CEGUI.UDim left
-- @param #CEGUI.UDim bottom
-- @param #CEGUI.UDim right
-- @return #CEGUI.UBox

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.UBox
-- @param self
-- @return #CEGUI.UBox

---new
---@param b CEGUI.UBox
---@return CEGUI.UBox
 function CEGUI.UBox:new(b) end

---
-- new_local 
-- @function [parent=#CEGUI.UBox] new_local
-- @param self
-- @param #CEGUI.UBox b
-- @return #CEGUI.UBox

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.UBox
-- @param self
-- @return #CEGUI.UBox

---.eq
---@param rhs CEGUI.UBox
---@return boolean
 function CEGUI.UBox:__eq(rhs) end

---
-- @field [parent=#CEGUI.UBox] #CEGUI.UDim top

---
-- @field [parent=#CEGUI.UBox] #CEGUI.UDim left

---
-- @field [parent=#CEGUI.UBox] #CEGUI.UDim bottom

---
-- @field [parent=#CEGUI.UBox] #CEGUI.UDim right


 CEGUI.Errors = 1
 CEGUI.Warnings = 2
 CEGUI.Standard = 3
 CEGUI.Informative = 4
 CEGUI.Insane = 5
---------------------------------------------------------------------------------
---Logger
---@class CEGUI.Logger
 local Logger = {}
 CEGUI.Logger = Logger
 CEGUI.Logger = Logger


---getSingleton
---@return CEGUI.Logger
 function CEGUI.Logger:getSingleton() end

---setLoggingLevel
---@param level CEGUI.LoggingLevel
 function CEGUI.Logger:setLoggingLevel(level) end

---getLoggingLevel
---@return CEGUI.LoggingLevel
 function CEGUI.Logger:getLoggingLevel() end

---logEvent
---@param message string
---@param level CEGUI.LoggingLevel
 function CEGUI.Logger:logEvent(message, level) end


---------------------------------------------------------------------------------
---Font
---@class CEGUI.Font
 local Font = {}
 CEGUI.Font = Font
 CEGUI.Font = Font


---setProperty
---@param name string
---@param value string
 function CEGUI.Font:setProperty(name, value) end

---getProperty
---@param name string
---@return string
 function CEGUI.Font:getProperty(name) end

---getPropertyDefault
---@param name string
---@return string
 function CEGUI.Font:getPropertyDefault(name) end

---getPropertyHelp
---@param name string
---@return string
 function CEGUI.Font:getPropertyHelp(name) end

---isPropertyPresent
---@param name string
---@return boolean
 function CEGUI.Font:isPropertyPresent(name) end

---isPropertyDefault
---@param name string
---@return boolean
 function CEGUI.Font:isPropertyDefault(name) end

---getPropertyIterator
---@return CEGUI.PropertyIterator
 function CEGUI.Font:getPropertyIterator() end

---setDefaultResourceGroup
---@param resourceGroup string
 function CEGUI.Font:setDefaultResourceGroup(resourceGroup) end

---getDefaultResourceGroup
---@return string
 function CEGUI.Font:getDefaultResourceGroup() end

---isCodepointAvailable
---@param cp number
---@return boolean
 function CEGUI.Font:isCodepointAvailable(cp) end

---notifyDisplaySizeChanged
---@param sz CEGUI.Size_float_
 function CEGUI.Font:notifyDisplaySizeChanged(sz) end

---setNativeResolution
---@param sz CEGUI.Size_float_
 function CEGUI.Font:setNativeResolution(sz) end

---setAutoScaled
---@param auto_scaled CEGUI.AutoScaledMode
 function CEGUI.Font:setAutoScaled(auto_scaled) end

---getAutoScaled
---@return CEGUI.AutoScaledMode
 function CEGUI.Font:getAutoScaled() end

---getTextExtent
---@param text string
---@param xscale number
---@return number
 function CEGUI.Font:getTextExtent(text, xscale) end

---getLineSpacing
---@param yscale number
---@return number
 function CEGUI.Font:getLineSpacing(yscale) end

---getFontHeight
---@param yscale number
---@return number
 function CEGUI.Font:getFontHeight(yscale) end

---getCharAtPixel
---@param text string
---@param start_char number
---@param pixel number
---@param xscale number
---@return number
 function CEGUI.Font:getCharAtPixel(text, start_char, pixel, xscale) end

---getCharAtPixel
---@param text string
---@param pixel number
---@param xscale number
---@return number
 function CEGUI.Font:getCharAtPixel(text, pixel, xscale) end


---------------------------------------------------------------------------------
---FontManager
---@class CEGUI.FontManager
 local FontManager = {}
 CEGUI.FontManager = FontManager
 CEGUI.FontManager = FontManager


---getSingleton
---@return CEGUI.FontManager
 function CEGUI.FontManager:getSingleton() end

---createFromFile
---@param xml_filename string
---@param resource_group string
---@param action CEGUI.XMLResourceExistsAction
---@return CEGUI.Font
 function CEGUI.FontManager:createFromFile(xml_filename, resource_group, action) end

---createFromString
---@param source string
---@param action CEGUI.XMLResourceExistsAction
---@return CEGUI.Font
 function CEGUI.FontManager:createFromString(source, action) end

---createFreeTypeFont
---@param font_name string
---@param point_size number
---@param anti_aliased boolean
---@param font_filename string
---@param resource_group string
---@param auto_scaled CEGUI.AutoScaledMode
---@return CEGUI.Font
 function CEGUI.FontManager:createFreeTypeFont(font_name, point_size, anti_aliased, font_filename, resource_group, auto_scaled) end

---createFreeTypeFont
---@param font_name string
---@param point_size number
---@param anti_aliased boolean
---@param font_filename string
---@param resource_group string
---@param auto_scaled CEGUI.AutoScaledMode
---@param native_res CEGUI.Size_float_
---@param action CEGUI.XMLResourceExistsAction
---@return CEGUI.Font
 function CEGUI.FontManager:createFreeTypeFont(font_name, point_size, anti_aliased, font_filename, resource_group, auto_scaled, native_res, action) end

---createPixmapFont
---@param font_name string
---@param imageset_filename string
---@param resource_group string
---@param auto_scaled CEGUI.AutoScaledMode
---@return CEGUI.Font
 function CEGUI.FontManager:createPixmapFont(font_name, imageset_filename, resource_group, auto_scaled) end

---createPixmapFont
---@param font_name string
---@param imageset_filename string
---@param resource_group string
---@param auto_scaled CEGUI.AutoScaledMode
---@param native_res CEGUI.Size_float_
---@param action CEGUI.XMLResourceExistsAction
---@return CEGUI.Font
 function CEGUI.FontManager:createPixmapFont(font_name, imageset_filename, resource_group, auto_scaled, native_res, action) end

---destroy
---@param name string
 function CEGUI.FontManager:destroy(name) end

---destroy
---@param font CEGUI.Font
 function CEGUI.FontManager:destroy(font) end

---destroyAll
 function CEGUI.FontManager:destroyAll() end

---isDefined
---@param name string
---@return boolean
 function CEGUI.FontManager:isDefined(name) end

---get
---@param name string
---@return CEGUI.Font
 function CEGUI.FontManager:get(name) end

---notifyDisplaySizeChanged
---@param sz CEGUI.Size_float_
 function CEGUI.FontManager:notifyDisplaySizeChanged(sz) end

---getIterator
---@return CEGUI.FontIterator
 function CEGUI.FontManager:getIterator() end


 CEGUI.ASM_Disabled = 1
 CEGUI.ASM_Vertical = 2
 CEGUI.ASM_Horizontal = 3
 CEGUI.ASM_Min = 4
 CEGUI.ASM_Max = 5
 CEGUI.ASM_Both = 6
---------------------------------------------------------------------------------
---Image
---@class CEGUI.Image
 local Image = {}
 CEGUI.Image = Image
 CEGUI.Image = Image


---getName
---@return string
 function CEGUI.Image:getName() end

---getRenderedSize
---@return CEGUI.Size_float_
 function CEGUI.Image:getRenderedSize() end

---getRenderedOffset
---@return CEGUI.Vector2_float_
 function CEGUI.Image:getRenderedOffset() end

---render
---@param buffer CEGUI.GeometryBuffer
---@param dest_area CEGUI.Rect_float_
---@param clip_area CEGUI.Rect_float_
---@param colours CEGUI.ColourRect
 function CEGUI.Image:render(buffer, dest_area, clip_area, colours) end

---render
---@param buffer CEGUI.GeometryBuffer
---@param position CEGUI.Vector2_float_
---@param clip_area CEGUI.Rect_float_
 function CEGUI.Image:render(buffer, position, clip_area) end

---render
---@param buffer CEGUI.GeometryBuffer
---@param position CEGUI.Vector2_float_
---@param clip_area CEGUI.Rect_float_
---@param colours CEGUI.ColourRect
 function CEGUI.Image:render(buffer, position, clip_area, colours) end

---render
---@param buffer CEGUI.GeometryBuffer
---@param position CEGUI.Vector2_float_
---@param size CEGUI.Size_float_
---@param clip_area CEGUI.Rect_float_
 function CEGUI.Image:render(buffer, position, size, clip_area) end

---render
---@param buffer CEGUI.GeometryBuffer
---@param position CEGUI.Vector2_float_
---@param size CEGUI.Size_float_
---@param clip_area CEGUI.Rect_float_
---@param colours CEGUI.ColourRect
 function CEGUI.Image:render(buffer, position, size, clip_area, colours) end

---computeScalingFactors
---@param mode CEGUI.AutoScaledMode
---@param display_size CEGUI.Size_float_
---@param native_display_size CEGUI.Size_float_
---@param x_scale number
---@param y_scale number
 function CEGUI.Image:computeScalingFactors(mode, display_size, native_display_size, x_scale, y_scale) end


---------------------------------------------------------------------------------
---BasicImage
---@class CEGUI.BasicImage : CEGUI.Image
 local BasicImage = {}
 CEGUI.BasicImage = BasicImage
 CEGUI.BasicImage = BasicImage


---setTexture
---@param texture CEGUI.Texture
 function CEGUI.BasicImage:setTexture(texture) end

---setArea
---@param pixel_area CEGUI.Rect_float_
 function CEGUI.BasicImage:setArea(pixel_area) end

---setOffset
---@param pixel_offset CEGUI.Vector2_float_
 function CEGUI.BasicImage:setOffset(pixel_offset) end

---setAutoScaled
---@param mode CEGUI.AutoScaledMode
 function CEGUI.BasicImage:setAutoScaled(mode) end

---setNativeResolution
---@param native_res CEGUI.Size_float_
 function CEGUI.BasicImage:setNativeResolution(native_res) end


---------------------------------------------------------------------------------
---ImageFactory
---@class CEGUI.ImageFactory
 local ImageFactory = {}
 CEGUI.ImageFactory = ImageFactory
 CEGUI.ImageFactory = ImageFactory



---------------------------------------------------------------------------------
---ImagePair
---@class CEGUI.ImagePair
 local ImagePair = {}
 CEGUI.ImagePair = ImagePair
 CEGUI.ImagePair = ImagePair


---delete
---@return 
 function CEGUI.ImagePair:delete() end

---
-- @field [parent=#CEGUI.ImagePair] #CEGUI.Image first

---
-- @field [parent=#CEGUI.ImagePair] #CEGUI.ImageFactory second


---------------------------------------------------------------------------------
---ImageManager
---@class CEGUI.ImageManager
 local ImageManager = {}
 CEGUI.ImageManager = ImageManager
 CEGUI.ImageManager = ImageManager


---getSingleton
---@return CEGUI.ImageManager
 function CEGUI.ImageManager:getSingleton() end

---removeImageType
---@param name string
 function CEGUI.ImageManager:removeImageType(name) end

---isImageTypeAvailable
---@param name string
---@return boolean
 function CEGUI.ImageManager:isImageTypeAvailable(name) end

---create
---@param type string
---@param name string
---@return CEGUI.Image
 function CEGUI.ImageManager:create(type, name) end

---destroy
---@param image CEGUI.Image
 function CEGUI.ImageManager:destroy(image) end

---destroy
---@param name string
 function CEGUI.ImageManager:destroy(name) end

---destroyAll
 function CEGUI.ImageManager:destroyAll() end

---get
---@param name string
---@return CEGUI.Image
 function CEGUI.ImageManager:get(name) end

---isDefined
---@param name string
---@return boolean
 function CEGUI.ImageManager:isDefined(name) end

---getImageCount
---@return number
 function CEGUI.ImageManager:getImageCount() end

---loadImageset
---@param filename string
---@param resource_group string
 function CEGUI.ImageManager:loadImageset(filename, resource_group) end

---destroyImageCollection
---@param prefix string
---@param delete_texture boolean
 function CEGUI.ImageManager:destroyImageCollection(prefix, delete_texture) end

---addFromImageFile
---@param name string
---@param filename string
---@param resource_group string
 function CEGUI.ImageManager:addFromImageFile(name, filename, resource_group) end

---notifyDisplaySizeChanged
---@param size CEGUI.Size_float_
 function CEGUI.ImageManager:notifyDisplaySizeChanged(size) end

---setImagesetDefaultResourceGroup
---@param resourceGroup string
 function CEGUI.ImageManager:setImagesetDefaultResourceGroup(resourceGroup) end

---getImagesetDefaultResourceGroup
---@return string
 function CEGUI.ImageManager:getImagesetDefaultResourceGroup() end

---getIterator
---@return CEGUI.ImageIterator
 function CEGUI.ImageManager:getIterator() end


---------------------------------------------------------------------------------
---Property
---@class CEGUI.Property
 local Property = {}
 CEGUI.Property = Property
 CEGUI.Property = Property


---getHelp
---@return string
 function CEGUI.Property:getHelp() end

---getName
---@return string
 function CEGUI.Property:getName() end


---------------------------------------------------------------------------------
---PropertyIterator
---@class CEGUI.PropertyIterator
 local PropertyIterator = {}
 CEGUI.PropertyIterator = PropertyIterator
 CEGUI.PropertyIterator = PropertyIterator


---key
---@return string
 function CEGUI.PropertyIterator:key() end

---value
---@return CEGUI.Property
 function CEGUI.PropertyIterator:value() end

---isAtEnd
---@return boolean
 function CEGUI.PropertyIterator:isAtEnd() end

---isAtStart
---@return boolean
 function CEGUI.PropertyIterator:isAtStart() end

---next
---@return CEGUI.PropertyIterator
 function CEGUI.PropertyIterator:next() end

---previous
---@return CEGUI.PropertyIterator
 function CEGUI.PropertyIterator:previous() end

---.eq
---@param rhs CEGUI.PropertyIterator
---@return boolean
 function CEGUI.PropertyIterator:__eq(rhs) end

---toStart
 function CEGUI.PropertyIterator:toStart() end

---toEnd
 function CEGUI.PropertyIterator:toEnd() end

---new
---@param org CEGUI.PropertyIterator
---@return CEGUI.PropertyIterator
 function CEGUI.PropertyIterator:new(org) end

---
-- new_local 
-- @function [parent=#CEGUI.PropertyIterator] new_local
-- @param self
-- @param #CEGUI.PropertyIterator org
-- @return #CEGUI.PropertyIterator

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.PropertyIterator
-- @param self
-- @return #CEGUI.PropertyIterator


---------------------------------------------------------------------------------
---EventIterator
---@class CEGUI.EventIterator
 local EventIterator = {}
 CEGUI.EventIterator = EventIterator
 CEGUI.EventIterator = EventIterator


---key
---@return string
 function CEGUI.EventIterator:key() end

---value
---@return CEGUI.Event
 function CEGUI.EventIterator:value() end

---isAtEnd
---@return boolean
 function CEGUI.EventIterator:isAtEnd() end

---isAtStart
---@return boolean
 function CEGUI.EventIterator:isAtStart() end

---next
---@return CEGUI.EventIterator
 function CEGUI.EventIterator:next() end

---previous
---@return CEGUI.EventIterator
 function CEGUI.EventIterator:previous() end

---.eq
---@param rhs CEGUI.EventIterator
---@return boolean
 function CEGUI.EventIterator:__eq(rhs) end

---toStart
 function CEGUI.EventIterator:toStart() end

---toEnd
 function CEGUI.EventIterator:toEnd() end

---new
---@param org CEGUI.EventIterator
---@return CEGUI.EventIterator
 function CEGUI.EventIterator:new(org) end

---
-- new_local 
-- @function [parent=#CEGUI.EventIterator] new_local
-- @param self
-- @param #CEGUI.EventIterator org
-- @return #CEGUI.EventIterator

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.EventIterator
-- @param self
-- @return #CEGUI.EventIterator


---------------------------------------------------------------------------------
---WindowIterator
---@class CEGUI.WindowIterator
 local WindowIterator = {}
 CEGUI.WindowIterator = WindowIterator
 CEGUI.WindowIterator = WindowIterator


---value
---@return CEGUI.Window
 function CEGUI.WindowIterator:value() end

---isAtEnd
---@return boolean
 function CEGUI.WindowIterator:isAtEnd() end

---isAtStart
---@return boolean
 function CEGUI.WindowIterator:isAtStart() end

---next
---@return CEGUI.WindowIterator
 function CEGUI.WindowIterator:next() end

---previous
---@return CEGUI.WindowIterator
 function CEGUI.WindowIterator:previous() end

---.eq
---@param rhs CEGUI.WindowIterator
---@return boolean
 function CEGUI.WindowIterator:__eq(rhs) end

---toStart
 function CEGUI.WindowIterator:toStart() end

---toEnd
 function CEGUI.WindowIterator:toEnd() end

---new
---@param org CEGUI.WindowIterator
---@return CEGUI.WindowIterator
 function CEGUI.WindowIterator:new(org) end

---
-- new_local 
-- @function [parent=#CEGUI.WindowIterator] new_local
-- @param self
-- @param #CEGUI.WindowIterator org
-- @return #CEGUI.WindowIterator

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.WindowIterator
-- @param self
-- @return #CEGUI.WindowIterator


---------------------------------------------------------------------------------
---WindowFactoryIterator
---@class CEGUI.WindowFactoryIterator
 local WindowFactoryIterator = {}
 CEGUI.WindowFactoryIterator = WindowFactoryIterator
 CEGUI.WindowFactoryIterator = WindowFactoryIterator


---key
---@return string
 function CEGUI.WindowFactoryIterator:key() end

---value
---@return CEGUI.WindowFactory
 function CEGUI.WindowFactoryIterator:value() end

---isAtEnd
---@return boolean
 function CEGUI.WindowFactoryIterator:isAtEnd() end

---isAtStart
---@return boolean
 function CEGUI.WindowFactoryIterator:isAtStart() end

---next
---@return CEGUI.WindowFactoryIterator
 function CEGUI.WindowFactoryIterator:next() end

---previous
---@return CEGUI.WindowFactoryIterator
 function CEGUI.WindowFactoryIterator:previous() end

---.eq
---@param rhs CEGUI.WindowFactoryIterator
---@return boolean
 function CEGUI.WindowFactoryIterator:__eq(rhs) end

---toStart
 function CEGUI.WindowFactoryIterator:toStart() end

---toEnd
 function CEGUI.WindowFactoryIterator:toEnd() end

---new
---@param org CEGUI.WindowFactoryIterator
---@return CEGUI.WindowFactoryIterator
 function CEGUI.WindowFactoryIterator:new(org) end

---
-- new_local 
-- @function [parent=#CEGUI.WindowFactoryIterator] new_local
-- @param self
-- @param #CEGUI.WindowFactoryIterator org
-- @return #CEGUI.WindowFactoryIterator

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.WindowFactoryIterator
-- @param self
-- @return #CEGUI.WindowFactoryIterator


---------------------------------------------------------------------------------
---FalagardMappingIterator
---@class CEGUI.FalagardMappingIterator
 local FalagardMappingIterator = {}
 CEGUI.FalagardMappingIterator = FalagardMappingIterator
 CEGUI.FalagardMappingIterator = FalagardMappingIterator


---key
---@return string
 function CEGUI.FalagardMappingIterator:key() end

---value
---@return CEGUI.FalagardWindowMapping
 function CEGUI.FalagardMappingIterator:value() end

---isAtEnd
---@return boolean
 function CEGUI.FalagardMappingIterator:isAtEnd() end

---isAtStart
---@return boolean
 function CEGUI.FalagardMappingIterator:isAtStart() end

---next
---@return CEGUI.FalagardMappingIterator
 function CEGUI.FalagardMappingIterator:next() end

---previous
---@return CEGUI.FalagardMappingIterator
 function CEGUI.FalagardMappingIterator:previous() end

---.eq
---@param rhs CEGUI.FalagardMappingIterator
---@return boolean
 function CEGUI.FalagardMappingIterator:__eq(rhs) end

---toStart
 function CEGUI.FalagardMappingIterator:toStart() end

---toEnd
 function CEGUI.FalagardMappingIterator:toEnd() end

---new
---@param org CEGUI.FalagardMappingIterator
---@return CEGUI.FalagardMappingIterator
 function CEGUI.FalagardMappingIterator:new(org) end

---
-- new_local 
-- @function [parent=#CEGUI.FalagardMappingIterator] new_local
-- @param self
-- @param #CEGUI.FalagardMappingIterator org
-- @return #CEGUI.FalagardMappingIterator

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.FalagardMappingIterator
-- @param self
-- @return #CEGUI.FalagardMappingIterator


---------------------------------------------------------------------------------
---SchemeIterator
---@class CEGUI.SchemeIterator
 local SchemeIterator = {}
 CEGUI.SchemeIterator = SchemeIterator
 CEGUI.SchemeIterator = SchemeIterator


---key
---@return string
 function CEGUI.SchemeIterator:key() end

---value
---@return CEGUI.Scheme
 function CEGUI.SchemeIterator:value() end

---isAtEnd
---@return boolean
 function CEGUI.SchemeIterator:isAtEnd() end

---isAtStart
---@return boolean
 function CEGUI.SchemeIterator:isAtStart() end

---next
---@return CEGUI.SchemeIterator
 function CEGUI.SchemeIterator:next() end

---previous
---@return CEGUI.SchemeIterator
 function CEGUI.SchemeIterator:previous() end

---.eq
---@param rhs CEGUI.SchemeIterator
---@return boolean
 function CEGUI.SchemeIterator:__eq(rhs) end

---toStart
 function CEGUI.SchemeIterator:toStart() end

---toEnd
 function CEGUI.SchemeIterator:toEnd() end

---new
---@param org CEGUI.SchemeIterator
---@return CEGUI.SchemeIterator
 function CEGUI.SchemeIterator:new(org) end

---
-- new_local 
-- @function [parent=#CEGUI.SchemeIterator] new_local
-- @param self
-- @param #CEGUI.SchemeIterator org
-- @return #CEGUI.SchemeIterator

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.SchemeIterator
-- @param self
-- @return #CEGUI.SchemeIterator


---------------------------------------------------------------------------------
---FontIterator
---@class CEGUI.FontIterator
 local FontIterator = {}
 CEGUI.FontIterator = FontIterator
 CEGUI.FontIterator = FontIterator


---key
---@return string
 function CEGUI.FontIterator:key() end

---value
---@return CEGUI.Font
 function CEGUI.FontIterator:value() end

---isAtEnd
---@return boolean
 function CEGUI.FontIterator:isAtEnd() end

---isAtStart
---@return boolean
 function CEGUI.FontIterator:isAtStart() end

---next
---@return CEGUI.FontIterator
 function CEGUI.FontIterator:next() end

---previous
---@return CEGUI.FontIterator
 function CEGUI.FontIterator:previous() end

---.eq
---@param rhs CEGUI.FontIterator
---@return boolean
 function CEGUI.FontIterator:__eq(rhs) end

---toStart
 function CEGUI.FontIterator:toStart() end

---toEnd
 function CEGUI.FontIterator:toEnd() end

---new
---@param org CEGUI.FontIterator
---@return CEGUI.FontIterator
 function CEGUI.FontIterator:new(org) end

---
-- new_local 
-- @function [parent=#CEGUI.FontIterator] new_local
-- @param self
-- @param #CEGUI.FontIterator org
-- @return #CEGUI.FontIterator

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.FontIterator
-- @param self
-- @return #CEGUI.FontIterator


---------------------------------------------------------------------------------
---ImageIterator
---@class CEGUI.ImageIterator
 local ImageIterator = {}
 CEGUI.ImageIterator = ImageIterator
 CEGUI.ImageIterator = ImageIterator


---key
---@return string
 function CEGUI.ImageIterator:key() end

---value
---@return CEGUI.ImagePair
 function CEGUI.ImageIterator:value() end

---isAtEnd
---@return boolean
 function CEGUI.ImageIterator:isAtEnd() end

---isAtStart
---@return boolean
 function CEGUI.ImageIterator:isAtStart() end

---next
---@return CEGUI.ImageIterator
 function CEGUI.ImageIterator:next() end

---previous
---@return CEGUI.ImageIterator
 function CEGUI.ImageIterator:previous() end

---.eq
---@param rhs CEGUI.ImageIterator
---@return boolean
 function CEGUI.ImageIterator:__eq(rhs) end

---toStart
 function CEGUI.ImageIterator:toStart() end

---toEnd
 function CEGUI.ImageIterator:toEnd() end

---new
---@param org CEGUI.ImageIterator
---@return CEGUI.ImageIterator
 function CEGUI.ImageIterator:new(org) end

---
-- new_local 
-- @function [parent=#CEGUI.ImageIterator] new_local
-- @param self
-- @param #CEGUI.ImageIterator org
-- @return #CEGUI.ImageIterator

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ImageIterator
-- @param self
-- @return #CEGUI.ImageIterator


---------------------------------------------------------------------------------
---SimpleTimer
---@class CEGUI.SimpleTimer
 local SimpleTimer = {}
 CEGUI.SimpleTimer = SimpleTimer
 CEGUI.SimpleTimer = SimpleTimer


---new
---@return CEGUI.SimpleTimer
 function CEGUI.SimpleTimer:new() end

---
-- new_local 
-- @function [parent=#CEGUI.SimpleTimer] new_local
-- @param self
-- @return #CEGUI.SimpleTimer

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.SimpleTimer
-- @param self
-- @return #CEGUI.SimpleTimer

---currentTime
---@return number
 function CEGUI.SimpleTimer:currentTime() end

---restart
 function CEGUI.SimpleTimer:restart() end

---elapsed
---@return number
 function CEGUI.SimpleTimer:elapsed() end


 Key = {}

 Key.Unknown = 1
 Key.Escape = 2
 Key.One = 3
 Key.Two = 4
 Key.Three = 5
 Key.Four = 6
 Key.Five = 7
 Key.Six = 8
 Key.Seven = 9
 Key.Eight = 10
 Key.Nine = 11
 Key.Zero = 12
 Key.Minus = 13
 Key.Equals = 14
 Key.Backspace = 15
 Key.Tab = 16
 Key.Q = 17
 Key.W = 18
 Key.E = 19
 Key.R = 20
 Key.T = 21
 Key.Y = 22
 Key.U = 23
 Key.I = 24
 Key.O = 25
 Key.P = 26
 Key.LeftBracket = 27
 Key.RightBracket = 28
 Key.Return = 29
 Key.LeftControl = 30
 Key.A = 31
 Key.S = 32
 Key.D = 33
 Key.F = 34
 Key.G = 35
 Key.H = 36
 Key.J = 37
 Key.K = 38
 Key.L = 39
 Key.Semicolon = 40
 Key.Apostrophe = 41
 Key.Grave = 42
 Key.LeftShift = 43
 Key.Backslash = 44
 Key.Z = 45
 Key.X = 46
 Key.C = 47
 Key.V = 48
 Key.B = 49
 Key.N = 50
 Key.M = 51
 Key.Comma = 52
 Key.Period = 53
 Key.Slash = 54
 Key.RightShift = 55
 Key.Multiply = 56
 Key.LeftAlt = 57
 Key.Space = 58
 Key.Capital = 59
 Key.F1 = 60
 Key.F2 = 61
 Key.F3 = 62
 Key.F4 = 63
 Key.F5 = 64
 Key.F6 = 65
 Key.F7 = 66
 Key.F8 = 67
 Key.F9 = 68
 Key.F10 = 69
 Key.NumLock = 70
 Key.ScrollLock = 71
 Key.Numpad7 = 72
 Key.Numpad8 = 73
 Key.Numpad9 = 74
 Key.Subtract = 75
 Key.Numpad4 = 76
 Key.Numpad5 = 77
 Key.Numpad6 = 78
 Key.Add = 79
 Key.Numpad1 = 80
 Key.Numpad2 = 81
 Key.Numpad3 = 82
 Key.Numpad0 = 83
 Key.Decimal = 84
 Key.OEM_102 = 85
 Key.F11 = 86
 Key.F12 = 87
 Key.F13 = 88
 Key.F14 = 89
 Key.F15 = 90
 Key.Kana = 91
 Key.ABNT_C1 = 92
 Key.Convert = 93
 Key.NoConvert = 94
 Key.Yen = 95
 Key.ABNT_C2 = 96
 Key.NumpadEquals = 97
 Key.PrevTrack = 98
 Key.At = 99
 Key.Colon = 100
 Key.Underline = 101
 Key.Kanji = 102
 Key.Stop = 103
 Key.AX = 104
 Key.Unlabeled = 105
 Key.NextTrack = 106
 Key.NumpadEnter = 107
 Key.RightControl = 108
 Key.Mute = 109
 Key.Calculator = 110
 Key.PlayPause = 111
 Key.MediaStop = 112
 Key.VolumeDown = 113
 Key.VolumeUp = 114
 Key.WebHome = 115
 Key.NumpadComma = 116
 Key.Divide = 117
 Key.SysRq = 118
 Key.RightAlt = 119
 Key.Pause = 120
 Key.Home = 121
 Key.ArrowUp = 122
 Key.PageUp = 123
 Key.ArrowLeft = 124
 Key.ArrowRight = 125
 Key.End = 126
 Key.ArrowDown = 127
 Key.PageDown = 128
 Key.Insert = 129
 Key.Delete = 130
 Key.LeftWindows = 131
 Key.RightWindows = 132
 Key.AppMenu = 133
 Key.Power = 134
 Key.Sleep = 135
 Key.Wake = 136
 Key.WebSearch = 137
 Key.WebFavorites = 138
 Key.WebRefresh = 139
 Key.WebStop = 140
 Key.WebForward = 141
 Key.WebBack = 142
 Key.MyComputer = 143
 Key.Mail = 144
 Key.MediaSelect = 145
---------------------------------------------------------------------------------
---SystemKeys
---@class CEGUI.SystemKeys
 local SystemKeys = {}
 CEGUI.SystemKeys = SystemKeys
 CEGUI.SystemKeys = SystemKeys


 CEGUI.SystemKeys.None = 1
 CEGUI.SystemKeys.LeftMouse = 2
 CEGUI.SystemKeys.RightMouse = 3
 CEGUI.SystemKeys.Shift = 4
 CEGUI.SystemKeys.Control = 5
 CEGUI.SystemKeys.MiddleMouse = 6
 CEGUI.SystemKeys.X1Mouse = 7
 CEGUI.SystemKeys.X2Mouse = 8
 CEGUI.SystemKeys.Alt = 9
---reset
 function CEGUI.SystemKeys:reset() end

---get
---@return number
 function CEGUI.SystemKeys:get() end

---isPressed
---@param key CEGUI.SystemKeys.SystemKey
---@return boolean
 function CEGUI.SystemKeys:isPressed(key) end

---keyPressed
---@param key CEGUI.Key.Scan
 function CEGUI.SystemKeys:keyPressed(key) end

---keyReleased
---@param key CEGUI.Key.Scan
 function CEGUI.SystemKeys:keyReleased(key) end

---mouseButtonPressed
---@param button CEGUI.MouseButton
 function CEGUI.SystemKeys:mouseButtonPressed(button) end

---mouseButtonReleased
---@param button CEGUI.MouseButton
 function CEGUI.SystemKeys:mouseButtonReleased(button) end

---mouseButtonToSystemKey
---@param button CEGUI.MouseButton
---@return CEGUI.SystemKeys.SystemKey
 function CEGUI.SystemKeys:mouseButtonToSystemKey(button) end

---keyCodeToSystemKey
---@param key CEGUI.Key.Scan
---@return CEGUI.SystemKeys.SystemKey
 function CEGUI.SystemKeys:keyCodeToSystemKey(key) end


---------------------------------------------------------------------------------
---EventArgs
---@class CEGUI.EventArgs
 local EventArgs = {}
 CEGUI.EventArgs = EventArgs
 CEGUI.EventArgs = EventArgs


---
-- @field [parent=#CEGUI.EventArgs] #number handled

---new
---@return CEGUI.EventArgs
 function CEGUI.EventArgs:new() end

---
-- new_local 
-- @function [parent=#CEGUI.EventArgs] new_local
-- @param self
-- @return #CEGUI.EventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.EventArgs
-- @param self
-- @return #CEGUI.EventArgs


---------------------------------------------------------------------------------
---MouseCursorEventArgs
---@class CEGUI.MouseCursorEventArgs : CEGUI.EventArgs
 local MouseCursorEventArgs = {}
 CEGUI.MouseCursorEventArgs = MouseCursorEventArgs
 CEGUI.MouseCursorEventArgs = MouseCursorEventArgs


---
-- @field [parent=#CEGUI.MouseCursorEventArgs] #CEGUI.MouseCursor mouseCursor

---
-- @field [parent=#CEGUI.MouseCursorEventArgs] #CEGUI.Image image

---new
---@param cursor CEGUI.MouseCursor
---@return CEGUI.MouseCursorEventArgs
 function CEGUI.MouseCursorEventArgs:new(cursor) end

---
-- new_local 
-- @function [parent=#CEGUI.MouseCursorEventArgs] new_local
-- @param self
-- @param #CEGUI.MouseCursor cursor
-- @return #CEGUI.MouseCursorEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.MouseCursorEventArgs
-- @param self
-- @return #CEGUI.MouseCursorEventArgs


---------------------------------------------------------------------------------
---WindowEventArgs
---@class CEGUI.WindowEventArgs : CEGUI.EventArgs
 local WindowEventArgs = {}
 CEGUI.WindowEventArgs = WindowEventArgs
 CEGUI.WindowEventArgs = WindowEventArgs


---
-- @field [parent=#CEGUI.WindowEventArgs] #CEGUI.Window window

---new
---@param wnd CEGUI.Window
---@return CEGUI.WindowEventArgs
 function CEGUI.WindowEventArgs:new(wnd) end

---
-- new_local 
-- @function [parent=#CEGUI.WindowEventArgs] new_local
-- @param self
-- @param #CEGUI.Window wnd
-- @return #CEGUI.WindowEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.WindowEventArgs
-- @param self
-- @return #CEGUI.WindowEventArgs


---------------------------------------------------------------------------------
---ActivationEventArgs
---@class CEGUI.ActivationEventArgs : CEGUI.WindowEventArgs
 local ActivationEventArgs = {}
 CEGUI.ActivationEventArgs = ActivationEventArgs
 CEGUI.ActivationEventArgs = ActivationEventArgs


---
-- @field [parent=#CEGUI.ActivationEventArgs] #CEGUI.Window otherWindow

---new
---@param wnd CEGUI.Window
---@return CEGUI.ActivationEventArgs
 function CEGUI.ActivationEventArgs:new(wnd) end

---
-- new_local 
-- @function [parent=#CEGUI.ActivationEventArgs] new_local
-- @param self
-- @param #CEGUI.Window wnd
-- @return #CEGUI.ActivationEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ActivationEventArgs
-- @param self
-- @return #CEGUI.ActivationEventArgs


---------------------------------------------------------------------------------
---HeaderSequenceEventArgs
---@class CEGUI.HeaderSequenceEventArgs : CEGUI.WindowEventArgs
 local HeaderSequenceEventArgs = {}
 CEGUI.HeaderSequenceEventArgs = HeaderSequenceEventArgs
 CEGUI.HeaderSequenceEventArgs = HeaderSequenceEventArgs


---
-- @field [parent=#CEGUI.HeaderSequenceEventArgs] #number oldIdx

---
-- @field [parent=#CEGUI.HeaderSequenceEventArgs] #number newIdx

---new
---@param wnd CEGUI.Window
---@param old_index number
---@param new_index number
---@return CEGUI.HeaderSequenceEventArgs
 function CEGUI.HeaderSequenceEventArgs:new(wnd, old_index, new_index) end

---
-- new_local 
-- @function [parent=#CEGUI.HeaderSequenceEventArgs] new_local
-- @param self
-- @param #CEGUI.Window wnd
-- @param #number old_index
-- @param #number new_index
-- @return #CEGUI.HeaderSequenceEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.HeaderSequenceEventArgs
-- @param self
-- @return #CEGUI.HeaderSequenceEventArgs


 CEGUI.LeftButton = 1
 CEGUI.RightButton = 2
 CEGUI.MiddleButton = 3
 CEGUI.X1Button = 4
 CEGUI.X2Button = 5
 CEGUI.MouseButtonCount = 6
 CEGUI.NoButton = 7
---------------------------------------------------------------------------------
---MouseEventArgs
---@class CEGUI.MouseEventArgs : CEGUI.WindowEventArgs
 local MouseEventArgs = {}
 CEGUI.MouseEventArgs = MouseEventArgs
 CEGUI.MouseEventArgs = MouseEventArgs


---
-- @field [parent=#CEGUI.MouseEventArgs] #CEGUI.Vector2_float_ position

---
-- @field [parent=#CEGUI.MouseEventArgs] #CEGUI.Vector2_float_ moveDelta

---
-- @field [parent=#CEGUI.MouseEventArgs] #CEGUI.MouseButton button

---
-- @field [parent=#CEGUI.MouseEventArgs] #number sysKeys

---
-- @field [parent=#CEGUI.MouseEventArgs] #number wheelChange

---new
---@param wnd CEGUI.Window
---@return CEGUI.MouseEventArgs
 function CEGUI.MouseEventArgs:new(wnd) end

---
-- new_local 
-- @function [parent=#CEGUI.MouseEventArgs] new_local
-- @param self
-- @param #CEGUI.Window wnd
-- @return #CEGUI.MouseEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.MouseEventArgs
-- @param self
-- @return #CEGUI.MouseEventArgs


---------------------------------------------------------------------------------
---KeyEventArgs
---@class CEGUI.KeyEventArgs : CEGUI.WindowEventArgs
 local KeyEventArgs = {}
 CEGUI.KeyEventArgs = KeyEventArgs
 CEGUI.KeyEventArgs = KeyEventArgs


---
-- @field [parent=#CEGUI.KeyEventArgs] #number codepoint

---
-- @field [parent=#CEGUI.KeyEventArgs] #CEGUI.Key.Scan scancode

---
-- @field [parent=#CEGUI.KeyEventArgs] #number sysKeys

---new
---@param wnd CEGUI.Window
---@return CEGUI.KeyEventArgs
 function CEGUI.KeyEventArgs:new(wnd) end

---
-- new_local 
-- @function [parent=#CEGUI.KeyEventArgs] new_local
-- @param self
-- @param #CEGUI.Window wnd
-- @return #CEGUI.KeyEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.KeyEventArgs
-- @param self
-- @return #CEGUI.KeyEventArgs


---------------------------------------------------------------------------------
---DragDropEventArgs
---@class CEGUI.DragDropEventArgs : CEGUI.WindowEventArgs
 local DragDropEventArgs = {}
 CEGUI.DragDropEventArgs = DragDropEventArgs
 CEGUI.DragDropEventArgs = DragDropEventArgs


---
-- @field [parent=#CEGUI.DragDropEventArgs] #CEGUI.DragContainer dragDropItem

---new
---@param wnd CEGUI.Window
---@return CEGUI.DragDropEventArgs
 function CEGUI.DragDropEventArgs:new(wnd) end

---
-- new_local 
-- @function [parent=#CEGUI.DragDropEventArgs] new_local
-- @param self
-- @param #CEGUI.Window wnd
-- @return #CEGUI.DragDropEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.DragDropEventArgs
-- @param self
-- @return #CEGUI.DragDropEventArgs


---------------------------------------------------------------------------------
---TreeEventArgs
---@class CEGUI.TreeEventArgs : CEGUI.WindowEventArgs
 local TreeEventArgs = {}
 CEGUI.TreeEventArgs = TreeEventArgs
 CEGUI.TreeEventArgs = TreeEventArgs


---
-- @field [parent=#CEGUI.TreeEventArgs] #CEGUI.TreeItem treeItem

---new
---@param wnd CEGUI.Window
---@return CEGUI.TreeEventArgs
 function CEGUI.TreeEventArgs:new(wnd) end

---
-- new_local 
-- @function [parent=#CEGUI.TreeEventArgs] new_local
-- @param self
-- @param #CEGUI.Window wnd
-- @return #CEGUI.TreeEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.TreeEventArgs
-- @param self
-- @return #CEGUI.TreeEventArgs


---------------------------------------------------------------------------------
---RenderQueueEventArgs
---@class CEGUI.RenderQueueEventArgs : CEGUI.EventArgs
 local RenderQueueEventArgs = {}
 CEGUI.RenderQueueEventArgs = RenderQueueEventArgs
 CEGUI.RenderQueueEventArgs = RenderQueueEventArgs


---
-- @field [parent=#CEGUI.RenderQueueEventArgs] #CEGUI.RenderQueueID queueID

---new
---@param id CEGUI.RenderQueueID
---@return CEGUI.RenderQueueEventArgs
 function CEGUI.RenderQueueEventArgs:new(id) end

---
-- new_local 
-- @function [parent=#CEGUI.RenderQueueEventArgs] new_local
-- @param self
-- @param #CEGUI.RenderQueueID id
-- @return #CEGUI.RenderQueueEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.RenderQueueEventArgs
-- @param self
-- @return #CEGUI.RenderQueueEventArgs


---------------------------------------------------------------------------------
---Event
---@class CEGUI.Event
 local Event = {}
 CEGUI.Event = Event
 CEGUI.Event = Event


---getName
---@return string
 function CEGUI.Event:getName() end


---------------------------------------------------------------------------------
---EventConnection
---@class CEGUI.EventConnection
 local EventConnection = {}
 CEGUI.EventConnection = EventConnection
 CEGUI.EventConnection = EventConnection


---connected
---@return boolean
 function CEGUI.EventConnection:connected() end

---disconnect
 function CEGUI.EventConnection:disconnect() end


---------------------------------------------------------------------------------
---EventSet
---@class CEGUI.EventSet
 local EventSet = {}
 CEGUI.EventSet = EventSet
 CEGUI.EventSet = EventSet


---addEvent
---@param name string
 function CEGUI.EventSet:addEvent(name) end

---removeEvent
---@param name string
 function CEGUI.EventSet:removeEvent(name) end

---removeAllEvents
 function CEGUI.EventSet:removeAllEvents() end

---isEventPresent
---@param name string
---@return boolean
 function CEGUI.EventSet:isEventPresent(name) end

---subscribeEvent
---@param name string
---@param funcIndex lua_Object
---@param selfIndex lua_Object
---@param error_handler lua_Object
---@param tolua_var_1 lua_State
---@return CEGUI.EventConnection
 function CEGUI.EventSet:subscribeEvent(name, funcIndex, selfIndex, error_handler, tolua_var_1) end

---subscribeEvent
---@param name string
---@param callback_name string
---@return CEGUI.EventConnection
 function CEGUI.EventSet:subscribeEvent(name, callback_name) end

---fireEvent
---@param name string
---@param args CEGUI.EventArgs
---@param eventnamespace string
 function CEGUI.EventSet:fireEvent(name, args, eventnamespace) end

---isMuted
---@return boolean
 function CEGUI.EventSet:isMuted() end

---setMutedState
---@param setting boolean
 function CEGUI.EventSet:setMutedState(setting) end

---getEventIterator
---@return CEGUI.EventIterator
 function CEGUI.EventSet:getEventIterator() end


---------------------------------------------------------------------------------
---GlobalEventSet
---@class CEGUI.GlobalEventSet : CEGUI.EventSet
 local GlobalEventSet = {}
 CEGUI.GlobalEventSet = GlobalEventSet
 CEGUI.GlobalEventSet = GlobalEventSet


---getSingleton
---@return CEGUI.GlobalEventSet
 function CEGUI.GlobalEventSet:getSingleton() end


---------------------------------------------------------------------------------
---MouseCursor
---@class CEGUI.MouseCursor : CEGUI.EventSet
 local MouseCursor = {}
 CEGUI.MouseCursor = MouseCursor
 CEGUI.MouseCursor = MouseCursor


---setImage
---@param image CEGUI.Image
 function CEGUI.MouseCursor:setImage(image) end

---setImage
---@param name string
 function CEGUI.MouseCursor:setImage(name) end

---getImage
---@return CEGUI.Image
 function CEGUI.MouseCursor:getImage() end

---setDefaultImage
---@param image CEGUI.Image
 function CEGUI.MouseCursor:setDefaultImage(image) end

---setDefaultImage
---@param name string
 function CEGUI.MouseCursor:setDefaultImage(name) end

---getDefaultImage
---@return CEGUI.Image
 function CEGUI.MouseCursor:getDefaultImage() end

---setPosition
---@param pos CEGUI.Vector2_float_
 function CEGUI.MouseCursor:setPosition(pos) end

---offsetPosition
---@param offset CEGUI.Vector2_float_
 function CEGUI.MouseCursor:offsetPosition(offset) end

---setConstraintArea
---@param area CEGUI.Rect_float_
 function CEGUI.MouseCursor:setConstraintArea(area) end

---getPosition
---@return CEGUI.Vector2_float_
 function CEGUI.MouseCursor:getPosition() end

---getConstraintArea
---@return CEGUI.Rect_float_
 function CEGUI.MouseCursor:getConstraintArea() end

---getDisplayIndependantPosition
---@return CEGUI.Vector2_float_
 function CEGUI.MouseCursor:getDisplayIndependantPosition() end

---setUnifiedConstraintArea
---@param area CEGUI.URect
 function CEGUI.MouseCursor:setUnifiedConstraintArea(area) end

---getUnifiedConstraintArea
---@return CEGUI.URect
 function CEGUI.MouseCursor:getUnifiedConstraintArea() end

---hide
 function CEGUI.MouseCursor:hide() end

---show
 function CEGUI.MouseCursor:show() end

---setVisible
---@param visible boolean
 function CEGUI.MouseCursor:setVisible(visible) end

---isVisible
---@return boolean
 function CEGUI.MouseCursor:isVisible() end

---setExplicitRenderSize
---@param size CEGUI.Size_float_
 function CEGUI.MouseCursor:setExplicitRenderSize(size) end

---getExplicitRenderSize
---@return CEGUI.Size_float_
 function CEGUI.MouseCursor:getExplicitRenderSize() end

---getEventIterator
---@return CEGUI.EventIterator
 function CEGUI.MouseCursor:getEventIterator() end


 CEGUI.HA_LEFT = 1
 CEGUI.HA_CENTRE = 2
 CEGUI.HA_RIGHT = 3
 CEGUI.VA_TOP = 1
 CEGUI.VA_CENTRE = 2
 CEGUI.VA_BOTTOM = 3
---------------------------------------------------------------------------------
---ElementEventArgs
---@class CEGUI.ElementEventArgs : CEGUI.EventArgs
 local ElementEventArgs = {}
 CEGUI.ElementEventArgs = ElementEventArgs
 CEGUI.ElementEventArgs = ElementEventArgs


---new
---@param element CEGUI.Element
---@return CEGUI.ElementEventArgs
 function CEGUI.ElementEventArgs:new(element) end

---
-- new_local 
-- @function [parent=#CEGUI.ElementEventArgs] new_local
-- @param self
-- @param #CEGUI.Element element
-- @return #CEGUI.ElementEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ElementEventArgs
-- @param self
-- @return #CEGUI.ElementEventArgs

---
-- @field [parent=#CEGUI.ElementEventArgs] #CEGUI.Element element


---------------------------------------------------------------------------------
---Element
---@class CEGUI.Element
 local Element = {}
 CEGUI.Element = Element
 CEGUI.Element = Element


---------------------------------------------------------------------------------
---CachedRectf
---@class CachedRectf
 local CachedRectf = {}
 CachedRectf = CachedRectf
 CEGUI.Element.CachedRectf = CachedRectf


---get
---@return CEGUI.Rect_float_
 function CachedRectf:get() end

---getFresh
---@param skipAllPixelAlignment boolean
---@return CEGUI.Rect_float_
 function CachedRectf:getFresh(skipAllPixelAlignment) end

---invalidateCache
 function CachedRectf:invalidateCache() end

---isCacheValid
---@return boolean
 function CachedRectf:isCacheValid() end

---regenerateCache
 function CachedRectf:regenerateCache() end


---new
---@return CEGUI.Element
 function CEGUI.Element:new() end

---
-- new_local 
-- @function [parent=#CEGUI.Element] new_local
-- @param self
-- @return #CEGUI.Element

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Element
-- @param self
-- @return #CEGUI.Element

---delete
---@return 
 function CEGUI.Element:delete() end

---getParentElement
---@return CEGUI.Element
 function CEGUI.Element:getParentElement() end

---setArea
---@param area CEGUI.URect
 function CEGUI.Element:setArea(area) end

---setArea
---@param pos CEGUI.UVector2
---@param size CEGUI.USize
 function CEGUI.Element:setArea(pos, size) end

---setArea
---@param xpos CEGUI.UDim
---@param ypos CEGUI.UDim
---@param width CEGUI.UDim
---@param height CEGUI.UDim
 function CEGUI.Element:setArea(xpos, ypos, width, height) end

---getArea
---@return CEGUI.URect
 function CEGUI.Element:getArea() end

---setPosition
---@param pos CEGUI.UVector2
 function CEGUI.Element:setPosition(pos) end

---setXPosition
---@param pos CEGUI.UDim
 function CEGUI.Element:setXPosition(pos) end

---setYPosition
---@param pos CEGUI.UDim
 function CEGUI.Element:setYPosition(pos) end

---getPosition
---@return CEGUI.UVector2
 function CEGUI.Element:getPosition() end

---getXPosition
---@return CEGUI.UDim
 function CEGUI.Element:getXPosition() end

---getYPosition
---@return CEGUI.UDim
 function CEGUI.Element:getYPosition() end

---setHorizontalAlignment
---@param alignment CEGUI.HorizontalAlignment
 function CEGUI.Element:setHorizontalAlignment(alignment) end

---getHorizontalAlignment
---@return CEGUI.HorizontalAlignment
 function CEGUI.Element:getHorizontalAlignment() end

---setVerticalAlignment
---@param alignment CEGUI.VerticalAlignment
 function CEGUI.Element:setVerticalAlignment(alignment) end

---getVerticalAlignment
---@return CEGUI.VerticalAlignment
 function CEGUI.Element:getVerticalAlignment() end

---setSize
---@param size CEGUI.USize
 function CEGUI.Element:setSize(size) end

---getSize
---@return CEGUI.USize
 function CEGUI.Element:getSize() end

---setWidth
---@param width CEGUI.UDim
 function CEGUI.Element:setWidth(width) end

---getWidth
---@return CEGUI.UDim
 function CEGUI.Element:getWidth() end

---setHeight
---@param height CEGUI.UDim
 function CEGUI.Element:setHeight(height) end

---getHeight
---@return CEGUI.UDim
 function CEGUI.Element:getHeight() end

---setMinSize
---@param size CEGUI.USize
 function CEGUI.Element:setMinSize(size) end

---getMinSize
---@return CEGUI.USize
 function CEGUI.Element:getMinSize() end

---setMaxSize
---@param size CEGUI.USize
 function CEGUI.Element:setMaxSize(size) end

---getMaxSize
---@return CEGUI.USize
 function CEGUI.Element:getMaxSize() end

---setAspectMode
---@param mode CEGUI.AspectMode
 function CEGUI.Element:setAspectMode(mode) end

---getAspectMode
---@return CEGUI.AspectMode
 function CEGUI.Element:getAspectMode() end

---setAspectRatio
---@param ratio number
 function CEGUI.Element:setAspectRatio(ratio) end

---getAspectRatio
---@return number
 function CEGUI.Element:getAspectRatio() end

---setPixelAligned
---@param setting boolean
 function CEGUI.Element:setPixelAligned(setting) end

---isPixelAligned
---@return boolean
 function CEGUI.Element:isPixelAligned() end

---getPixelPosition
---@return CEGUI.Vector2_float_
 function CEGUI.Element:getPixelPosition() end

---getPixelSize
---@return CEGUI.Size_float_
 function CEGUI.Element:getPixelSize() end

---calculatePixelSize
---@param skipAllPixelAlignment boolean
---@return CEGUI.Size_float_
 function CEGUI.Element:calculatePixelSize(skipAllPixelAlignment) end

---getParentPixelSize
---@param skipAllPixelAlignment boolean
---@return CEGUI.Size_float_
 function CEGUI.Element:getParentPixelSize(skipAllPixelAlignment) end

---getRotation
---@return CEGUI.Quaternion
 function CEGUI.Element:getRotation() end

---addChild
---@param element CEGUI.Element
 function CEGUI.Element:addChild(element) end

---removeChild
---@param element CEGUI.Element
 function CEGUI.Element:removeChild(element) end

---getChildElementAtIdx
---@param idx number
---@return CEGUI.Element
 function CEGUI.Element:getChildElementAtIdx(idx) end

---getChildCount
---@return number
 function CEGUI.Element:getChildCount() end

---isChild
---@param element CEGUI.Element
---@return boolean
 function CEGUI.Element:isChild(element) end

---isAncestor
---@param element CEGUI.Element
---@return boolean
 function CEGUI.Element:isAncestor(element) end

---setNonClient
---@param setting boolean
 function CEGUI.Element:setNonClient(setting) end

---isNonClient
---@return boolean
 function CEGUI.Element:isNonClient() end

---getUnclippedOuterRect
---@return CEGUI.Element.CachedRectf
 function CEGUI.Element:getUnclippedOuterRect() end

---getUnclippedInnerRect
---@return CEGUI.Element.CachedRectf
 function CEGUI.Element:getUnclippedInnerRect() end

---getUnclippedRect
---@param inner boolean
---@return CEGUI.Element.CachedRectf
 function CEGUI.Element:getUnclippedRect(inner) end

---getClientChildContentArea
---@return CEGUI.Element.CachedRectf
 function CEGUI.Element:getClientChildContentArea() end

---getNonClientChildContentArea
---@return CEGUI.Element.CachedRectf
 function CEGUI.Element:getNonClientChildContentArea() end

---getChildContentArea
---@param non_client boolean
---@return CEGUI.Element.CachedRectf
 function CEGUI.Element:getChildContentArea(non_client) end

---notifyScreenAreaChanged
---@param recursive boolean
 function CEGUI.Element:notifyScreenAreaChanged(recursive) end

---getRootContainerSize
---@return CEGUI.Size_float_
 function CEGUI.Element:getRootContainerSize() end

---setProperty
---@param name string
---@param value string
 function CEGUI.Element:setProperty(name, value) end

---getProperty
---@param name string
---@return string
 function CEGUI.Element:getProperty(name) end

---getPropertyDefault
---@param name string
---@return string
 function CEGUI.Element:getPropertyDefault(name) end

---getPropertyHelp
---@param name string
---@return string
 function CEGUI.Element:getPropertyHelp(name) end

---isPropertyPresent
---@param name string
---@return boolean
 function CEGUI.Element:isPropertyPresent(name) end

---isPropertyDefault
---@param name string
---@return boolean
 function CEGUI.Element:isPropertyDefault(name) end

---getPropertyIterator
---@return CEGUI.PropertyIterator
 function CEGUI.Element:getPropertyIterator() end

---addEvent
---@param name string
 function CEGUI.Element:addEvent(name) end

---removeEvent
---@param name string
 function CEGUI.Element:removeEvent(name) end

---removeAllEvents
 function CEGUI.Element:removeAllEvents() end

---isEventPresent
---@param name string
---@return boolean
 function CEGUI.Element:isEventPresent(name) end

---subscribeEvent
---@param name string
---@param funcIndex lua_Object
---@param selfIndex lua_Object
---@param error_handler lua_Object
---@param tolua_var_2 lua_State
---@return CEGUI.EventConnection
 function CEGUI.Element:subscribeEvent(name, funcIndex, selfIndex, error_handler, tolua_var_2) end

---subscribeEvent
---@param name string
---@param callback_name string
---@return CEGUI.EventConnection
 function CEGUI.Element:subscribeEvent(name, callback_name) end

---fireEvent
---@param name string
---@param args CEGUI.EventArgs
---@param eventnamespace string
 function CEGUI.Element:fireEvent(name, args, eventnamespace) end

---isMuted
---@return boolean
 function CEGUI.Element:isMuted() end

---setMutedState
---@param setting boolean
 function CEGUI.Element:setMutedState(setting) end

---getEventIterator
---@return CEGUI.EventIterator
 function CEGUI.Element:getEventIterator() end


---------------------------------------------------------------------------------
---NamedElementEventArgs
---@class CEGUI.NamedElementEventArgs : CEGUI.EventArgs
 local NamedElementEventArgs = {}
 CEGUI.NamedElementEventArgs = NamedElementEventArgs
 CEGUI.NamedElementEventArgs = NamedElementEventArgs


---new
---@param element CEGUI.NamedElement
---@return CEGUI.NamedElementEventArgs
 function CEGUI.NamedElementEventArgs:new(element) end

---
-- new_local 
-- @function [parent=#CEGUI.NamedElementEventArgs] new_local
-- @param self
-- @param #CEGUI.NamedElement element
-- @return #CEGUI.NamedElementEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.NamedElementEventArgs
-- @param self
-- @return #CEGUI.NamedElementEventArgs

---
-- @field [parent=#CEGUI.NamedElementEventArgs] #CEGUI.NamedElement element


---------------------------------------------------------------------------------
---NamedElement
---@class CEGUI.NamedElement : CEGUI.Element
 local NamedElement = {}
 CEGUI.NamedElement = NamedElement
 CEGUI.NamedElement = NamedElement


---new
---@param name string
---@return CEGUI.NamedElement
 function CEGUI.NamedElement:new(name) end

---
-- new_local 
-- @function [parent=#CEGUI.NamedElement] new_local
-- @param self
-- @param #string name
-- @return #CEGUI.NamedElement

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.NamedElement
-- @param self
-- @return #CEGUI.NamedElement

---delete
---@return 
 function CEGUI.NamedElement:delete() end

---setName
---@param name string
 function CEGUI.NamedElement:setName(name) end

---getName
---@return string
 function CEGUI.NamedElement:getName() end

---getNamePath
---@return string
 function CEGUI.NamedElement:getNamePath() end

---isChild
---@param name_path string
---@return boolean
 function CEGUI.NamedElement:isChild(name_path) end

---isAncestor
---@param name string
---@return boolean
 function CEGUI.NamedElement:isAncestor(name) end

---getChildElement
---@param name_path string
---@return CEGUI.NamedElement
 function CEGUI.NamedElement:getChildElement(name_path) end

---removeChild
---@param name_path string
 function CEGUI.NamedElement:removeChild(name_path) end


 CEGUI.WUM_ALWAYS = 1
 CEGUI.WUM_NEVER = 2
 CEGUI.WUM_VISIBLE = 3
---------------------------------------------------------------------------------
---Window
---@class CEGUI.Window : CEGUI.NamedElement
 local Window = {}
 CEGUI.Window = Window
 CEGUI.Window = Window


---getType
---@return string
 function CEGUI.Window:getType() end

---setAutoWindow
---@param is_auto boolean
 function CEGUI.Window:setAutoWindow(is_auto) end

---isAutoWindow
---@return boolean
 function CEGUI.Window:isAutoWindow() end

---isDestroyedByParent
---@return boolean
 function CEGUI.Window:isDestroyedByParent() end

---isAlwaysOnTop
---@return boolean
 function CEGUI.Window:isAlwaysOnTop() end

---isDisabled
---@return boolean
 function CEGUI.Window:isDisabled() end

---isEffectiveDisabled
---@return boolean
 function CEGUI.Window:isEffectiveDisabled() end

---isVisible
---@return boolean
 function CEGUI.Window:isVisible() end

---isEffectiveVisible
---@return boolean
 function CEGUI.Window:isEffectiveVisible() end

---isActive
---@return boolean
 function CEGUI.Window:isActive() end

---isClippedByParent
---@return boolean
 function CEGUI.Window:isClippedByParent() end

---setDestroyedByParent
---@param setting boolean
 function CEGUI.Window:setDestroyedByParent(setting) end

---setAlwaysOnTop
---@param setting boolean
 function CEGUI.Window:setAlwaysOnTop(setting) end

---setEnabled
---@param setting boolean
 function CEGUI.Window:setEnabled(setting) end

---setDisabled
---@param setting boolean
 function CEGUI.Window:setDisabled(setting) end

---enable
 function CEGUI.Window:enable() end

---disable
 function CEGUI.Window:disable() end

---setVisible
---@param setting boolean
 function CEGUI.Window:setVisible(setting) end

---show
 function CEGUI.Window:show() end

---hide
 function CEGUI.Window:hide() end

---activate
 function CEGUI.Window:activate() end

---deactivate
 function CEGUI.Window:deactivate() end

---setClippedByParent
---@param setting boolean
 function CEGUI.Window:setClippedByParent(setting) end

---getID
---@return number
 function CEGUI.Window:getID() end

---setID
---@param ID number
 function CEGUI.Window:setID(ID) end

---getRootWindow
---@return CEGUI.Window
 function CEGUI.Window:getRootWindow() end

---getRootWindow
---@return CEGUI.Window
 function CEGUI.Window:getRootWindow() end

---getParent
---@return CEGUI.Window
 function CEGUI.Window:getParent() end

---getActiveSibling
---@return CEGUI.Window
 function CEGUI.Window:getActiveSibling() end

---getActiveChild
---@return CEGUI.Window
 function CEGUI.Window:getActiveChild() end

---getActiveChild
---@return CEGUI.Window
 function CEGUI.Window:getActiveChild() end

---isChild
---@param ID number
---@return boolean
 function CEGUI.Window:isChild(ID) end

---isChild
---@param name_path string
---@return boolean
 function CEGUI.Window:isChild(name_path) end

---isChildRecursive
---@param ID number
---@return boolean
 function CEGUI.Window:isChildRecursive(ID) end

---isAncestor
---@param ID number
---@return boolean
 function CEGUI.Window:isAncestor(ID) end

---isAncestor
---@param name string
---@return boolean
 function CEGUI.Window:isAncestor(name) end

---getChildAtIdx
---@param idx number
---@return CEGUI.Window
 function CEGUI.Window:getChildAtIdx(idx) end

---getChild
---@param name_path string
---@return CEGUI.Window
 function CEGUI.Window:getChild(name_path) end

---getChild
---@param ID number
---@return CEGUI.Window
 function CEGUI.Window:getChild(ID) end

---getChildRecursive
---@param name_path string
---@return CEGUI.Window
 function CEGUI.Window:getChildRecursive(name_path) end

---getChildRecursive
---@param ID number
---@return CEGUI.Window
 function CEGUI.Window:getChildRecursive(ID) end

---createChild
---@param type string
---@param name string
---@return CEGUI.Window
 function CEGUI.Window:createChild(type, name) end

---destroyChild
---@param wnd CEGUI.Window
 function CEGUI.Window:destroyChild(wnd) end

---destroyChild
---@param name_path string
 function CEGUI.Window:destroyChild(name_path) end

---removeChild
---@param ID number
 function CEGUI.Window:removeChild(ID) end

---removeChild
---@param wnd CEGUI.Window
 function CEGUI.Window:removeChild(wnd) end

---getFont
---@param useDefault boolean
---@return CEGUI.Font
 function CEGUI.Window:getFont(useDefault) end

---setFont
---@param font CEGUI.Font
 function CEGUI.Window:setFont(font) end

---setFont
---@param name string
 function CEGUI.Window:setFont(name) end

---getText
---@return string
 function CEGUI.Window:getText() end

---getTextVisual
---@return string
 function CEGUI.Window:getTextVisual() end

---setText
---@param text string
 function CEGUI.Window:setText(text) end

---insertText
---@param text string
---@param position number
 function CEGUI.Window:insertText(text, position) end

---appendText
---@param text string
 function CEGUI.Window:appendText(text) end

---inheritsAlpha
---@return boolean
 function CEGUI.Window:inheritsAlpha() end

---setInheritsAlpha
---@param setting boolean
 function CEGUI.Window:setInheritsAlpha(setting) end

---getEffectiveAlpha
---@return number
 function CEGUI.Window:getEffectiveAlpha() end

---getAlpha
---@return number
 function CEGUI.Window:getAlpha() end

---setAlpha
---@param alpha number
 function CEGUI.Window:setAlpha(alpha) end

---getOuterRectClipper
---@return CEGUI.Rect_float_
 function CEGUI.Window:getOuterRectClipper() end

---getInnerRectClipper
---@return CEGUI.Rect_float_
 function CEGUI.Window:getInnerRectClipper() end

---getClipRect
---@param non_client boolean
---@return CEGUI.Rect_float_
 function CEGUI.Window:getClipRect(non_client) end

---getHitTestRect
---@return CEGUI.Rect_float_
 function CEGUI.Window:getHitTestRect() end

---getCaptureWindow
---@return CEGUI.Window
 function CEGUI.Window:getCaptureWindow() end

---isCapturedByThis
---@return boolean
 function CEGUI.Window:isCapturedByThis() end

---isCapturedByAncestor
---@return boolean
 function CEGUI.Window:isCapturedByAncestor() end

---isCapturedByChild
---@return boolean
 function CEGUI.Window:isCapturedByChild() end

---isHit
---@param position CEGUI.Vector2_float_
---@param allow_disabled boolean
---@return boolean
 function CEGUI.Window:isHit(position, allow_disabled) end

---getChildAtPosition
---@param position CEGUI.Vector2_float_
---@return CEGUI.Window
 function CEGUI.Window:getChildAtPosition(position) end

---getTargetChildAtPosition
---@param position CEGUI.Vector2_float_
---@param allow_disabled boolean
---@return CEGUI.Window
 function CEGUI.Window:getTargetChildAtPosition(position, allow_disabled) end

---getMouseCursor
---@param useDefault boolean
---@return CEGUI.Image
 function CEGUI.Window:getMouseCursor(useDefault) end

---setMouseCursor
---@param image CEGUI.Image
 function CEGUI.Window:setMouseCursor(image) end

---setMouseCursor
---@param name string
 function CEGUI.Window:setMouseCursor(name) end

---restoresOldCapture
---@return boolean
 function CEGUI.Window:restoresOldCapture() end

---setRestoreOldCapture
---@param setting boolean
 function CEGUI.Window:setRestoreOldCapture(setting) end

---captureInput
---@return boolean
 function CEGUI.Window:captureInput() end

---releaseInput
 function CEGUI.Window:releaseInput() end

---getZIndex
---@return number
 function CEGUI.Window:getZIndex() end

---isZOrderingEnabled
---@return boolean
 function CEGUI.Window:isZOrderingEnabled() end

---setZOrderingEnabled
---@param setting boolean
 function CEGUI.Window:setZOrderingEnabled(setting) end

---moveToFront
 function CEGUI.Window:moveToFront() end

---moveToBack
 function CEGUI.Window:moveToBack() end

---moveInFront
---@param window CEGUI.Window
 function CEGUI.Window:moveInFront(window) end

---moveBehind
---@param window CEGUI.Window
 function CEGUI.Window:moveBehind(window) end

---isInFront
---@param wnd CEGUI.Window
---@return boolean
 function CEGUI.Window:isInFront(wnd) end

---isBehind
---@param wnd CEGUI.Window
---@return boolean
 function CEGUI.Window:isBehind(wnd) end

---wantsMultiClickEvents
---@return boolean
 function CEGUI.Window:wantsMultiClickEvents() end

---setWantsMultiClickEvents
---@param setting boolean
 function CEGUI.Window:setWantsMultiClickEvents(setting) end

---isMouseAutoRepeatEnabled
---@return boolean
 function CEGUI.Window:isMouseAutoRepeatEnabled() end

---getAutoRepeatDelay
---@return number
 function CEGUI.Window:getAutoRepeatDelay() end

---getAutoRepeatRate
---@return number
 function CEGUI.Window:getAutoRepeatRate() end

---setMouseAutoRepeatEnabled
---@param setting boolean
 function CEGUI.Window:setMouseAutoRepeatEnabled(setting) end

---setAutoRepeatDelay
---@param delay number
 function CEGUI.Window:setAutoRepeatDelay(delay) end

---setAutoRepeatRate
---@param rate number
 function CEGUI.Window:setAutoRepeatRate(rate) end

---isMouseInputPropagationEnabled
---@return boolean
 function CEGUI.Window:isMouseInputPropagationEnabled() end

---setMouseInputPropagationEnabled
---@param enabled boolean
 function CEGUI.Window:setMouseInputPropagationEnabled(enabled) end

---isMousePassThroughEnabled
---@return boolean
 function CEGUI.Window:isMousePassThroughEnabled() end

---setMousePassThroughEnabled
---@param setting boolean
 function CEGUI.Window:setMousePassThroughEnabled(setting) end

---distributesCapturedInputs
---@return boolean
 function CEGUI.Window:distributesCapturedInputs() end

---setDistributesCapturedInputs
---@param setting boolean
 function CEGUI.Window:setDistributesCapturedInputs(setting) end

---isUsingDefaultTooltip
---@return boolean
 function CEGUI.Window:isUsingDefaultTooltip() end

---getTooltip
---@return CEGUI.Tooltip
 function CEGUI.Window:getTooltip() end

---setTooltip
---@param tooltip CEGUI.Tooltip
 function CEGUI.Window:setTooltip(tooltip) end

---getTooltipType
---@return string
 function CEGUI.Window:getTooltipType() end

---setTooltipType
---@param tooltipType string
 function CEGUI.Window:setTooltipType(tooltipType) end

---getTooltipText
---@return string
 function CEGUI.Window:getTooltipText() end

---setTooltipText
---@param tip string
 function CEGUI.Window:setTooltipText(tip) end

---setInheritsTooltipText
---@param setting boolean
 function CEGUI.Window:setInheritsTooltipText(setting) end

---inheritsTooltipText
---@return boolean
 function CEGUI.Window:inheritsTooltipText() end

---isRiseOnClickEnabled
---@return boolean
 function CEGUI.Window:isRiseOnClickEnabled() end

---setRiseOnClickEnabled
---@param setting boolean
 function CEGUI.Window:setRiseOnClickEnabled(setting) end

---getGeometryBuffer
---@return CEGUI.GeometryBuffer
 function CEGUI.Window:getGeometryBuffer() end

---getLookNFeel
---@return string
 function CEGUI.Window:getLookNFeel() end

---setLookNFeel
---@param look string
 function CEGUI.Window:setLookNFeel(look) end

---setFalagardType
---@param type string
---@param rendererType string
 function CEGUI.Window:setFalagardType(type, rendererType) end

---setWindowRenderer
---@param name string
 function CEGUI.Window:setWindowRenderer(name) end

---getWindowRendererName
---@return string
 function CEGUI.Window:getWindowRendererName() end

---getModalState
---@return boolean
 function CEGUI.Window:getModalState() end

---setModalState
---@param state boolean
 function CEGUI.Window:setModalState(state) end

---isUserStringDefined
---@param name string
---@return boolean
 function CEGUI.Window:isUserStringDefined(name) end

---getUserString
---@param name string
---@return string
 function CEGUI.Window:getUserString(name) end

---setUserString
---@param name string
---@param value string
 function CEGUI.Window:setUserString(name, value) end

---isDragDropTarget
---@return boolean
 function CEGUI.Window:isDragDropTarget() end

---setDragDropTarget
---@param setting boolean
 function CEGUI.Window:setDragDropTarget(setting) end

---notifyDragDropItemEnters
---@param item CEGUI.DragContainer
 function CEGUI.Window:notifyDragDropItemEnters(item) end

---notifyDragDropItemLeaves
---@param item CEGUI.DragContainer
 function CEGUI.Window:notifyDragDropItemLeaves(item) end

---notifyDragDropItemDropped
---@param item CEGUI.DragContainer
 function CEGUI.Window:notifyDragDropItemDropped(item) end

---isWritingXMLAllowed
---@return boolean
 function CEGUI.Window:isWritingXMLAllowed() end

---setWritingXMLAllowed
---@param allow boolean
 function CEGUI.Window:setWritingXMLAllowed(allow) end

---banPropertyFromXML
---@param property_name string
 function CEGUI.Window:banPropertyFromXML(property_name) end

---unbanPropertyFromXML
---@param property_name string
 function CEGUI.Window:unbanPropertyFromXML(property_name) end

---isPropertyBannedFromXML
---@param property_name string
---@return boolean
 function CEGUI.Window:isPropertyBannedFromXML(property_name) end

---banPropertyFromXML
---@param property CEGUI.Property
 function CEGUI.Window:banPropertyFromXML(property) end

---unbanPropertyFromXML
---@param property CEGUI.Property
 function CEGUI.Window:unbanPropertyFromXML(property) end

---isPropertyBannedFromXML
---@param property CEGUI.Property
---@return boolean
 function CEGUI.Window:isPropertyBannedFromXML(property) end

---getTargetRenderingSurface
---@return CEGUI.RenderingSurface
 function CEGUI.Window:getTargetRenderingSurface() end

---getRenderingSurface
---@return CEGUI.RenderingSurface
 function CEGUI.Window:getRenderingSurface() end

---setRenderingSurface
---@param surface CEGUI.RenderingSurface
 function CEGUI.Window:setRenderingSurface(surface) end

---isUsingAutoRenderingSurface
---@return boolean
 function CEGUI.Window:isUsingAutoRenderingSurface() end

---setUsingAutoRenderingSurface
---@param setting boolean
 function CEGUI.Window:setUsingAutoRenderingSurface(setting) end

---invalidateRenderingSurface
 function CEGUI.Window:invalidateRenderingSurface() end

---invalidate
 function CEGUI.Window:invalidate() end

---invalidate
---@param recursive boolean
 function CEGUI.Window:invalidate(recursive) end

---notifyScreenAreaChanged
---@param recursive boolean
 function CEGUI.Window:notifyScreenAreaChanged(recursive) end

---isTextParsingEnabled
---@return boolean
 function CEGUI.Window:isTextParsingEnabled() end

---setTextParsingEnabled
---@param setting boolean
 function CEGUI.Window:setTextParsingEnabled(setting) end

---getMargin
---@return CEGUI.UBox
 function CEGUI.Window:getMargin() end

---setMargin
---@param margin CEGUI.UBox
 function CEGUI.Window:setMargin(margin) end

---getUnprojectedPosition
---@param pos CEGUI.Vector2_float_
---@return CEGUI.Vector2_float_
 function CEGUI.Window:getUnprojectedPosition(pos) end

---getUpdateMode
---@return CEGUI.WindowUpdateMode
 function CEGUI.Window:getUpdateMode() end

---setUpdateMode
---@param mode CEGUI.WindowUpdateMode
 function CEGUI.Window:setUpdateMode(mode) end

---clone
---@param deepCopy boolean
---@return CEGUI.Window
 function CEGUI.Window:clone(deepCopy) end

---clonePropertiesTo
---@param target CEGUI.Window
 function CEGUI.Window:clonePropertiesTo(target) end

---cloneChildWidgetsTo
---@param target CEGUI.Window
 function CEGUI.Window:cloneChildWidgetsTo(target) end

---getGUIContext
---@return CEGUI.GUIContext
 function CEGUI.Window:getGUIContext() end


---------------------------------------------------------------------------------
---CoordConverter
---@class CEGUI.CoordConverter
 local CoordConverter = {}
 CEGUI.CoordConverter = CoordConverter
 CEGUI.CoordConverter = CoordConverter


---asAbsolute
---@param u CEGUI.UDim
---@param base number
---@return number
 function CEGUI.CoordConverter:asAbsolute(u, base) end

---asRelative
---@param u CEGUI.UDim
---@param base number
---@return number
 function CEGUI.CoordConverter:asRelative(u, base) end

---asAbsolute
---@param v CEGUI.UVector2
---@param base CEGUI.Size_float_
---@return CEGUI.Vector2_float_
 function CEGUI.CoordConverter:asAbsolute(v, base) end

---asRelative
---@param v CEGUI.UVector2
---@param base CEGUI.Size_float_
---@return CEGUI.Vector2_float_
 function CEGUI.CoordConverter:asRelative(v, base) end

---asAbsolute
---@param r CEGUI.URect
---@param base CEGUI.Size_float_
---@return CEGUI.Rect_float_
 function CEGUI.CoordConverter:asAbsolute(r, base) end

---asRelative
---@param r CEGUI.URect
---@param base CEGUI.Size_float_
---@return CEGUI.Rect_float_
 function CEGUI.CoordConverter:asRelative(r, base) end

---screenToWindowX
---@param window CEGUI.Window
---@param x CEGUI.UDim
---@return number
 function CEGUI.CoordConverter:screenToWindowX(window, x) end

---screenToWindowX
---@param window CEGUI.Window
---@param x number
---@return number
 function CEGUI.CoordConverter:screenToWindowX(window, x) end

---screenToWindowY
---@param window CEGUI.Window
---@param y CEGUI.UDim
---@return number
 function CEGUI.CoordConverter:screenToWindowY(window, y) end

---screenToWindowY
---@param window CEGUI.Window
---@param y number
---@return number
 function CEGUI.CoordConverter:screenToWindowY(window, y) end

---screenToWindow
---@param window CEGUI.Window
---@param vec CEGUI.UVector2
---@return CEGUI.Vector2_float_
 function CEGUI.CoordConverter:screenToWindow(window, vec) end

---screenToWindow
---@param window CEGUI.Window
---@param vec CEGUI.Vector2_float_
---@return CEGUI.Vector2_float_
 function CEGUI.CoordConverter:screenToWindow(window, vec) end

---screenToWindow
---@param window CEGUI.Window
---@param rect CEGUI.URect
---@return CEGUI.Rect_float_
 function CEGUI.CoordConverter:screenToWindow(window, rect) end

---screenToWindow
---@param window CEGUI.Window
---@param rect CEGUI.Rect_float_
---@return CEGUI.Rect_float_
 function CEGUI.CoordConverter:screenToWindow(window, rect) end


---------------------------------------------------------------------------------
---System
---@class CEGUI.System : CEGUI.EventSet
 local System = {}
 CEGUI.System = System
 CEGUI.System = System


---getMajorVersion
---@return number
 function CEGUI.System:getMajorVersion() end

---getMinorVersion
---@return number
 function CEGUI.System:getMinorVersion() end

---getPatchVersion
---@return number
 function CEGUI.System:getPatchVersion() end

---getVersion
---@return string
 function CEGUI.System:getVersion() end

---getVerboseVersion
---@return string
 function CEGUI.System:getVerboseVersion() end

---getSingleton
---@return CEGUI.System
 function CEGUI.System:getSingleton() end

---getRenderer
---@return CEGUI.Renderer
 function CEGUI.System:getRenderer() end

---getDefaultGUIContext
---@return CEGUI.GUIContext
 function CEGUI.System:getDefaultGUIContext() end

---renderAllGUIContexts
 function CEGUI.System:renderAllGUIContexts() end

---executeScriptFile
---@param filename string
---@param resourceGroup string
 function CEGUI.System:executeScriptFile(filename, resourceGroup) end

---executeScriptGlobal
---@param function_name string
---@return number
 function CEGUI.System:executeScriptGlobal(function_name) end

---executeScriptString
---@param str string
 function CEGUI.System:executeScriptString(str) end

---notifyDisplaySizeChanged
---@param new_size CEGUI.Size_float_
 function CEGUI.System:notifyDisplaySizeChanged(new_size) end

---invalidateAllCachedRendering
 function CEGUI.System:invalidateAllCachedRendering() end

---injectTimePulse
---@param timeElapsed number
---@return boolean
 function CEGUI.System:injectTimePulse(timeElapsed) end

---createGUIContext
---@param rt CEGUI.RenderTarget
---@return CEGUI.GUIContext
 function CEGUI.System:createGUIContext(rt) end

---destroyGUIContext
---@param context CEGUI.GUIContext
 function CEGUI.System:destroyGUIContext(context) end

---addStandardWindowFactories
 function CEGUI.System:addStandardWindowFactories() end

---getStringTranscoder
---@return CEGUI.StringTranscoder
 function CEGUI.System:getStringTranscoder() end

---getEventIterator
---@return CEGUI.EventIterator
 function CEGUI.System:getEventIterator() end


---------------------------------------------------------------------------------
---GUIContextEventArgs
---@class CEGUI.GUIContextEventArgs : CEGUI.EventArgs
 local GUIContextEventArgs = {}
 CEGUI.GUIContextEventArgs = GUIContextEventArgs
 CEGUI.GUIContextEventArgs = GUIContextEventArgs


---new
---@param context CEGUI.GUIContext
---@return CEGUI.GUIContextEventArgs
 function CEGUI.GUIContextEventArgs:new(context) end

---
-- new_local 
-- @function [parent=#CEGUI.GUIContextEventArgs] new_local
-- @param self
-- @param #CEGUI.GUIContext context
-- @return #CEGUI.GUIContextEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.GUIContextEventArgs
-- @param self
-- @return #CEGUI.GUIContextEventArgs

---
-- @field [parent=#CEGUI.GUIContextEventArgs] #CEGUI.GUIContext context


---------------------------------------------------------------------------------
---GUIContext
---@class CEGUI.GUIContext : CEGUI.RenderingSurface
 local GUIContext = {}
 CEGUI.GUIContext = GUIContext
 CEGUI.GUIContext = GUIContext


---getRootWindow
---@return CEGUI.Window
 function CEGUI.GUIContext:getRootWindow() end

---setRootWindow
---@param new_root CEGUI.Window
 function CEGUI.GUIContext:setRootWindow(new_root) end

---getModalWindow
---@return CEGUI.Window
 function CEGUI.GUIContext:getModalWindow() end

---getWindowContainingMouse
---@return CEGUI.Window
 function CEGUI.GUIContext:getWindowContainingMouse() end

---getSurfaceSize
---@return CEGUI.Size_float_
 function CEGUI.GUIContext:getSurfaceSize() end

---getSystemKeys
---@return CEGUI.SystemKeys
 function CEGUI.GUIContext:getSystemKeys() end

---markAsDirty
 function CEGUI.GUIContext:markAsDirty() end

---isDirty
---@return boolean
 function CEGUI.GUIContext:isDirty() end

---getMouseCursor
---@return CEGUI.MouseCursor
 function CEGUI.GUIContext:getMouseCursor() end

---setMouseMoveScalingFactor
---@param factor number
 function CEGUI.GUIContext:setMouseMoveScalingFactor(factor) end

---getMouseMoveScalingFactor
---@return number
 function CEGUI.GUIContext:getMouseMoveScalingFactor() end

---setMouseButtonClickTimeout
---@param seconds number
 function CEGUI.GUIContext:setMouseButtonClickTimeout(seconds) end

---getMouseButtonClickTimeout
---@return number
 function CEGUI.GUIContext:getMouseButtonClickTimeout() end

---setMouseButtonMultiClickTimeout
---@param seconds number
 function CEGUI.GUIContext:setMouseButtonMultiClickTimeout(seconds) end

---getMouseButtonMultiClickTimeout
---@return number
 function CEGUI.GUIContext:getMouseButtonMultiClickTimeout() end

---setMouseButtonMultiClickTolerance
---@param sz CEGUI.Size_float_
 function CEGUI.GUIContext:setMouseButtonMultiClickTolerance(sz) end

---getMouseButtonMultiClickTolerance
---@return CEGUI.Size_float_
 function CEGUI.GUIContext:getMouseButtonMultiClickTolerance() end

---setMouseClickEventGenerationEnabled
---@param enable boolean
 function CEGUI.GUIContext:setMouseClickEventGenerationEnabled(enable) end

---isMouseClickEventGenerationEnabled
---@return boolean
 function CEGUI.GUIContext:isMouseClickEventGenerationEnabled() end

---updateWindowContainingMouse
 function CEGUI.GUIContext:updateWindowContainingMouse() end

---getInputCaptureWindow
---@return CEGUI.Window
 function CEGUI.GUIContext:getInputCaptureWindow() end

---setDefaultTooltipObject
---@param tooltip CEGUI.Tooltip
 function CEGUI.GUIContext:setDefaultTooltipObject(tooltip) end

---setDefaultTooltipType
---@param tooltip_type string
 function CEGUI.GUIContext:setDefaultTooltipType(tooltip_type) end

---getDefaultTooltipObject
---@return CEGUI.Tooltip
 function CEGUI.GUIContext:getDefaultTooltipObject() end

---setDefaultFont
---@param name string
 function CEGUI.GUIContext:setDefaultFont(name) end

---setDefaultFont
---@param font CEGUI.Font
 function CEGUI.GUIContext:setDefaultFont(font) end

---getDefaultFont
---@return CEGUI.Font
 function CEGUI.GUIContext:getDefaultFont() end

---injectMouseMove
---@param delta_x number
---@param delta_y number
---@return boolean
 function CEGUI.GUIContext:injectMouseMove(delta_x, delta_y) end

---injectMouseLeaves
---@return boolean
 function CEGUI.GUIContext:injectMouseLeaves() end

---injectMouseButtonDown
---@param button CEGUI.MouseButton
---@return boolean
 function CEGUI.GUIContext:injectMouseButtonDown(button) end

---injectMouseButtonUp
---@param button CEGUI.MouseButton
---@return boolean
 function CEGUI.GUIContext:injectMouseButtonUp(button) end

---injectKeyDown
---@param scan_code CEGUI.Key.Scan
---@return boolean
 function CEGUI.GUIContext:injectKeyDown(scan_code) end

---injectKeyUp
---@param scan_code CEGUI.Key.Scan
---@return boolean
 function CEGUI.GUIContext:injectKeyUp(scan_code) end

---injectChar
---@param code_point number
---@return boolean
 function CEGUI.GUIContext:injectChar(code_point) end

---injectMouseWheelChange
---@param delta number
---@return boolean
 function CEGUI.GUIContext:injectMouseWheelChange(delta) end

---injectMousePosition
---@param x_pos number
---@param y_pos number
---@return boolean
 function CEGUI.GUIContext:injectMousePosition(x_pos, y_pos) end

---injectTimePulse
---@param timeElapsed number
---@return boolean
 function CEGUI.GUIContext:injectTimePulse(timeElapsed) end

---injectMouseButtonClick
---@param button CEGUI.MouseButton
---@return boolean
 function CEGUI.GUIContext:injectMouseButtonClick(button) end

---injectMouseButtonDoubleClick
---@param button CEGUI.MouseButton
---@return boolean
 function CEGUI.GUIContext:injectMouseButtonDoubleClick(button) end

---injectMouseButtonTripleClick
---@param button CEGUI.MouseButton
---@return boolean
 function CEGUI.GUIContext:injectMouseButtonTripleClick(button) end

---injectCopyRequest
---@return boolean
 function CEGUI.GUIContext:injectCopyRequest() end

---injectCutRequest
---@return boolean
 function CEGUI.GUIContext:injectCutRequest() end

---injectPasteRequest
---@return boolean
 function CEGUI.GUIContext:injectPasteRequest() end


---------------------------------------------------------------------------------
---WindowManager
---@class CEGUI.WindowManager : CEGUI.EventSet
 local WindowManager = {}
 CEGUI.WindowManager = WindowManager
 CEGUI.WindowManager = WindowManager


---getSingleton
---@return CEGUI.WindowManager
 function CEGUI.WindowManager:getSingleton() end

---createWindow
---@param type string
---@param name string
---@return CEGUI.Window
 function CEGUI.WindowManager:createWindow(type, name) end

---loadLayoutFromFile
---@param filename string
---@param resourceGroup string
---@return CEGUI.Window
 function CEGUI.WindowManager:loadLayoutFromFile(filename, resourceGroup) end

---loadLayoutFromString
---@param source string
---@return CEGUI.Window
 function CEGUI.WindowManager:loadLayoutFromString(source) end

---writeLayoutToStream
---@param window CEGUI.Window
---@param out CEGUI.OutStream
 function CEGUI.WindowManager:writeLayoutToStream(window, out) end

---getLayoutAsString
---@param window CEGUI.Window
---@return string
 function CEGUI.WindowManager:getLayoutAsString(window) end

---saveLayoutToFile
---@param window CEGUI.Window
---@param filename string
 function CEGUI.WindowManager:saveLayoutToFile(window, filename) end

---destroyWindow
---@param window CEGUI.Window
 function CEGUI.WindowManager:destroyWindow(window) end

---destroyAllWindows
 function CEGUI.WindowManager:destroyAllWindows() end

---isAlive
---@param window CEGUI.Window
---@return boolean
 function CEGUI.WindowManager:isAlive(window) end

---isDeadPoolEmpty
---@return boolean
 function CEGUI.WindowManager:isDeadPoolEmpty() end

---cleanDeadPool
 function CEGUI.WindowManager:cleanDeadPool() end

---getIterator
---@return CEGUI.WindowIterator
 function CEGUI.WindowManager:getIterator() end

---setDefaultResourceGroup
---@param resourceGroup string
 function CEGUI.WindowManager:setDefaultResourceGroup(resourceGroup) end

---getDefaultResourceGroup
---@return string
 function CEGUI.WindowManager:getDefaultResourceGroup() end

---lock
 function CEGUI.WindowManager:lock() end

---unlock
 function CEGUI.WindowManager:unlock() end

---isLocked
---@return boolean
 function CEGUI.WindowManager:isLocked() end

---getEventIterator
---@return CEGUI.EventIterator
 function CEGUI.WindowManager:getEventIterator() end


---------------------------------------------------------------------------------
---FalagardWindowMapping
---@class CEGUI.FalagardWindowMapping
 local FalagardWindowMapping = {}
 CEGUI.FalagardWindowMapping = FalagardWindowMapping
 CEGUI.FalagardWindowMapping = FalagardWindowMapping


---
-- @field [parent=#CEGUI.FalagardWindowMapping] #string windowType

---
-- @field [parent=#CEGUI.FalagardWindowMapping] #string lookName

---
-- @field [parent=#CEGUI.FalagardWindowMapping] #string baseType

---
-- @field [parent=#CEGUI.FalagardWindowMapping] #string rendererType

---
-- @field [parent=#CEGUI.FalagardWindowMapping] #string effectName


---------------------------------------------------------------------------------
---WindowFactory
---@class CEGUI.WindowFactory
 local WindowFactory = {}
 CEGUI.WindowFactory = WindowFactory
 CEGUI.WindowFactory = WindowFactory


---getTypeName
---@return string
 function CEGUI.WindowFactory:getTypeName() end


---------------------------------------------------------------------------------
---WindowFactoryManager
---@class CEGUI.WindowFactoryManager
 local WindowFactoryManager = {}
 CEGUI.WindowFactoryManager = WindowFactoryManager
 CEGUI.WindowFactoryManager = WindowFactoryManager


---getSingleton
---@return CEGUI.WindowFactoryManager
 function CEGUI.WindowFactoryManager:getSingleton() end

---isFactoryPresent
---@param name string
---@return boolean
 function CEGUI.WindowFactoryManager:isFactoryPresent(name) end

---addWindowTypeAlias
---@param aliasName string
---@param targetType string
 function CEGUI.WindowFactoryManager:addWindowTypeAlias(aliasName, targetType) end

---removeWindowTypeAlias
---@param aliasName string
---@param targetType string
 function CEGUI.WindowFactoryManager:removeWindowTypeAlias(aliasName, targetType) end

---addFalagardWindowMapping
---@param newType string
---@param targetType string
---@param lookName string
---@param renderer string
---@param effectName string
 function CEGUI.WindowFactoryManager:addFalagardWindowMapping(newType, targetType, lookName, renderer, effectName) end

---removeFalagardWindowMapping
---@param type string
 function CEGUI.WindowFactoryManager:removeFalagardWindowMapping(type) end

---isFalagardMappedType
---@param type string
---@return boolean
 function CEGUI.WindowFactoryManager:isFalagardMappedType(type) end

---getMappedLookForType
---@param type string
---@return string
 function CEGUI.WindowFactoryManager:getMappedLookForType(type) end

---getMappedRendererForType
---@param type string
---@return string
 function CEGUI.WindowFactoryManager:getMappedRendererForType(type) end

---getDereferencedAliasType
---@param type string
---@return CEGUI.String
 function CEGUI.WindowFactoryManager:getDereferencedAliasType(type) end

---getFalagardMappingForType
---@param type string
---@return CEGUI.FalagardWindowMapping
 function CEGUI.WindowFactoryManager:getFalagardMappingForType(type) end

---removeAllWindowTypeAliases
 function CEGUI.WindowFactoryManager:removeAllWindowTypeAliases() end

---removeAllFalagardWindowMappings
 function CEGUI.WindowFactoryManager:removeAllFalagardWindowMappings() end

---getIterator
---@return CEGUI.WindowFactoryIterator
 function CEGUI.WindowFactoryManager:getIterator() end

---getFalagardMappingIterator
---@return CEGUI.FalagardMappingIterator
 function CEGUI.WindowFactoryManager:getFalagardMappingIterator() end


---------------------------------------------------------------------------------
---Scheme
---@class CEGUI.Scheme
 local Scheme = {}
 CEGUI.Scheme = Scheme
 CEGUI.Scheme = Scheme


---loadResources
 function CEGUI.Scheme:loadResources() end

---unloadResources
 function CEGUI.Scheme:unloadResources() end

---resourcesLoaded
---@return boolean
 function CEGUI.Scheme:resourcesLoaded() end

---getName
---@return string
 function CEGUI.Scheme:getName() end

---setDefaultResourceGroup
---@param resourceGroup string
 function CEGUI.Scheme:setDefaultResourceGroup(resourceGroup) end

---getDefaultResourceGroup
---@return string
 function CEGUI.Scheme:getDefaultResourceGroup() end


---------------------------------------------------------------------------------
---SchemeManager
---@class CEGUI.SchemeManager
 local SchemeManager = {}
 CEGUI.SchemeManager = SchemeManager
 CEGUI.SchemeManager = SchemeManager


---getSingleton
---@return CEGUI.SchemeManager
 function CEGUI.SchemeManager:getSingleton() end

---createFromFile
---@param xml_filename string
---@param resource_group string
---@param action CEGUI.XMLResourceExistsAction
---@return CEGUI.Scheme
 function CEGUI.SchemeManager:createFromFile(xml_filename, resource_group, action) end

---createFromString
---@param source string
---@param action CEGUI.XMLResourceExistsAction
---@return CEGUI.Scheme
 function CEGUI.SchemeManager:createFromString(source, action) end

---destroy
---@param name string
 function CEGUI.SchemeManager:destroy(name) end

---isDefined
---@param name string
---@return boolean
 function CEGUI.SchemeManager:isDefined(name) end

---get
---@param name string
---@return CEGUI.Scheme
 function CEGUI.SchemeManager:get(name) end

---destroyAll
 function CEGUI.SchemeManager:destroyAll() end

---getIterator
---@return CEGUI.SchemeIterator
 function CEGUI.SchemeManager:getIterator() end


---------------------------------------------------------------------------------
---StringTranscoder
---@class CEGUI.StringTranscoder
 local StringTranscoder = {}
 CEGUI.StringTranscoder = StringTranscoder
 CEGUI.StringTranscoder = StringTranscoder



---------------------------------------------------------------------------------
---PropertyHelper
---@class CEGUI.ceguiLua_PropertyHelper
 local PropertyHelper = {}
 CEGUI.ceguiLua_PropertyHelper = PropertyHelper
 CEGUI.PropertyHelper = PropertyHelper


---stringToFloat
---@param str string
---@return number
 function CEGUI.ceguiLua_PropertyHelper:stringToFloat(str) end

---stringToUint
---@param str string
---@return number
 function CEGUI.ceguiLua_PropertyHelper:stringToUint(str) end

---stringToBool
---@param str string
---@return boolean
 function CEGUI.ceguiLua_PropertyHelper:stringToBool(str) end

---stringToSize
---@param str string
---@return CEGUI.Size_float_
 function CEGUI.ceguiLua_PropertyHelper:stringToSize(str) end

---stringToVector2
---@param str string
---@return CEGUI.Vector2_float_
 function CEGUI.ceguiLua_PropertyHelper:stringToVector2(str) end

---stringToRect
---@param str string
---@return CEGUI.Rect_float_
 function CEGUI.ceguiLua_PropertyHelper:stringToRect(str) end

---stringToImage
---@param str string
---@return CEGUI.Image
 function CEGUI.ceguiLua_PropertyHelper:stringToImage(str) end

---stringToColour
---@param str string
---@return CEGUI.Colour
 function CEGUI.ceguiLua_PropertyHelper:stringToColour(str) end

---stringToColourRect
---@param str string
---@return CEGUI.ColourRect
 function CEGUI.ceguiLua_PropertyHelper:stringToColourRect(str) end

---stringToUDim
---@param str string
---@return CEGUI.UDim
 function CEGUI.ceguiLua_PropertyHelper:stringToUDim(str) end

---stringToUVector2
---@param str string
---@return CEGUI.UVector2
 function CEGUI.ceguiLua_PropertyHelper:stringToUVector2(str) end

---stringToUSize
---@param str string
---@return CEGUI.USize
 function CEGUI.ceguiLua_PropertyHelper:stringToUSize(str) end

---stringToURect
---@param str string
---@return CEGUI.URect
 function CEGUI.ceguiLua_PropertyHelper:stringToURect(str) end

---stringToAspectMode
---@param str string
---@return CEGUI.AspectMode
 function CEGUI.ceguiLua_PropertyHelper:stringToAspectMode(str) end

---floatToString
---@param val number
---@return string
 function CEGUI.ceguiLua_PropertyHelper:floatToString(val) end

---uintToString
---@param val number
---@return string
 function CEGUI.ceguiLua_PropertyHelper:uintToString(val) end

---boolToString
---@param val boolean
---@return string
 function CEGUI.ceguiLua_PropertyHelper:boolToString(val) end

---sizeToString
---@param val CEGUI.Size_float_
---@return string
 function CEGUI.ceguiLua_PropertyHelper:sizeToString(val) end

---vector2ToString
---@param val CEGUI.Vector2_float_
---@return string
 function CEGUI.ceguiLua_PropertyHelper:vector2ToString(val) end

---rectToString
---@param val CEGUI.Rect_float_
---@return string
 function CEGUI.ceguiLua_PropertyHelper:rectToString(val) end

---imageToString
---@param val CEGUI.Image
---@return string
 function CEGUI.ceguiLua_PropertyHelper:imageToString(val) end

---colourToString
---@param val CEGUI.Colour
---@return string
 function CEGUI.ceguiLua_PropertyHelper:colourToString(val) end

---colourRectToString
---@param val CEGUI.ColourRect
---@return string
 function CEGUI.ceguiLua_PropertyHelper:colourRectToString(val) end

---udimToString
---@param val CEGUI.UDim
---@return string
 function CEGUI.ceguiLua_PropertyHelper:udimToString(val) end

---uvector2ToString
---@param val CEGUI.UVector2
---@return string
 function CEGUI.ceguiLua_PropertyHelper:uvector2ToString(val) end

---usizeToString
---@param val CEGUI.USize
---@return string
 function CEGUI.ceguiLua_PropertyHelper:usizeToString(val) end

---urectToString
---@param val CEGUI.URect
---@return string
 function CEGUI.ceguiLua_PropertyHelper:urectToString(val) end

---aspectModeToString
---@param val CEGUI.AspectMode
---@return string
 function CEGUI.ceguiLua_PropertyHelper:aspectModeToString(val) end


---------------------------------------------------------------------------------
---RegexMatchStateEventArgs
---@class CEGUI.RegexMatchStateEventArgs : CEGUI.WindowEventArgs
 local RegexMatchStateEventArgs = {}
 CEGUI.RegexMatchStateEventArgs = RegexMatchStateEventArgs
 CEGUI.RegexMatchStateEventArgs = RegexMatchStateEventArgs


---new
---@param wnd CEGUI.Window
---@param state CEGUI.RegexMatcher.MatchState
---@return CEGUI.RegexMatchStateEventArgs
 function CEGUI.RegexMatchStateEventArgs:new(wnd, state) end

---
-- new_local 
-- @function [parent=#CEGUI.RegexMatchStateEventArgs] new_local
-- @param self
-- @param #CEGUI.Window wnd
-- @param #CEGUI.RegexMatcher.MatchState state
-- @return #CEGUI.RegexMatchStateEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.RegexMatchStateEventArgs
-- @param self
-- @return #CEGUI.RegexMatchStateEventArgs

---
-- @field [parent=#CEGUI.RegexMatchStateEventArgs] #CEGUI.RegexMatcher.MatchState matchState


---------------------------------------------------------------------------------
---RegexMatcher
---@class CEGUI.RegexMatcher
 local RegexMatcher = {}
 CEGUI.RegexMatcher = RegexMatcher
 CEGUI.RegexMatcher = RegexMatcher


 CEGUI.RegexMatcher.MS_VALID = 1
 CEGUI.RegexMatcher.MS_INVALID = 2
 CEGUI.RegexMatcher.MS_PARTIAL = 3
---setRegexString
---@param regex string
 function CEGUI.RegexMatcher:setRegexString(regex) end

---getRegexString
---@return string
 function CEGUI.RegexMatcher:getRegexString() end

---getMatchStateOfString
---@param str string
---@return CEGUI.RegexMatcher.MatchState
 function CEGUI.RegexMatcher:getMatchStateOfString(str) end


---------------------------------------------------------------------------------
---Vertex
---@class CEGUI.Vertex
 local Vertex = {}
 CEGUI.Vertex = Vertex
 CEGUI.Vertex = Vertex


---
-- @field [parent=#CEGUI.Vertex] #CEGUI.Vector3_float_ position

---
-- @field [parent=#CEGUI.Vertex] #CEGUI.Vector2_float_ tex_coords

---
-- @field [parent=#CEGUI.Vertex] #CEGUI.Colour colour_val


---------------------------------------------------------------------------------
---RenderingContext
---@class CEGUI.RenderingContext
 local RenderingContext = {}
 CEGUI.RenderingContext = RenderingContext
 CEGUI.RenderingContext = RenderingContext


---
-- @field [parent=#CEGUI.RenderingContext] #CEGUI.RenderingSurface surface

---
-- @field [parent=#CEGUI.RenderingContext] #CEGUI.Window owner

---
-- @field [parent=#CEGUI.RenderingContext] #CEGUI.Vector2_float_ offset


---------------------------------------------------------------------------------
---RenderEffect
---@class CEGUI.RenderEffect
 local RenderEffect = {}
 CEGUI.RenderEffect = RenderEffect
 CEGUI.RenderEffect = RenderEffect



---------------------------------------------------------------------------------
---GeometryBuffer
---@class CEGUI.GeometryBuffer
 local GeometryBuffer = {}
 CEGUI.GeometryBuffer = GeometryBuffer
 CEGUI.GeometryBuffer = GeometryBuffer


---draw
 function CEGUI.GeometryBuffer:draw() end

---setTranslation
---@param v CEGUI.Vector3_float_
 function CEGUI.GeometryBuffer:setTranslation(v) end

---setRotation
---@param r CEGUI.Quaternion
 function CEGUI.GeometryBuffer:setRotation(r) end

---setPivot
---@param p CEGUI.Vector3_float_
 function CEGUI.GeometryBuffer:setPivot(p) end

---appendVertex
---@param vertex CEGUI.Vertex
 function CEGUI.GeometryBuffer:appendVertex(vertex) end

---appendGeometry
---@param vbuff CEGUI.Vertex
---@param vertex_count number
 function CEGUI.GeometryBuffer:appendGeometry(vbuff, vertex_count) end

---setActiveTexture
---@param texture CEGUI.Texture
 function CEGUI.GeometryBuffer:setActiveTexture(texture) end

---reset
 function CEGUI.GeometryBuffer:reset() end

---getActiveTexture
---@return CEGUI.Texture
 function CEGUI.GeometryBuffer:getActiveTexture() end

---getVertexCount
---@return number
 function CEGUI.GeometryBuffer:getVertexCount() end

---getBatchCount
---@return number
 function CEGUI.GeometryBuffer:getBatchCount() end

---setRenderEffect
---@param effect CEGUI.RenderEffect
 function CEGUI.GeometryBuffer:setRenderEffect(effect) end

---getRenderEffect
---@return CEGUI.RenderEffect
 function CEGUI.GeometryBuffer:getRenderEffect() end


 CEGUI.RQ_USER_0 = 1
 CEGUI.RQ_UNDERLAY = 2
 CEGUI.RQ_USER_1 = 3
 CEGUI.RQ_BASE = 4
 CEGUI.RQ_USER_2 = 5
 CEGUI.RQ_CONTENT_1 = 6
 CEGUI.RQ_USER_3 = 7
 CEGUI.RQ_CONTENT_2 = 8
 CEGUI.RQ_USER_4 = 9
 CEGUI.RQ_OVERLAY = 10
 CEGUI.RQ_USER_5 = 11
---------------------------------------------------------------------------------
---RenderingSurface
---@class CEGUI.RenderingSurface : CEGUI.EventSet
 local RenderingSurface = {}
 CEGUI.RenderingSurface = RenderingSurface
 CEGUI.RenderingSurface = RenderingSurface


---addGeometryBuffer
---@param queue CEGUI.RenderQueueID
---@param buffer CEGUI.GeometryBuffer
 function CEGUI.RenderingSurface:addGeometryBuffer(queue, buffer) end

---removeGeometryBuffer
---@param queue CEGUI.RenderQueueID
---@param buffer CEGUI.GeometryBuffer
 function CEGUI.RenderingSurface:removeGeometryBuffer(queue, buffer) end

---clearGeometry
---@param queue CEGUI.RenderQueueID
 function CEGUI.RenderingSurface:clearGeometry(queue) end

---clearGeometry
 function CEGUI.RenderingSurface:clearGeometry() end

---invalidate
 function CEGUI.RenderingSurface:invalidate() end

---isInvalidated
---@return boolean
 function CEGUI.RenderingSurface:isInvalidated() end

---isRenderingWindow
---@return boolean
 function CEGUI.RenderingSurface:isRenderingWindow() end

---transferRenderingWindow
---@param window CEGUI.RenderingWindow
 function CEGUI.RenderingSurface:transferRenderingWindow(window) end


---------------------------------------------------------------------------------
---RenderTargetEventArgs
---@class CEGUI.RenderTargetEventArgs : CEGUI.EventArgs
 local RenderTargetEventArgs = {}
 CEGUI.RenderTargetEventArgs = RenderTargetEventArgs
 CEGUI.RenderTargetEventArgs = RenderTargetEventArgs


---new
---@param target CEGUI.RenderTarget
---@return CEGUI.RenderTargetEventArgs
 function CEGUI.RenderTargetEventArgs:new(target) end

---
-- new_local 
-- @function [parent=#CEGUI.RenderTargetEventArgs] new_local
-- @param self
-- @param #CEGUI.RenderTarget target
-- @return #CEGUI.RenderTargetEventArgs

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.RenderTargetEventArgs
-- @param self
-- @return #CEGUI.RenderTargetEventArgs

---
-- @field [parent=#CEGUI.RenderTargetEventArgs] #CEGUI.RenderTarget target


---------------------------------------------------------------------------------
---RenderTarget
---@class CEGUI.RenderTarget
 local RenderTarget = {}
 CEGUI.RenderTarget = RenderTarget
 CEGUI.RenderTarget = RenderTarget


---draw
---@param buffer CEGUI.GeometryBuffer
 function CEGUI.RenderTarget:draw(buffer) end

---draw
---@param queue CEGUI.RenderQueue
 function CEGUI.RenderTarget:draw(queue) end

---setArea
---@param area CEGUI.Rect_float_
 function CEGUI.RenderTarget:setArea(area) end

---getArea
---@return CEGUI.Rect_float_
 function CEGUI.RenderTarget:getArea() end

---isImageryCache
---@return boolean
 function CEGUI.RenderTarget:isImageryCache() end

---activate
 function CEGUI.RenderTarget:activate() end

---deactivate
 function CEGUI.RenderTarget:deactivate() end

---unprojectPoint
---@param buff CEGUI.GeometryBuffer
---@param p_in CEGUI.Vector2_float_
---@param p_out CEGUI.Vector2_float_
 function CEGUI.RenderTarget:unprojectPoint(buff, p_in, p_out) end

---addEvent
---@param name string
 function CEGUI.RenderTarget:addEvent(name) end

---removeEvent
---@param name string
 function CEGUI.RenderTarget:removeEvent(name) end

---removeAllEvents
 function CEGUI.RenderTarget:removeAllEvents() end

---isEventPresent
---@param name string
---@return boolean
 function CEGUI.RenderTarget:isEventPresent(name) end

---subscribeEvent
---@param name string
---@param funcIndex lua_Object
---@param selfIndex lua_Object
---@param error_handler lua_Object
---@param tolua_var_3 lua_State
---@return CEGUI.EventConnection
 function CEGUI.RenderTarget:subscribeEvent(name, funcIndex, selfIndex, error_handler, tolua_var_3) end

---subscribeEvent
---@param name string
---@param callback_name string
---@return CEGUI.EventConnection
 function CEGUI.RenderTarget:subscribeEvent(name, callback_name) end

---fireEvent
---@param name string
---@param args CEGUI.EventArgs
---@param eventnamespace string
 function CEGUI.RenderTarget:fireEvent(name, args, eventnamespace) end

---isMuted
---@return boolean
 function CEGUI.RenderTarget:isMuted() end

---setMutedState
---@param setting boolean
 function CEGUI.RenderTarget:setMutedState(setting) end

---getEventIterator
---@return CEGUI.EventIterator
 function CEGUI.RenderTarget:getEventIterator() end


---------------------------------------------------------------------------------
---RenderingWindow
---@class CEGUI.RenderingWindow : CEGUI.RenderingSurface
 local RenderingWindow = {}
 CEGUI.RenderingWindow = RenderingWindow
 CEGUI.RenderingWindow = RenderingWindow


---setClippingRegion
---@param region CEGUI.Rect_float_
 function CEGUI.RenderingWindow:setClippingRegion(region) end

---setPosition
---@param position CEGUI.Vector2_float_
 function CEGUI.RenderingWindow:setPosition(position) end

---setSize
---@param size CEGUI.Size_float_
 function CEGUI.RenderingWindow:setSize(size) end

---setRotation
---@param rotation CEGUI.Quaternion
 function CEGUI.RenderingWindow:setRotation(rotation) end

---setPivot
---@param pivot CEGUI.Vector3_float_
 function CEGUI.RenderingWindow:setPivot(pivot) end

---getPosition
---@return CEGUI.Vector2_float_
 function CEGUI.RenderingWindow:getPosition() end

---getSize
---@return CEGUI.Size_float_
 function CEGUI.RenderingWindow:getSize() end

---getRotation
---@return CEGUI.Quaternion
 function CEGUI.RenderingWindow:getRotation() end

---getPivot
---@return CEGUI.Vector3_float_
 function CEGUI.RenderingWindow:getPivot() end

---setRenderEffect
---@param effect CEGUI.RenderEffect
 function CEGUI.RenderingWindow:setRenderEffect(effect) end

---getRenderEffect
---@return CEGUI.RenderEffect
 function CEGUI.RenderingWindow:getRenderEffect() end

---getOwner
---@return CEGUI.RenderingSurface
 function CEGUI.RenderingWindow:getOwner() end

---getOwner
---@return CEGUI.RenderingSurface
 function CEGUI.RenderingWindow:getOwner() end

---unprojectPoint
---@param p_in CEGUI.Vector2_float_
---@param p_out CEGUI.Vector2_float_
 function CEGUI.RenderingWindow:unprojectPoint(p_in, p_out) end


---------------------------------------------------------------------------------
---RenderQueue
---@class CEGUI.RenderQueue
 local RenderQueue = {}
 CEGUI.RenderQueue = RenderQueue
 CEGUI.RenderQueue = RenderQueue


---addGeometryBuffer
---@param buffer CEGUI.GeometryBuffer
 function CEGUI.RenderQueue:addGeometryBuffer(buffer) end

---removeGeometryBuffer
---@param buffer CEGUI.GeometryBuffer
 function CEGUI.RenderQueue:removeGeometryBuffer(buffer) end

---draw
 function CEGUI.RenderQueue:draw() end

---reset
 function CEGUI.RenderQueue:reset() end


---------------------------------------------------------------------------------
---Renderer
---@class CEGUI.Renderer
 local Renderer = {}
 CEGUI.Renderer = Renderer
 CEGUI.Renderer = Renderer


---getDefaultRenderTarget
---@return CEGUI.RenderTarget
 function CEGUI.Renderer:getDefaultRenderTarget() end

---createGeometryBuffer
---@return CEGUI.GeometryBuffer
 function CEGUI.Renderer:createGeometryBuffer() end

---destroyGeometryBuffer
---@param buffer CEGUI.GeometryBuffer
 function CEGUI.Renderer:destroyGeometryBuffer(buffer) end

---destroyAllGeometryBuffers
 function CEGUI.Renderer:destroyAllGeometryBuffers() end

---createTextureTarget
---@return CEGUI.TextureTarget
 function CEGUI.Renderer:createTextureTarget() end

---destroyTextureTarget
---@param target CEGUI.TextureTarget
 function CEGUI.Renderer:destroyTextureTarget(target) end

---destroyAllTextureTargets
 function CEGUI.Renderer:destroyAllTextureTargets() end

---createTexture
---@param name string
---@return CEGUI.Texture
 function CEGUI.Renderer:createTexture(name) end

---createTexture
---@param name string
---@param filename string
---@param resourceGroup string
---@return CEGUI.Texture
 function CEGUI.Renderer:createTexture(name, filename, resourceGroup) end

---createTexture
---@param name string
---@param size CEGUI.Size_float_
---@return CEGUI.Texture
 function CEGUI.Renderer:createTexture(name, size) end

---destroyTexture
---@param texture CEGUI.Texture
 function CEGUI.Renderer:destroyTexture(texture) end

---destroyTexture
---@param name string
 function CEGUI.Renderer:destroyTexture(name) end

---destroyAllTextures
 function CEGUI.Renderer:destroyAllTextures() end

---setDisplaySize
---@param sz CEGUI.Size_float_
 function CEGUI.Renderer:setDisplaySize(sz) end

---getDisplaySize
---@return CEGUI.Size_float_
 function CEGUI.Renderer:getDisplaySize() end

---getDisplayDPI
---@return CEGUI.Vector2_float_
 function CEGUI.Renderer:getDisplayDPI() end

---getMaxTextureSize
---@return number
 function CEGUI.Renderer:getMaxTextureSize() end

---getIdentifierString
---@return string
 function CEGUI.Renderer:getIdentifierString() end

---getTexture
---@param name string
---@return CEGUI.Texture
 function CEGUI.Renderer:getTexture(name) end

---isTextureDefined
---@param name string
---@return boolean
 function CEGUI.Renderer:isTextureDefined(name) end


---------------------------------------------------------------------------------
---Texture
---@class CEGUI.Texture
 local Texture = {}
 CEGUI.Texture = Texture
 CEGUI.Texture = Texture


 CEGUI.Texture.PF_RGB = 1
 CEGUI.Texture.PF_RGBA = 2
 CEGUI.Texture.PF_RGBA_4444 = 3
 CEGUI.Texture.PF_RGB_565 = 4
 CEGUI.Texture.PF_PVRTC2 = 5
 CEGUI.Texture.PF_PVRTC4 = 6
 CEGUI.Texture.PF_RGB_DXT1 = 7
 CEGUI.Texture.PF_RGBA_DXT1 = 8
 CEGUI.Texture.PF_RGBA_DXT3 = 9
 CEGUI.Texture.PF_RGBA_DXT5 = 10
---getSize
---@return CEGUI.Size_float_
 function CEGUI.Texture:getSize() end

---getOriginalDataSize
---@return CEGUI.Size_float_
 function CEGUI.Texture:getOriginalDataSize() end

---getTexelScaling
---@return CEGUI.Vector2_float_
 function CEGUI.Texture:getTexelScaling() end

---loadFromFile
---@param filename string
---@param resourceGroup string
 function CEGUI.Texture:loadFromFile(filename, resourceGroup) end

---isPixelFormatSupported
---@param fmt CEGUI.Texture.PixelFormat
---@return boolean
 function CEGUI.Texture:isPixelFormatSupported(fmt) end


---------------------------------------------------------------------------------
---TextureTarget
---@class CEGUI.TextureTarget : CEGUI.RenderTarget
 local TextureTarget = {}
 CEGUI.TextureTarget = TextureTarget
 CEGUI.TextureTarget = TextureTarget


---clear
 function CEGUI.TextureTarget:clear() end

---getTexture
---@return CEGUI.Texture
 function CEGUI.TextureTarget:getTexture() end

---declareRenderSize
---@param sz CEGUI.Size_float_
 function CEGUI.TextureTarget:declareRenderSize(sz) end

---isRenderingInverted
---@return boolean
 function CEGUI.TextureTarget:isRenderingInverted() end


---------------------------------------------------------------------------------
---KeyFrame
---@class CEGUI.KeyFrame
 local KeyFrame = {}
 CEGUI.KeyFrame = KeyFrame
 CEGUI.KeyFrame = KeyFrame


 CEGUI.KeyFrame.P_Linear = 1
 CEGUI.KeyFrame.P_QuadraticAccelerating = 2
 CEGUI.KeyFrame.P_QuadraticDecelerating = 3
 CEGUI.KeyFrame.P_Discrete = 4
---getParent
---@return CEGUI.Affector
 function CEGUI.KeyFrame:getParent() end

---getPosition
---@return number
 function CEGUI.KeyFrame:getPosition() end

---setValue
---@param value string
 function CEGUI.KeyFrame:setValue(value) end

---getValue
---@return string
 function CEGUI.KeyFrame:getValue() end

---setProgression
---@param p CEGUI.KeyFrame.Progression
 function CEGUI.KeyFrame:setProgression(p) end

---getProgression
---@return CEGUI.KeyFrame.Progression
 function CEGUI.KeyFrame:getProgression() end

---alterInterpolationPosition
---@param position number
---@return number
 function CEGUI.KeyFrame:alterInterpolationPosition(position) end


---------------------------------------------------------------------------------
---Affector
---@class CEGUI.Affector
 local Affector = {}
 CEGUI.Affector = Affector
 CEGUI.Affector = Affector


 CEGUI.Affector.AM_Absolute = 1
 CEGUI.Affector.AM_Relative = 2
---setApplicationMethod
---@param method CEGUI.Affector.ApplicationMethod
 function CEGUI.Affector:setApplicationMethod(method) end

---getApplicationMethod
---@return CEGUI.Affector.ApplicationMethod
 function CEGUI.Affector:getApplicationMethod() end

---setTargetProperty
---@param target string
 function CEGUI.Affector:setTargetProperty(target) end

---getTargetProperty
---@return string
 function CEGUI.Affector:getTargetProperty() end

---setInterpolator
---@param interpolator CEGUI.Interpolator
 function CEGUI.Affector:setInterpolator(interpolator) end

---setInterpolator
---@param name string
 function CEGUI.Affector:setInterpolator(name) end

---getInterpolator
---@return CEGUI.Interpolator
 function CEGUI.Affector:getInterpolator() end

---createKeyFrame
---@param position number
---@return CEGUI.KeyFrame
 function CEGUI.Affector:createKeyFrame(position) end

---createKeyFrame
---@param position number
---@param value string
---@param progression CEGUI.KeyFrame.Progression
---@return CEGUI.KeyFrame
 function CEGUI.Affector:createKeyFrame(position, value, progression) end

---destroyKeyFrame
---@param keyframe CEGUI.KeyFrame
 function CEGUI.Affector:destroyKeyFrame(keyframe) end

---getKeyFrameAtPosition
---@param position number
---@return CEGUI.KeyFrame
 function CEGUI.Affector:getKeyFrameAtPosition(position) end

---getKeyFrameAtIdx
---@param index number
---@return CEGUI.KeyFrame
 function CEGUI.Affector:getKeyFrameAtIdx(index) end

---getNumKeyFrames
---@return number
 function CEGUI.Affector:getNumKeyFrames() end


---------------------------------------------------------------------------------
---AnimationEventArgs
---@class CEGUI.AnimationEventArgs : CEGUI.EventArgs
 local AnimationEventArgs = {}
 CEGUI.AnimationEventArgs = AnimationEventArgs
 CEGUI.AnimationEventArgs = AnimationEventArgs


---
-- @field [parent=#CEGUI.AnimationEventArgs] #CEGUI.AnimationInstance instance


---------------------------------------------------------------------------------
---AnimationInstance
---@class CEGUI.AnimationInstance
 local AnimationInstance = {}
 CEGUI.AnimationInstance = AnimationInstance
 CEGUI.AnimationInstance = AnimationInstance


---getDefinition
---@return CEGUI.Animation
 function CEGUI.AnimationInstance:getDefinition() end

---setEventReceiver
---@param receiver CEGUI.EventSet
 function CEGUI.AnimationInstance:setEventReceiver(receiver) end

---getEventReceiver
---@return CEGUI.EventSet
 function CEGUI.AnimationInstance:getEventReceiver() end

---setEventSender
---@param sender CEGUI.EventSet
 function CEGUI.AnimationInstance:setEventSender(sender) end

---getEventSender
---@return CEGUI.EventSet
 function CEGUI.AnimationInstance:getEventSender() end

---setTargetWindow
---@param target CEGUI.Window
 function CEGUI.AnimationInstance:setTargetWindow(target) end

---setPosition
---@param position number
 function CEGUI.AnimationInstance:setPosition(position) end

---getPosition
---@return number
 function CEGUI.AnimationInstance:getPosition() end

---setSpeed
---@param speed number
 function CEGUI.AnimationInstance:setSpeed(speed) end

---getSpeed
---@return number
 function CEGUI.AnimationInstance:getSpeed() end

---start
---@param skipNextStep boolean
 function CEGUI.AnimationInstance:start(skipNextStep) end

---stop
 function CEGUI.AnimationInstance:stop() end

---pause
 function CEGUI.AnimationInstance:pause() end

---unpause
---@param skipNextStep boolean
 function CEGUI.AnimationInstance:unpause(skipNextStep) end

---togglePause
---@param skipNextStep boolean
 function CEGUI.AnimationInstance:togglePause(skipNextStep) end

---isRunning
---@return boolean
 function CEGUI.AnimationInstance:isRunning() end

---step
---@param delta number
 function CEGUI.AnimationInstance:step(delta) end


---------------------------------------------------------------------------------
---Animation
---@class CEGUI.Animation
 local Animation = {}
 CEGUI.Animation = Animation
 CEGUI.Animation = Animation


 CEGUI.Animation.RM_Once = 1
 CEGUI.Animation.RM_Loop = 2
 CEGUI.Animation.RM_Bounce = 3
---getName
---@return string
 function CEGUI.Animation:getName() end

---setReplayMode
---@param mode CEGUI.Animation.ReplayMode
 function CEGUI.Animation:setReplayMode(mode) end

---getReplayMode
---@return CEGUI.Animation.ReplayMode
 function CEGUI.Animation:getReplayMode() end

---setDuration
---@param duration number
 function CEGUI.Animation:setDuration(duration) end

---getDuration
---@return number
 function CEGUI.Animation:getDuration() end

---setAutoStart
---@param autoStart boolean
 function CEGUI.Animation:setAutoStart(autoStart) end

---getAutoStart
---@return boolean
 function CEGUI.Animation:getAutoStart() end

---createAffector
---@return CEGUI.Affector
 function CEGUI.Animation:createAffector() end

---createAffector
---@param targetProperty string
---@param interpolator string
---@return CEGUI.Affector
 function CEGUI.Animation:createAffector(targetProperty, interpolator) end

---destroyAffector
---@param affector CEGUI.Affector
 function CEGUI.Animation:destroyAffector(affector) end

---getAffectorAtIdx
---@param index number
---@return CEGUI.Affector
 function CEGUI.Animation:getAffectorAtIdx(index) end

---getNumAffectors
---@return number
 function CEGUI.Animation:getNumAffectors() end

---defineAutoSubscription
---@param eventName string
---@param action string
 function CEGUI.Animation:defineAutoSubscription(eventName, action) end

---undefineAutoSubscription
---@param eventName string
---@param action string
 function CEGUI.Animation:undefineAutoSubscription(eventName, action) end

---undefineAllAutoSubscriptions
 function CEGUI.Animation:undefineAllAutoSubscriptions() end

---autoSubscribe
---@param instance CEGUI.AnimationInstance
 function CEGUI.Animation:autoSubscribe(instance) end

---autoUnsubscribe
---@param instance CEGUI.AnimationInstance
 function CEGUI.Animation:autoUnsubscribe(instance) end


---------------------------------------------------------------------------------
---AnimationManager
---@class CEGUI.AnimationManager
 local AnimationManager = {}
 CEGUI.AnimationManager = AnimationManager
 CEGUI.AnimationManager = AnimationManager


---getSingleton
---@return CEGUI.AnimationManager
 function CEGUI.AnimationManager:getSingleton() end

---addInterpolator
---@param interpolator CEGUI.Interpolator
 function CEGUI.AnimationManager:addInterpolator(interpolator) end

---removeInterpolator
---@param interpolator CEGUI.Interpolator
 function CEGUI.AnimationManager:removeInterpolator(interpolator) end

---getInterpolator
---@param name string
---@return CEGUI.Interpolator
 function CEGUI.AnimationManager:getInterpolator(name) end

---createAnimation
---@param name string
---@return CEGUI.Animation
 function CEGUI.AnimationManager:createAnimation(name) end

---destroyAnimation
---@param animation CEGUI.Animation
 function CEGUI.AnimationManager:destroyAnimation(animation) end

---destroyAnimation
---@param name string
 function CEGUI.AnimationManager:destroyAnimation(name) end

---getAnimation
---@param name string
---@return CEGUI.Animation
 function CEGUI.AnimationManager:getAnimation(name) end

---getAnimationAtIdx
---@param index number
---@return CEGUI.Animation
 function CEGUI.AnimationManager:getAnimationAtIdx(index) end

---getNumAnimations
---@return number
 function CEGUI.AnimationManager:getNumAnimations() end

---instantiateAnimation
---@param animation CEGUI.Animation
---@return CEGUI.AnimationInstance
 function CEGUI.AnimationManager:instantiateAnimation(animation) end

---instantiateAnimation
---@param name string
---@return CEGUI.AnimationInstance
 function CEGUI.AnimationManager:instantiateAnimation(name) end

---destroyAnimationInstance
---@param instance CEGUI.AnimationInstance
 function CEGUI.AnimationManager:destroyAnimationInstance(instance) end

---destroyAllInstancesOfAnimation
---@param animation CEGUI.Animation
 function CEGUI.AnimationManager:destroyAllInstancesOfAnimation(animation) end

---getAnimationInstanceAtIdx
---@param index number
---@return CEGUI.AnimationInstance
 function CEGUI.AnimationManager:getAnimationInstanceAtIdx(index) end

---getNumAnimationInstances
---@return number
 function CEGUI.AnimationManager:getNumAnimationInstances() end

---autoStepInstances
---@param delta number
 function CEGUI.AnimationManager:autoStepInstances(delta) end

---loadAnimationsFromXML
---@param filename string
---@param resourceGroup string
 function CEGUI.AnimationManager:loadAnimationsFromXML(filename, resourceGroup) end

---loadAnimationsFromString
---@param source string
 function CEGUI.AnimationManager:loadAnimationsFromString(source) end

---getAnimationDefinitionAsString
---@param animation CEGUI.Animation
---@return string
 function CEGUI.AnimationManager:getAnimationDefinitionAsString(animation) end

---setDefaultResourceGroup
---@param resourceGroup string
 function CEGUI.AnimationManager:setDefaultResourceGroup(resourceGroup) end

---getDefaultResourceGroup
---@return string
 function CEGUI.AnimationManager:getDefaultResourceGroup() end


---------------------------------------------------------------------------------
---Interpolator
---@class CEGUI.Interpolator
 local Interpolator = {}
 CEGUI.Interpolator = Interpolator
 CEGUI.Interpolator = Interpolator


---getType
---@return string
 function CEGUI.Interpolator:getType() end

---interpolateAbsolute
---@param value1 string
---@param value2 string
---@param position number
---@return string
 function CEGUI.Interpolator:interpolateAbsolute(value1, value2, position) end

---interpolateRelative
---@param base string
---@param value1 string
---@param value2 string
---@param position number
---@return string
 function CEGUI.Interpolator:interpolateRelative(base, value1, value2, position) end


---------------------------------------------------------------------------------
---GUISheet
---@class CEGUI.GUISheet : CEGUI.Window
 local GUISheet = {}
 CEGUI.GUISheet = GUISheet
 CEGUI.GUISheet = GUISheet



---------------------------------------------------------------------------------
---Tree
---@class CEGUI.Tree : CEGUI.Window
 local Tree = {}
 CEGUI.Tree = Tree
 CEGUI.Tree = Tree


---getItemCount
---@return number
 function CEGUI.Tree:getItemCount() end

---getSelectedCount
---@return number
 function CEGUI.Tree:getSelectedCount() end

---getFirstSelectedItem
---@return CEGUI.TreeItem
 function CEGUI.Tree:getFirstSelectedItem() end

---getLastSelectedItem
---@return CEGUI.TreeItem
 function CEGUI.Tree:getLastSelectedItem() end

---isSortEnabled
---@return boolean
 function CEGUI.Tree:isSortEnabled() end

---isMultiselectEnabled
---@return boolean
 function CEGUI.Tree:isMultiselectEnabled() end

---isItemTooltipsEnabled
---@return boolean
 function CEGUI.Tree:isItemTooltipsEnabled() end

---findFirstItemWithText
---@param text string
---@return CEGUI.TreeItem
 function CEGUI.Tree:findFirstItemWithText(text) end

---findNextItemWithText
---@param text string
---@param start_item CEGUI.TreeItem
---@return CEGUI.TreeItem
 function CEGUI.Tree:findNextItemWithText(text, start_item) end

---findFirstItemWithID
---@param searchID number
---@return CEGUI.TreeItem
 function CEGUI.Tree:findFirstItemWithID(searchID) end

---findNextItemWithID
---@param searchID number
---@param start_item CEGUI.TreeItem
---@return CEGUI.TreeItem
 function CEGUI.Tree:findNextItemWithID(searchID, start_item) end

---isTreeItemInList
---@param item CEGUI.TreeItem
---@return boolean
 function CEGUI.Tree:isTreeItemInList(item) end

---resetList
 function CEGUI.Tree:resetList() end

---addItem
---@param item CEGUI.TreeItem
 function CEGUI.Tree:addItem(item) end

---insertItem
---@param item CEGUI.TreeItem
---@param position CEGUI.TreeItem
 function CEGUI.Tree:insertItem(item, position) end

---removeItem
---@param item CEGUI.TreeItem
 function CEGUI.Tree:removeItem(item) end

---clearAllSelections
 function CEGUI.Tree:clearAllSelections() end

---setSortingEnabled
---@param setting boolean
 function CEGUI.Tree:setSortingEnabled(setting) end

---setMultiselectEnabled
---@param setting boolean
 function CEGUI.Tree:setMultiselectEnabled(setting) end

---setItemSelectState
---@param item CEGUI.TreeItem
---@param state boolean
 function CEGUI.Tree:setItemSelectState(item, state) end

---setItemSelectState
---@param item_index number
---@param state boolean
 function CEGUI.Tree:setItemSelectState(item_index, state) end

---ensureItemIsVisible
---@param item CEGUI.TreeItem
 function CEGUI.Tree:ensureItemIsVisible(item) end


---------------------------------------------------------------------------------
---ButtonBase
---@class CEGUI.ButtonBase : CEGUI.Window
 local ButtonBase = {}
 CEGUI.ButtonBase = ButtonBase
 CEGUI.ButtonBase = ButtonBase


---isHovering
---@return boolean
 function CEGUI.ButtonBase:isHovering() end

---isPushed
---@return boolean
 function CEGUI.ButtonBase:isPushed() end


---------------------------------------------------------------------------------
---ToggleButton
---@class CEGUI.ToggleButton : CEGUI.ButtonBase
 local ToggleButton = {}
 CEGUI.ToggleButton = ToggleButton
 CEGUI.ToggleButton = ToggleButton


---isSelected
---@return boolean
 function CEGUI.ToggleButton:isSelected() end

---setSelected
---@param select boolean
 function CEGUI.ToggleButton:setSelected(select) end


---------------------------------------------------------------------------------
---PushButton
---@class CEGUI.PushButton : CEGUI.ButtonBase
 local PushButton = {}
 CEGUI.PushButton = PushButton
 CEGUI.PushButton = PushButton



---------------------------------------------------------------------------------
---Thumb
---@class CEGUI.Thumb : CEGUI.PushButton
 local Thumb = {}
 CEGUI.Thumb = Thumb
 CEGUI.Thumb = Thumb


---isHotTracked
---@return boolean
 function CEGUI.Thumb:isHotTracked() end

---isVertFree
---@return boolean
 function CEGUI.Thumb:isVertFree() end

---isHorzFree
---@return boolean
 function CEGUI.Thumb:isHorzFree() end

---setHotTracked
---@param setting boolean
 function CEGUI.Thumb:setHotTracked(setting) end

---setVertFree
---@param setting boolean
 function CEGUI.Thumb:setVertFree(setting) end

---setHorzFree
---@param setting boolean
 function CEGUI.Thumb:setHorzFree(setting) end

---getVertRange
---@param min number
---@param max number
 function CEGUI.Thumb:getVertRange(min, max) end

---getHorzRange
---@param min number
---@param max number
 function CEGUI.Thumb:getHorzRange(min, max) end

---setVertRange
---@param min number
---@param max number
 function CEGUI.Thumb:setVertRange(min, max) end

---setHorzRange
---@param min number
---@param max number
 function CEGUI.Thumb:setHorzRange(min, max) end


---------------------------------------------------------------------------------
---RadioButton
---@class CEGUI.RadioButton : CEGUI.ToggleButton
 local RadioButton = {}
 CEGUI.RadioButton = RadioButton
 CEGUI.RadioButton = RadioButton


---getGroupID
---@return number
 function CEGUI.RadioButton:getGroupID() end

---setGroupID
---@param group number
 function CEGUI.RadioButton:setGroupID(group) end

---getSelectedButtonInGroup
---@return CEGUI.RadioButton
 function CEGUI.RadioButton:getSelectedButtonInGroup() end


---------------------------------------------------------------------------------
---TabButton
---@class CEGUI.TabButton : CEGUI.ButtonBase
 local TabButton = {}
 CEGUI.TabButton = TabButton
 CEGUI.TabButton = TabButton


---isSelected
---@return boolean
 function CEGUI.TabButton:isSelected() end

---setSelected
---@param select boolean
 function CEGUI.TabButton:setSelected(select) end

---setTargetWindow
---@param wnd CEGUI.Window
 function CEGUI.TabButton:setTargetWindow(wnd) end

---getTargetWindow
---@return CEGUI.Window
 function CEGUI.TabButton:getTargetWindow() end


---------------------------------------------------------------------------------
---TabControl
---@class CEGUI.TabControl : CEGUI.Window
 local TabControl = {}
 CEGUI.TabControl = TabControl
 CEGUI.TabControl = TabControl


---getTabCount
---@return number
 function CEGUI.TabControl:getTabCount() end

---setSelectedTab
---@param name string
 function CEGUI.TabControl:setSelectedTab(name) end

---setSelectedTab
---@param ID number
 function CEGUI.TabControl:setSelectedTab(ID) end

---setSelectedTabAtIndex
---@param index number
 function CEGUI.TabControl:setSelectedTabAtIndex(index) end

---getTabContentsAtIndex
---@param index number
---@return CEGUI.Window
 function CEGUI.TabControl:getTabContentsAtIndex(index) end

---getTabContents
---@param name string
---@return CEGUI.Window
 function CEGUI.TabControl:getTabContents(name) end

---getTabContents
---@param ID number
---@return CEGUI.Window
 function CEGUI.TabControl:getTabContents(ID) end

---isTabContentsSelected
---@param wnd CEGUI.Window
---@return boolean
 function CEGUI.TabControl:isTabContentsSelected(wnd) end

---getSelectedTabIndex
---@return number
 function CEGUI.TabControl:getSelectedTabIndex() end

---getTabHeight
---@return CEGUI.UDim
 function CEGUI.TabControl:getTabHeight() end

---getTabTextPadding
---@return CEGUI.UDim
 function CEGUI.TabControl:getTabTextPadding() end

---setTabHeight
---@param height CEGUI.UDim
 function CEGUI.TabControl:setTabHeight(height) end

---setTabTextPadding
---@param pad CEGUI.UDim
 function CEGUI.TabControl:setTabTextPadding(pad) end

---addTab
---@param wnd CEGUI.Window
 function CEGUI.TabControl:addTab(wnd) end

---removeTab
---@param ID number
 function CEGUI.TabControl:removeTab(ID) end

---removeTab
---@param name string
 function CEGUI.TabControl:removeTab(name) end


---------------------------------------------------------------------------------
---Titlebar
---@class CEGUI.Titlebar : CEGUI.Window
 local Titlebar = {}
 CEGUI.Titlebar = Titlebar
 CEGUI.Titlebar = Titlebar


---isDraggingEnabled
---@return boolean
 function CEGUI.Titlebar:isDraggingEnabled() end

---setDraggingEnabled
---@param setting boolean
 function CEGUI.Titlebar:setDraggingEnabled(setting) end


---------------------------------------------------------------------------------
---TreeItem
---@class CEGUI.TreeItem
 local TreeItem = {}
 CEGUI.TreeItem = TreeItem
 CEGUI.TreeItem = TreeItem


---getFont
---@return CEGUI.Font
 function CEGUI.TreeItem:getFont() end

---getTextColours
---@return CEGUI.ColourRect
 function CEGUI.TreeItem:getTextColours() end

---setFont
---@param font CEGUI.Font
 function CEGUI.TreeItem:setFont(font) end

---setFont
---@param font_name string
 function CEGUI.TreeItem:setFont(font_name) end

---setTextColours
---@param cols CEGUI.ColourRect
 function CEGUI.TreeItem:setTextColours(cols) end

---setTextColours
---@param top_left_colour CEGUI.Colour
---@param top_right_colour CEGUI.Colour
---@param bottom_left_colour CEGUI.Colour
---@param bottom_right_colour CEGUI.Colour
 function CEGUI.TreeItem:setTextColours(top_left_colour, top_right_colour, bottom_left_colour, bottom_right_colour) end

---setTextColours
---@param col CEGUI.Colour
 function CEGUI.TreeItem:setTextColours(col) end

---getText
---@return string
 function CEGUI.TreeItem:getText() end

---getTooltipText
---@return string
 function CEGUI.TreeItem:getTooltipText() end

---getID
---@return number
 function CEGUI.TreeItem:getID() end

---getUserData
 function CEGUI.TreeItem:getUserData() end

---isSelected
---@return boolean
 function CEGUI.TreeItem:isSelected() end

---isDisabled
---@return boolean
 function CEGUI.TreeItem:isDisabled() end

---isAutoDeleted
---@return boolean
 function CEGUI.TreeItem:isAutoDeleted() end

---getOwnerWindow
---@return CEGUI.Window
 function CEGUI.TreeItem:getOwnerWindow() end

---getSelectionColours
---@return CEGUI.ColourRect
 function CEGUI.TreeItem:getSelectionColours() end

---getSelectionBrushImage
---@return CEGUI.Image
 function CEGUI.TreeItem:getSelectionBrushImage() end

---setText
---@param text string
 function CEGUI.TreeItem:setText(text) end

---setTooltipText
---@param text string
 function CEGUI.TreeItem:setTooltipText(text) end

---setID
---@param item_id number
 function CEGUI.TreeItem:setID(item_id) end

---setUserData
 function CEGUI.TreeItem:setUserData() end

---setSelected
---@param setting boolean
 function CEGUI.TreeItem:setSelected(setting) end

---setDisabled
---@param setting boolean
 function CEGUI.TreeItem:setDisabled(setting) end

---setAutoDeleted
---@param setting boolean
 function CEGUI.TreeItem:setAutoDeleted(setting) end

---setOwnerWindow
---@param owner CEGUI.Window
 function CEGUI.TreeItem:setOwnerWindow(owner) end

---setSelectionColours
---@param cols CEGUI.ColourRect
 function CEGUI.TreeItem:setSelectionColours(cols) end

---setSelectionColours
---@param top_left_colour CEGUI.Colour
---@param top_right_colour CEGUI.Colour
---@param bottom_left_colour CEGUI.Colour
---@param bottom_right_colour CEGUI.Colour
 function CEGUI.TreeItem:setSelectionColours(top_left_colour, top_right_colour, bottom_left_colour, bottom_right_colour) end

---setSelectionColours
---@param col CEGUI.Colour
 function CEGUI.TreeItem:setSelectionColours(col) end

---setSelectionBrushImage
---@param image CEGUI.Image
 function CEGUI.TreeItem:setSelectionBrushImage(image) end

---setSelectionBrushImage
---@param name string
 function CEGUI.TreeItem:setSelectionBrushImage(name) end

---setButtonLocation
---@param buttonOffset CEGUI.Rect_float_
 function CEGUI.TreeItem:setButtonLocation(buttonOffset) end

---getButtonLocation
---@return CEGUI.Rect_float_
 function CEGUI.TreeItem:getButtonLocation() end

---getIsOpen
---@return boolean
 function CEGUI.TreeItem:getIsOpen() end

---toggleIsOpen
 function CEGUI.TreeItem:toggleIsOpen() end

---getTreeItemFromIndex
---@param itemIndex number
---@return CEGUI.TreeItem
 function CEGUI.TreeItem:getTreeItemFromIndex(itemIndex) end

---getItemCount
---@return number
 function CEGUI.TreeItem:getItemCount() end

---addItem
---@param item CEGUI.TreeItem
 function CEGUI.TreeItem:addItem(item) end

---removeItem
---@param item CEGUI.TreeItem
 function CEGUI.TreeItem:removeItem(item) end

---setIcon
---@param theIcon CEGUI.Image
 function CEGUI.TreeItem:setIcon(theIcon) end


---------------------------------------------------------------------------------
---FrameWindow
---@class CEGUI.FrameWindow : CEGUI.Window
 local FrameWindow = {}
 CEGUI.FrameWindow = FrameWindow
 CEGUI.FrameWindow = FrameWindow


---isSizingEnabled
---@return boolean
 function CEGUI.FrameWindow:isSizingEnabled() end

---isFrameEnabled
---@return boolean
 function CEGUI.FrameWindow:isFrameEnabled() end

---isTitleBarEnabled
---@return boolean
 function CEGUI.FrameWindow:isTitleBarEnabled() end

---isCloseButtonEnabled
---@return boolean
 function CEGUI.FrameWindow:isCloseButtonEnabled() end

---isRollupEnabled
---@return boolean
 function CEGUI.FrameWindow:isRollupEnabled() end

---isRolledup
---@return boolean
 function CEGUI.FrameWindow:isRolledup() end

---isDragMovingEnabled
---@return boolean
 function CEGUI.FrameWindow:isDragMovingEnabled() end

---setSizingEnabled
---@param enabled boolean
 function CEGUI.FrameWindow:setSizingEnabled(enabled) end

---setFrameEnabled
---@param enabled boolean
 function CEGUI.FrameWindow:setFrameEnabled(enabled) end

---setTitleBarEnabled
---@param enabled boolean
 function CEGUI.FrameWindow:setTitleBarEnabled(enabled) end

---setCloseButtonEnabled
---@param enabled boolean
 function CEGUI.FrameWindow:setCloseButtonEnabled(enabled) end

---setRollupEnabled
---@param enabled boolean
 function CEGUI.FrameWindow:setRollupEnabled(enabled) end

---setDragMovingEnabled
---@param enabled boolean
 function CEGUI.FrameWindow:setDragMovingEnabled(enabled) end

---getSizingBorderThickness
---@return number
 function CEGUI.FrameWindow:getSizingBorderThickness() end

---setSizingBorderThickness
---@param pixels number
 function CEGUI.FrameWindow:setSizingBorderThickness(pixels) end

---toggleRollup
 function CEGUI.FrameWindow:toggleRollup() end

---offsetPixelPosition
---@param offset CEGUI.Vector2_float_
 function CEGUI.FrameWindow:offsetPixelPosition(offset) end


---------------------------------------------------------------------------------
---Tooltip
---@class CEGUI.Tooltip : CEGUI.Window
 local Tooltip = {}
 CEGUI.Tooltip = Tooltip
 CEGUI.Tooltip = Tooltip


---setTargetWindow
---@param wnd CEGUI.Window
 function CEGUI.Tooltip:setTargetWindow(wnd) end

---getTargetWindow
---@return CEGUI.Window
 function CEGUI.Tooltip:getTargetWindow() end

---resetTimer
 function CEGUI.Tooltip:resetTimer() end

---setHoverTime
---@param seconds number
 function CEGUI.Tooltip:setHoverTime(seconds) end

---getHoverTime
---@return number
 function CEGUI.Tooltip:getHoverTime() end

---setDisplayTime
---@param seconds number
 function CEGUI.Tooltip:setDisplayTime(seconds) end

---getDisplayTime
---@return number
 function CEGUI.Tooltip:getDisplayTime() end

---positionSelf
 function CEGUI.Tooltip:positionSelf() end

---sizeSelf
 function CEGUI.Tooltip:sizeSelf() end

---getTextSize
---@return CEGUI.Size_float_
 function CEGUI.Tooltip:getTextSize() end


---------------------------------------------------------------------------------
---DragContainer
---@class CEGUI.DragContainer : CEGUI.Window
 local DragContainer = {}
 CEGUI.DragContainer = DragContainer
 CEGUI.DragContainer = DragContainer


---isDraggingEnabled
---@return boolean
 function CEGUI.DragContainer:isDraggingEnabled() end

---setDraggingEnabled
---@param setting boolean
 function CEGUI.DragContainer:setDraggingEnabled(setting) end

---isBeingDragged
---@return boolean
 function CEGUI.DragContainer:isBeingDragged() end

---getPixelDragThreshold
---@return number
 function CEGUI.DragContainer:getPixelDragThreshold() end

---setPixelDragThreshold
---@param pixels number
 function CEGUI.DragContainer:setPixelDragThreshold(pixels) end

---getDragAlpha
---@return number
 function CEGUI.DragContainer:getDragAlpha() end

---setDragAlpha
---@param alpha number
 function CEGUI.DragContainer:setDragAlpha(alpha) end

---getDragCursorImage
---@return CEGUI.Image
 function CEGUI.DragContainer:getDragCursorImage() end

---setDragCursorImage
---@param name string
 function CEGUI.DragContainer:setDragCursorImage(name) end

---setDragCursorImage
---@param image CEGUI.Image
 function CEGUI.DragContainer:setDragCursorImage(image) end

---getCurrentDropTarget
---@return CEGUI.Window
 function CEGUI.DragContainer:getCurrentDropTarget() end

---isStickyModeEnabled
---@return boolean
 function CEGUI.DragContainer:isStickyModeEnabled() end

---setStickyModeEnabled
---@param setting boolean
 function CEGUI.DragContainer:setStickyModeEnabled(setting) end

---pickUp
---@param force_sticky boolean
---@return boolean
 function CEGUI.DragContainer:pickUp(force_sticky) end

---setFixedDragOffset
---@param offset CEGUI.UVector2
 function CEGUI.DragContainer:setFixedDragOffset(offset) end

---getFixedDragOffset
---@return CEGUI.UVector2
 function CEGUI.DragContainer:getFixedDragOffset() end

---setUsingFixedDragOffset
---@param enable boolean
 function CEGUI.DragContainer:setUsingFixedDragOffset(enable) end

---isUsingFixedDragOffset
---@return boolean
 function CEGUI.DragContainer:isUsingFixedDragOffset() end


---------------------------------------------------------------------------------
---Scrollbar
---@class CEGUI.Scrollbar : CEGUI.Window
 local Scrollbar = {}
 CEGUI.Scrollbar = Scrollbar
 CEGUI.Scrollbar = Scrollbar


---getDocumentSize
---@return number
 function CEGUI.Scrollbar:getDocumentSize() end

---getPageSize
---@return number
 function CEGUI.Scrollbar:getPageSize() end

---getStepSize
---@return number
 function CEGUI.Scrollbar:getStepSize() end

---getOverlapSize
---@return number
 function CEGUI.Scrollbar:getOverlapSize() end

---getScrollPosition
---@return number
 function CEGUI.Scrollbar:getScrollPosition() end

---getUnitIntervalScrollPosition
---@return number
 function CEGUI.Scrollbar:getUnitIntervalScrollPosition() end

---isEndLockEnabled
---@return boolean
 function CEGUI.Scrollbar:isEndLockEnabled() end

---setDocumentSize
---@param document_size number
 function CEGUI.Scrollbar:setDocumentSize(document_size) end

---setPageSize
---@param page_size number
 function CEGUI.Scrollbar:setPageSize(page_size) end

---setStepSize
---@param step_size number
 function CEGUI.Scrollbar:setStepSize(step_size) end

---setOverlapSize
---@param overlap_size number
 function CEGUI.Scrollbar:setOverlapSize(overlap_size) end

---setScrollPosition
---@param position number
 function CEGUI.Scrollbar:setScrollPosition(position) end

---setUnitIntervalScrollPosition
---@param position number
 function CEGUI.Scrollbar:setUnitIntervalScrollPosition(position) end

---setEndLockEnabled
---@param enabled boolean
 function CEGUI.Scrollbar:setEndLockEnabled(enabled) end

---scrollForwardsByStep
 function CEGUI.Scrollbar:scrollForwardsByStep() end

---scrollBackwardsByStep
 function CEGUI.Scrollbar:scrollBackwardsByStep() end

---scrollForwardsByPage
 function CEGUI.Scrollbar:scrollForwardsByPage() end

---scrollBackwardsByPage
 function CEGUI.Scrollbar:scrollBackwardsByPage() end


---------------------------------------------------------------------------------
---ScrolledContainer
---@class CEGUI.ScrolledContainer : CEGUI.Window
 local ScrolledContainer = {}
 CEGUI.ScrolledContainer = ScrolledContainer
 CEGUI.ScrolledContainer = ScrolledContainer


---isContentPaneAutoSized
---@return boolean
 function CEGUI.ScrolledContainer:isContentPaneAutoSized() end

---setContentPaneAutoSized
---@param setting boolean
 function CEGUI.ScrolledContainer:setContentPaneAutoSized(setting) end

---getContentArea
---@return CEGUI.Rect_float_
 function CEGUI.ScrolledContainer:getContentArea() end

---setContentArea
---@param area CEGUI.Rect_float_
 function CEGUI.ScrolledContainer:setContentArea(area) end

---getChildExtentsArea
---@return CEGUI.Rect_float_
 function CEGUI.ScrolledContainer:getChildExtentsArea() end


---------------------------------------------------------------------------------
---ScrollablePane
---@class CEGUI.ScrollablePane : CEGUI.Window
 local ScrollablePane = {}
 CEGUI.ScrollablePane = ScrollablePane
 CEGUI.ScrollablePane = ScrollablePane


---getContentPane
---@return CEGUI.ScrolledContainer
 function CEGUI.ScrollablePane:getContentPane() end

---isVertScrollbarAlwaysShown
---@return boolean
 function CEGUI.ScrollablePane:isVertScrollbarAlwaysShown() end

---setShowVertScrollbar
---@param setting boolean
 function CEGUI.ScrollablePane:setShowVertScrollbar(setting) end

---isHorzScrollbarAlwaysShown
---@return boolean
 function CEGUI.ScrollablePane:isHorzScrollbarAlwaysShown() end

---setShowHorzScrollbar
---@param setting boolean
 function CEGUI.ScrollablePane:setShowHorzScrollbar(setting) end

---isContentPaneAutoSized
---@return boolean
 function CEGUI.ScrollablePane:isContentPaneAutoSized() end

---setContentPaneAutoSized
---@param setting boolean
 function CEGUI.ScrollablePane:setContentPaneAutoSized(setting) end

---getContentPaneArea
---@return CEGUI.Rect_float_
 function CEGUI.ScrollablePane:getContentPaneArea() end

---setContentPaneArea
---@param area CEGUI.Rect_float_
 function CEGUI.ScrollablePane:setContentPaneArea(area) end

---getHorizontalStepSize
---@return number
 function CEGUI.ScrollablePane:getHorizontalStepSize() end

---setHorizontalStepSize
---@param step number
 function CEGUI.ScrollablePane:setHorizontalStepSize(step) end

---getHorizontalOverlapSize
---@return number
 function CEGUI.ScrollablePane:getHorizontalOverlapSize() end

---setHorizontalOverlapSize
---@param overlap number
 function CEGUI.ScrollablePane:setHorizontalOverlapSize(overlap) end

---getHorizontalScrollPosition
---@return number
 function CEGUI.ScrollablePane:getHorizontalScrollPosition() end

---setHorizontalScrollPosition
---@param position number
 function CEGUI.ScrollablePane:setHorizontalScrollPosition(position) end

---getVerticalStepSize
---@return number
 function CEGUI.ScrollablePane:getVerticalStepSize() end

---setVerticalStepSize
---@param step number
 function CEGUI.ScrollablePane:setVerticalStepSize(step) end

---getVerticalOverlapSize
---@return number
 function CEGUI.ScrollablePane:getVerticalOverlapSize() end

---setVerticalOverlapSize
---@param overlap number
 function CEGUI.ScrollablePane:setVerticalOverlapSize(overlap) end

---getVerticalScrollPosition
---@return number
 function CEGUI.ScrollablePane:getVerticalScrollPosition() end

---setVerticalScrollPosition
---@param position number
 function CEGUI.ScrollablePane:setVerticalScrollPosition(position) end

---getViewableArea
---@return CEGUI.Rect_float_
 function CEGUI.ScrollablePane:getViewableArea() end

---getVertScrollbar
---@return CEGUI.Scrollbar
 function CEGUI.ScrollablePane:getVertScrollbar() end

---getHorzScrollbar
---@return CEGUI.Scrollbar
 function CEGUI.ScrollablePane:getHorzScrollbar() end


---------------------------------------------------------------------------------
---Slider
---@class CEGUI.Slider : CEGUI.Window
 local Slider = {}
 CEGUI.Slider = Slider
 CEGUI.Slider = Slider


---getCurrentValue
---@return number
 function CEGUI.Slider:getCurrentValue() end

---getMaxValue
---@return number
 function CEGUI.Slider:getMaxValue() end

---getClickStep
---@return number
 function CEGUI.Slider:getClickStep() end

---setMaxValue
---@param maxVal number
 function CEGUI.Slider:setMaxValue(maxVal) end

---setCurrentValue
---@param value number
 function CEGUI.Slider:setCurrentValue(value) end

---setClickStep
---@param step number
 function CEGUI.Slider:setClickStep(step) end


---------------------------------------------------------------------------------
---Spinner
---@class CEGUI.Spinner : CEGUI.Window
 local Spinner = {}
 CEGUI.Spinner = Spinner
 CEGUI.Spinner = Spinner


 CEGUI.Spinner.FloatingPoint = 1
 CEGUI.Spinner.Integer = 2
 CEGUI.Spinner.Hexadecimal = 3
 CEGUI.Spinner.Octal = 4
---getCurrentValue
---@return number
 function CEGUI.Spinner:getCurrentValue() end

---getStepSize
---@return number
 function CEGUI.Spinner:getStepSize() end

---getMaximumValue
---@return number
 function CEGUI.Spinner:getMaximumValue() end

---getMinimumValue
---@return number
 function CEGUI.Spinner:getMinimumValue() end

---getTextInputMode
---@return CEGUI.Spinner.TextInputMode
 function CEGUI.Spinner:getTextInputMode() end

---setCurrentValue
---@param value number
 function CEGUI.Spinner:setCurrentValue(value) end

---setStepSize
---@param step number
 function CEGUI.Spinner:setStepSize(step) end

---setMaximumValue
---@param maxValue number
 function CEGUI.Spinner:setMaximumValue(maxValue) end

---setMinimumValue
---@param minVaue number
 function CEGUI.Spinner:setMinimumValue(minVaue) end

---setTextInputMode
---@param mode CEGUI.Spinner.TextInputMode
 function CEGUI.Spinner:setTextInputMode(mode) end


---------------------------------------------------------------------------------
---ProgressBar
---@class CEGUI.ProgressBar : CEGUI.Window
 local ProgressBar = {}
 CEGUI.ProgressBar = ProgressBar
 CEGUI.ProgressBar = ProgressBar


---getProgress
---@return number
 function CEGUI.ProgressBar:getProgress() end

---getStepSize
---@return number
 function CEGUI.ProgressBar:getStepSize() end

---setProgress
---@param progress number
 function CEGUI.ProgressBar:setProgress(progress) end

---setStepSize
---@param step number
 function CEGUI.ProgressBar:setStepSize(step) end

---step
 function CEGUI.ProgressBar:step() end

---adjustProgress
---@param delta number
 function CEGUI.ProgressBar:adjustProgress(delta) end


---------------------------------------------------------------------------------
---Editbox
---@class CEGUI.Editbox : CEGUI.Window
 local Editbox = {}
 CEGUI.Editbox = Editbox
 CEGUI.Editbox = Editbox


---hasInputFocus
---@return boolean
 function CEGUI.Editbox:hasInputFocus() end

---isReadOnly
---@return boolean
 function CEGUI.Editbox:isReadOnly() end

---isTextMasked
---@return boolean
 function CEGUI.Editbox:isTextMasked() end

---getTextMatchState
---@return CEGUI.RegexMatcher.MatchState
 function CEGUI.Editbox:getTextMatchState() end

---getValidationString
---@return string
 function CEGUI.Editbox:getValidationString() end

---getCaretIndex
---@return number
 function CEGUI.Editbox:getCaretIndex() end

---getSelectionStartIndex
---@return number
 function CEGUI.Editbox:getSelectionStartIndex() end

---getSelectionEndIndex
---@return number
 function CEGUI.Editbox:getSelectionEndIndex() end

---getSelectionLength
---@return number
 function CEGUI.Editbox:getSelectionLength() end

---getMaskCodePoint
---@return number
 function CEGUI.Editbox:getMaskCodePoint() end

---getMaxTextLength
---@return number
 function CEGUI.Editbox:getMaxTextLength() end

---setReadOnly
---@param setting boolean
 function CEGUI.Editbox:setReadOnly(setting) end

---setTextMasked
---@param setting boolean
 function CEGUI.Editbox:setTextMasked(setting) end

---setValidationString
---@param validation_string string
 function CEGUI.Editbox:setValidationString(validation_string) end

---setCaretIndex
---@param caret_pos number
 function CEGUI.Editbox:setCaretIndex(caret_pos) end

---setSelection
---@param start_pos number
---@param end_pos number
 function CEGUI.Editbox:setSelection(start_pos, end_pos) end

---setMaskCodePoint
---@param code_point number
 function CEGUI.Editbox:setMaskCodePoint(code_point) end

---setMaxTextLength
---@param max_len number
 function CEGUI.Editbox:setMaxTextLength(max_len) end


---------------------------------------------------------------------------------
---MultiLineEditbox
---@class CEGUI.MultiLineEditbox : CEGUI.Window
 local MultiLineEditbox = {}
 CEGUI.MultiLineEditbox = MultiLineEditbox
 CEGUI.MultiLineEditbox = MultiLineEditbox


---hasInputFocus
---@return boolean
 function CEGUI.MultiLineEditbox:hasInputFocus() end

---isReadOnly
---@return boolean
 function CEGUI.MultiLineEditbox:isReadOnly() end

---getCaretIndex
---@return number
 function CEGUI.MultiLineEditbox:getCaretIndex() end

---getSelectionStartIndex
---@return number
 function CEGUI.MultiLineEditbox:getSelectionStartIndex() end

---getSelectionEndIndex
---@return number
 function CEGUI.MultiLineEditbox:getSelectionEndIndex() end

---getSelectionLength
---@return number
 function CEGUI.MultiLineEditbox:getSelectionLength() end

---getMaxTextLength
---@return number
 function CEGUI.MultiLineEditbox:getMaxTextLength() end

---isWordWrapped
---@return boolean
 function CEGUI.MultiLineEditbox:isWordWrapped() end

---getVertScrollbar
---@return CEGUI.Scrollbar
 function CEGUI.MultiLineEditbox:getVertScrollbar() end

---isVertScrollbarAlwaysShown
---@return boolean
 function CEGUI.MultiLineEditbox:isVertScrollbarAlwaysShown() end

---getHorzScrollbar
---@return CEGUI.Scrollbar
 function CEGUI.MultiLineEditbox:getHorzScrollbar() end

---getTextRenderArea
---@return CEGUI.Rect_float_
 function CEGUI.MultiLineEditbox:getTextRenderArea() end

---getLineNumberFromIndex
---@param index number
---@return number
 function CEGUI.MultiLineEditbox:getLineNumberFromIndex(index) end

---setReadOnly
---@param setting boolean
 function CEGUI.MultiLineEditbox:setReadOnly(setting) end

---setCaretIndex
---@param caret_pos number
 function CEGUI.MultiLineEditbox:setCaretIndex(caret_pos) end

---setSelection
---@param start_pos number
---@param end_pos number
 function CEGUI.MultiLineEditbox:setSelection(start_pos, end_pos) end

---setMaxTextLength
---@param max_len number
 function CEGUI.MultiLineEditbox:setMaxTextLength(max_len) end

---ensureCaretIsVisible
 function CEGUI.MultiLineEditbox:ensureCaretIsVisible() end

---setWordWrapping
---@param setting boolean
 function CEGUI.MultiLineEditbox:setWordWrapping(setting) end

---setShowVertScrollbar
---@param setting boolean
 function CEGUI.MultiLineEditbox:setShowVertScrollbar(setting) end

---setSelectionBrushImage
---@param image CEGUI.Image
 function CEGUI.MultiLineEditbox:setSelectionBrushImage(image) end

---getSelectionBrushImage
---@return CEGUI.Image
 function CEGUI.MultiLineEditbox:getSelectionBrushImage() end


---------------------------------------------------------------------------------
---ListboxItem
---@class CEGUI.ListboxItem
 local ListboxItem = {}
 CEGUI.ListboxItem = ListboxItem
 CEGUI.ListboxItem = ListboxItem


---getText
---@return string
 function CEGUI.ListboxItem:getText() end

---getID
---@return number
 function CEGUI.ListboxItem:getID() end

---getUserData
 function CEGUI.ListboxItem:getUserData() end

---isSelected
---@return boolean
 function CEGUI.ListboxItem:isSelected() end

---isDisabled
---@return boolean
 function CEGUI.ListboxItem:isDisabled() end

---isAutoDeleted
---@return boolean
 function CEGUI.ListboxItem:isAutoDeleted() end

---getOwnerWindow
---@return CEGUI.Window
 function CEGUI.ListboxItem:getOwnerWindow() end

---getSelectionColours
---@return CEGUI.ColourRect
 function CEGUI.ListboxItem:getSelectionColours() end

---getSelectionBrushImage
---@return CEGUI.Image
 function CEGUI.ListboxItem:getSelectionBrushImage() end

---setText
---@param text string
 function CEGUI.ListboxItem:setText(text) end

---setID
---@param item_id number
 function CEGUI.ListboxItem:setID(item_id) end

---setUserData
 function CEGUI.ListboxItem:setUserData() end

---setSelected
---@param setting boolean
 function CEGUI.ListboxItem:setSelected(setting) end

---setDisabled
---@param setting boolean
 function CEGUI.ListboxItem:setDisabled(setting) end

---setAutoDeleted
---@param setting boolean
 function CEGUI.ListboxItem:setAutoDeleted(setting) end

---setOwnerWindow
---@param owner CEGUI.Window
 function CEGUI.ListboxItem:setOwnerWindow(owner) end

---setSelectionColours
---@param cols CEGUI.ColourRect
 function CEGUI.ListboxItem:setSelectionColours(cols) end

---setSelectionColours
---@param top_left_colour CEGUI.Colour
---@param top_right_colour CEGUI.Colour
---@param bottom_left_colour CEGUI.Colour
---@param bottom_right_colour CEGUI.Colour
 function CEGUI.ListboxItem:setSelectionColours(top_left_colour, top_right_colour, bottom_left_colour, bottom_right_colour) end

---setSelectionColours
---@param col CEGUI.Colour
 function CEGUI.ListboxItem:setSelectionColours(col) end

---setSelectionBrushImage
---@param image CEGUI.Image
 function CEGUI.ListboxItem:setSelectionBrushImage(image) end

---setSelectionBrushImage
---@param name string
 function CEGUI.ListboxItem:setSelectionBrushImage(name) end

---getPixelSize
---@return CEGUI.Size_float_
 function CEGUI.ListboxItem:getPixelSize() end


---------------------------------------------------------------------------------
---ListboxTextItem
---@class CEGUI.ListboxTextItem : CEGUI.ListboxItem
 local ListboxTextItem = {}
 CEGUI.ListboxTextItem = ListboxTextItem
 CEGUI.ListboxTextItem = ListboxTextItem


---getFont
---@return CEGUI.Font
 function CEGUI.ListboxTextItem:getFont() end

---getTextColours
---@return CEGUI.ColourRect
 function CEGUI.ListboxTextItem:getTextColours() end

---setFont
---@param font_name string
 function CEGUI.ListboxTextItem:setFont(font_name) end

---setFont
---@param font CEGUI.Font
 function CEGUI.ListboxTextItem:setFont(font) end

---setTextColours
---@param top_left_colour CEGUI.Colour
---@param top_right_colour CEGUI.Colour
---@param bottom_left_colour CEGUI.Colour
---@param bottom_right_colour CEGUI.Colour
 function CEGUI.ListboxTextItem:setTextColours(top_left_colour, top_right_colour, bottom_left_colour, bottom_right_colour) end

---setTextColours
---@param cols CEGUI.ColourRect
 function CEGUI.ListboxTextItem:setTextColours(cols) end

---setTextColours
---@param col CEGUI.Colour
 function CEGUI.ListboxTextItem:setTextColours(col) end

---setTextParsingEnabled
---@param enable boolean
 function CEGUI.ListboxTextItem:setTextParsingEnabled(enable) end

---isTextParsingEnabled
---@return boolean
 function CEGUI.ListboxTextItem:isTextParsingEnabled() end


---------------------------------------------------------------------------------
---Combobox
---@class CEGUI.Combobox : CEGUI.Window
 local Combobox = {}
 CEGUI.Combobox = Combobox
 CEGUI.Combobox = Combobox


---getSingleClickEnabled
---@return boolean
 function CEGUI.Combobox:getSingleClickEnabled() end

---isDropDownListVisible
---@return boolean
 function CEGUI.Combobox:isDropDownListVisible() end

---getEditbox
---@return CEGUI.Editbox
 function CEGUI.Combobox:getEditbox() end

---getPushButton
---@return CEGUI.PushButton
 function CEGUI.Combobox:getPushButton() end

---getDropList
---@return CEGUI.ComboDropList
 function CEGUI.Combobox:getDropList() end

---hasInputFocus
---@return boolean
 function CEGUI.Combobox:hasInputFocus() end

---isReadOnly
---@return boolean
 function CEGUI.Combobox:isReadOnly() end

---getTextMatchState
---@return CEGUI.RegexMatcher.MatchState
 function CEGUI.Combobox:getTextMatchState() end

---getValidationString
---@return string
 function CEGUI.Combobox:getValidationString() end

---getCaretIndex
---@return number
 function CEGUI.Combobox:getCaretIndex() end

---getSelectionStartIndex
---@return number
 function CEGUI.Combobox:getSelectionStartIndex() end

---getSelectionEndIndex
---@return number
 function CEGUI.Combobox:getSelectionEndIndex() end

---getSelectionLength
---@return number
 function CEGUI.Combobox:getSelectionLength() end

---getMaxTextLength
---@return number
 function CEGUI.Combobox:getMaxTextLength() end

---activateEditbox
 function CEGUI.Combobox:activateEditbox() end

---getItemCount
---@return number
 function CEGUI.Combobox:getItemCount() end

---getSelectedItem
---@return CEGUI.ListboxItem
 function CEGUI.Combobox:getSelectedItem() end

---getListboxItemFromIndex
---@param index number
---@return CEGUI.ListboxItem
 function CEGUI.Combobox:getListboxItemFromIndex(index) end

---getItemIndex
---@param item CEGUI.ListboxItem
---@return number
 function CEGUI.Combobox:getItemIndex(item) end

---isItemSelected
---@param index number
---@return boolean
 function CEGUI.Combobox:isItemSelected(index) end

---findItemWithText
---@param text string
---@param start_item CEGUI.ListboxItem
---@return CEGUI.ListboxItem
 function CEGUI.Combobox:findItemWithText(text, start_item) end

---isListboxItemInList
---@param item CEGUI.ListboxItem
---@return boolean
 function CEGUI.Combobox:isListboxItemInList(item) end

---resetList
 function CEGUI.Combobox:resetList() end

---addItem
---@param item CEGUI.ListboxItem
 function CEGUI.Combobox:addItem(item) end

---insertItem
---@param item CEGUI.ListboxItem
---@param position CEGUI.ListboxItem
 function CEGUI.Combobox:insertItem(item, position) end

---removeItem
---@param item CEGUI.ListboxItem
 function CEGUI.Combobox:removeItem(item) end

---clearAllSelections
 function CEGUI.Combobox:clearAllSelections() end

---setSortingEnabled
---@param setting boolean
 function CEGUI.Combobox:setSortingEnabled(setting) end

---setShowVertScrollbar
---@param setting boolean
 function CEGUI.Combobox:setShowVertScrollbar(setting) end

---setShowHorzScrollbar
---@param setting boolean
 function CEGUI.Combobox:setShowHorzScrollbar(setting) end

---setItemSelectState
---@param item CEGUI.ListboxItem
---@param state boolean
 function CEGUI.Combobox:setItemSelectState(item, state) end

---setItemSelectState
---@param item_index number
---@param state boolean
 function CEGUI.Combobox:setItemSelectState(item_index, state) end

---handleUpdatedListItemData
 function CEGUI.Combobox:handleUpdatedListItemData() end

---isSortEnabled
---@return boolean
 function CEGUI.Combobox:isSortEnabled() end

---isVertScrollbarAlwaysShown
---@return boolean
 function CEGUI.Combobox:isVertScrollbarAlwaysShown() end

---isHorzScrollbarAlwaysShown
---@return boolean
 function CEGUI.Combobox:isHorzScrollbarAlwaysShown() end

---showDropList
 function CEGUI.Combobox:showDropList() end

---hideDropList
 function CEGUI.Combobox:hideDropList() end

---setSingleClickEnabled
---@param setting boolean
 function CEGUI.Combobox:setSingleClickEnabled(setting) end

---setReadOnly
---@param setting boolean
 function CEGUI.Combobox:setReadOnly(setting) end

---setValidationString
---@param validation_string string
 function CEGUI.Combobox:setValidationString(validation_string) end

---setCaretIndex
---@param caret_pos number
 function CEGUI.Combobox:setCaretIndex(caret_pos) end

---setSelection
---@param start_pos number
---@param end_pos number
 function CEGUI.Combobox:setSelection(start_pos, end_pos) end

---setMaxTextLength
---@param max_len number
 function CEGUI.Combobox:setMaxTextLength(max_len) end

---getAutoSizeListHeightToContent
---@return boolean
 function CEGUI.Combobox:getAutoSizeListHeightToContent() end

---getAutoSizeListWidthToContent
---@return boolean
 function CEGUI.Combobox:getAutoSizeListWidthToContent() end

---setAutoSizeListHeightToContent
---@param auto_size boolean
 function CEGUI.Combobox:setAutoSizeListHeightToContent(auto_size) end

---setAutoSizeListWidthToContent
---@param auto_size boolean
 function CEGUI.Combobox:setAutoSizeListWidthToContent(auto_size) end

---updateAutoSizedDropList
 function CEGUI.Combobox:updateAutoSizedDropList() end


---------------------------------------------------------------------------------
---Listbox
---@class CEGUI.Listbox : CEGUI.Window
 local Listbox = {}
 CEGUI.Listbox = Listbox
 CEGUI.Listbox = Listbox


---getItemCount
---@return number
 function CEGUI.Listbox:getItemCount() end

---getSelectedCount
---@return number
 function CEGUI.Listbox:getSelectedCount() end

---getFirstSelectedItem
---@return CEGUI.ListboxItem
 function CEGUI.Listbox:getFirstSelectedItem() end

---getNextSelected
---@param start_item CEGUI.ListboxItem
---@return CEGUI.ListboxItem
 function CEGUI.Listbox:getNextSelected(start_item) end

---getListboxItemFromIndex
---@param index number
---@return CEGUI.ListboxItem
 function CEGUI.Listbox:getListboxItemFromIndex(index) end

---getItemIndex
---@param item CEGUI.ListboxItem
---@return number
 function CEGUI.Listbox:getItemIndex(item) end

---findItemWithText
---@param text string
---@param start_item CEGUI.ListboxItem
---@return CEGUI.ListboxItem
 function CEGUI.Listbox:findItemWithText(text, start_item) end

---isSortEnabled
---@return boolean
 function CEGUI.Listbox:isSortEnabled() end

---isMultiselectEnabled
---@return boolean
 function CEGUI.Listbox:isMultiselectEnabled() end

---isItemSelected
---@param index number
---@return boolean
 function CEGUI.Listbox:isItemSelected(index) end

---isListboxItemInList
---@param item CEGUI.ListboxItem
---@return boolean
 function CEGUI.Listbox:isListboxItemInList(item) end

---isVertScrollbarAlwaysShown
---@return boolean
 function CEGUI.Listbox:isVertScrollbarAlwaysShown() end

---isHorzScrollbarAlwaysShown
---@return boolean
 function CEGUI.Listbox:isHorzScrollbarAlwaysShown() end

---resetList
 function CEGUI.Listbox:resetList() end

---addItem
---@param item CEGUI.ListboxItem
 function CEGUI.Listbox:addItem(item) end

---insertItem
---@param item CEGUI.ListboxItem
---@param position CEGUI.ListboxItem
 function CEGUI.Listbox:insertItem(item, position) end

---removeItem
---@param item CEGUI.ListboxItem
 function CEGUI.Listbox:removeItem(item) end

---clearAllSelections
 function CEGUI.Listbox:clearAllSelections() end

---setSortingEnabled
---@param setting boolean
 function CEGUI.Listbox:setSortingEnabled(setting) end

---setMultiselectEnabled
---@param setting boolean
 function CEGUI.Listbox:setMultiselectEnabled(setting) end

---setShowVertScrollbar
---@param setting boolean
 function CEGUI.Listbox:setShowVertScrollbar(setting) end

---setShowHorzScrollbar
---@param setting boolean
 function CEGUI.Listbox:setShowHorzScrollbar(setting) end

---setItemSelectState
---@param item CEGUI.ListboxItem
---@param state boolean
 function CEGUI.Listbox:setItemSelectState(item, state) end

---setItemSelectState
---@param item_index number
---@param state boolean
 function CEGUI.Listbox:setItemSelectState(item_index, state) end

---handleUpdatedItemData
 function CEGUI.Listbox:handleUpdatedItemData() end

---ensureItemIsVisible
---@param item_index number
 function CEGUI.Listbox:ensureItemIsVisible(item_index) end

---ensureItemIsVisible
---@param item CEGUI.ListboxItem
 function CEGUI.Listbox:ensureItemIsVisible(item) end

---getListRenderArea
---@return CEGUI.Rect_float_
 function CEGUI.Listbox:getListRenderArea() end

---getVertScrollbar
---@return CEGUI.Scrollbar
 function CEGUI.Listbox:getVertScrollbar() end

---getHorzScrollbar
---@return CEGUI.Scrollbar
 function CEGUI.Listbox:getHorzScrollbar() end

---getWidestItemWidth
---@return number
 function CEGUI.Listbox:getWidestItemWidth() end

---getTotalItemsHeight
---@return number
 function CEGUI.Listbox:getTotalItemsHeight() end

---getItemAtPoint
---@param pt CEGUI.Vector2_float_
---@return CEGUI.ListboxItem
 function CEGUI.Listbox:getItemAtPoint(pt) end


---------------------------------------------------------------------------------
---ComboDropList
---@class CEGUI.ComboDropList : CEGUI.Listbox
 local ComboDropList = {}
 CEGUI.ComboDropList = ComboDropList
 CEGUI.ComboDropList = ComboDropList


---setArmed
---@param setting boolean
 function CEGUI.ComboDropList:setArmed(setting) end

---isArmed
---@return boolean
 function CEGUI.ComboDropList:isArmed() end

---setAutoArmEnabled
---@param setting boolean
 function CEGUI.ComboDropList:setAutoArmEnabled(setting) end

---isAutoArmEnabled
---@return boolean
 function CEGUI.ComboDropList:isAutoArmEnabled() end

---resizeToContent
---@param fit_width boolean
---@param fit_height boolean
 function CEGUI.ComboDropList:resizeToContent(fit_width, fit_height) end


---------------------------------------------------------------------------------
---ListHeaderSegment
---@class CEGUI.ListHeaderSegment : CEGUI.Window
 local ListHeaderSegment = {}
 CEGUI.ListHeaderSegment = ListHeaderSegment
 CEGUI.ListHeaderSegment = ListHeaderSegment


 CEGUI.ListHeaderSegment.None = 1
 CEGUI.ListHeaderSegment.Ascending = 2
 CEGUI.ListHeaderSegment.Descending = 3
---isSizingEnabled
---@return boolean
 function CEGUI.ListHeaderSegment:isSizingEnabled() end

---getSortDirection
---@return CEGUI.ListHeaderSegment.SortDirection
 function CEGUI.ListHeaderSegment:getSortDirection() end

---isDragMovingEnabled
---@return boolean
 function CEGUI.ListHeaderSegment:isDragMovingEnabled() end

---getDragMoveOffset
---@return CEGUI.Vector2_float_
 function CEGUI.ListHeaderSegment:getDragMoveOffset() end

---isClickable
---@return boolean
 function CEGUI.ListHeaderSegment:isClickable() end

---setSizingEnabled
---@param setting boolean
 function CEGUI.ListHeaderSegment:setSizingEnabled(setting) end

---setSortDirection
---@param sort_dir CEGUI.ListHeaderSegment.SortDirection
 function CEGUI.ListHeaderSegment:setSortDirection(sort_dir) end

---setDragMovingEnabled
---@param setting boolean
 function CEGUI.ListHeaderSegment:setDragMovingEnabled(setting) end

---setClickable
---@param setting boolean
 function CEGUI.ListHeaderSegment:setClickable(setting) end


---------------------------------------------------------------------------------
---ListHeader
---@class CEGUI.ListHeader : CEGUI.Window
 local ListHeader = {}
 CEGUI.ListHeader = ListHeader
 CEGUI.ListHeader = ListHeader


---getColumnCount
---@return number
 function CEGUI.ListHeader:getColumnCount() end

---getSegmentFromColumn
---@param column number
---@return CEGUI.ListHeaderSegment
 function CEGUI.ListHeader:getSegmentFromColumn(column) end

---getSegmentFromID
---@param id number
---@return CEGUI.ListHeaderSegment
 function CEGUI.ListHeader:getSegmentFromID(id) end

---getSortSegment
---@return CEGUI.ListHeaderSegment
 function CEGUI.ListHeader:getSortSegment() end

---getColumnFromSegment
---@param segment CEGUI.ListHeaderSegment
---@return number
 function CEGUI.ListHeader:getColumnFromSegment(segment) end

---getColumnFromID
---@param id number
---@return number
 function CEGUI.ListHeader:getColumnFromID(id) end

---getSortColumn
---@return number
 function CEGUI.ListHeader:getSortColumn() end

---getColumnWithText
---@param text string
---@return number
 function CEGUI.ListHeader:getColumnWithText(text) end

---getPixelOffsetToSegment
---@param segment CEGUI.ListHeaderSegment
---@return number
 function CEGUI.ListHeader:getPixelOffsetToSegment(segment) end

---getPixelOffsetToColumn
---@param column number
---@return number
 function CEGUI.ListHeader:getPixelOffsetToColumn(column) end

---getTotalSegmentsPixelExtent
---@return number
 function CEGUI.ListHeader:getTotalSegmentsPixelExtent() end

---getColumnWidth
---@param column number
---@return CEGUI.UDim
 function CEGUI.ListHeader:getColumnWidth(column) end

---getSortDirection
---@return CEGUI.ListHeaderSegment.SortDirection
 function CEGUI.ListHeader:getSortDirection() end

---isSortingEnabled
---@return boolean
 function CEGUI.ListHeader:isSortingEnabled() end

---isColumnSizingEnabled
---@return boolean
 function CEGUI.ListHeader:isColumnSizingEnabled() end

---isColumnDraggingEnabled
---@return boolean
 function CEGUI.ListHeader:isColumnDraggingEnabled() end

---getSegmentOffset
---@return number
 function CEGUI.ListHeader:getSegmentOffset() end

---setSortingEnabled
---@param setting boolean
 function CEGUI.ListHeader:setSortingEnabled(setting) end

---setSortDirection
---@param direction CEGUI.ListHeaderSegment.SortDirection
 function CEGUI.ListHeader:setSortDirection(direction) end

---setSortSegment
---@param segment CEGUI.ListHeaderSegment
 function CEGUI.ListHeader:setSortSegment(segment) end

---setSortColumn
---@param column number
 function CEGUI.ListHeader:setSortColumn(column) end

---setSortColumnFromID
---@param id number
 function CEGUI.ListHeader:setSortColumnFromID(id) end

---setColumnSizingEnabled
---@param setting boolean
 function CEGUI.ListHeader:setColumnSizingEnabled(setting) end

---setColumnDraggingEnabled
---@param setting boolean
 function CEGUI.ListHeader:setColumnDraggingEnabled(setting) end

---addColumn
---@param text string
---@param id number
---@param width CEGUI.UDim
 function CEGUI.ListHeader:addColumn(text, id, width) end

---insertColumn
---@param text string
---@param id number
---@param width CEGUI.UDim
---@param position number
 function CEGUI.ListHeader:insertColumn(text, id, width, position) end

---insertColumn
---@param text string
---@param id number
---@param width CEGUI.UDim
---@param position CEGUI.ListHeaderSegment
 function CEGUI.ListHeader:insertColumn(text, id, width, position) end

---removeColumn
---@param column number
 function CEGUI.ListHeader:removeColumn(column) end

---removeSegment
---@param segment CEGUI.ListHeaderSegment
 function CEGUI.ListHeader:removeSegment(segment) end

---moveColumn
---@param column number
---@param position number
 function CEGUI.ListHeader:moveColumn(column, position) end

---moveColumn
---@param column number
---@param position CEGUI.ListHeaderSegment
 function CEGUI.ListHeader:moveColumn(column, position) end

---moveSegment
---@param segment CEGUI.ListHeaderSegment
---@param position number
 function CEGUI.ListHeader:moveSegment(segment, position) end

---moveSegment
---@param segment CEGUI.ListHeaderSegment
---@param position CEGUI.ListHeaderSegment
 function CEGUI.ListHeader:moveSegment(segment, position) end

---setSegmentOffset
---@param offset number
 function CEGUI.ListHeader:setSegmentOffset(offset) end

---setColumnWidth
---@param column number
---@param width CEGUI.UDim
 function CEGUI.ListHeader:setColumnWidth(column, width) end


---------------------------------------------------------------------------------
---MCLGridRef
---@class CEGUI.MCLGridRef
 local MCLGridRef = {}
 CEGUI.MCLGridRef = MCLGridRef
 CEGUI.MCLGridRef = MCLGridRef


---
-- @field [parent=#CEGUI.MCLGridRef] #number row

---
-- @field [parent=#CEGUI.MCLGridRef] #number column

---.eq
---@param rhs CEGUI.MCLGridRef
---@return boolean
 function CEGUI.MCLGridRef:__eq(rhs) end

---new
---@param r number
---@param c number
---@return CEGUI.MCLGridRef
 function CEGUI.MCLGridRef:new(r, c) end

---
-- new_local 
-- @function [parent=#CEGUI.MCLGridRef] new_local
-- @param self
-- @param #number r
-- @param #number c
-- @return #CEGUI.MCLGridRef

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.MCLGridRef
-- @param self
-- @return #CEGUI.MCLGridRef


---------------------------------------------------------------------------------
---MultiColumnList
---@class CEGUI.MultiColumnList : CEGUI.Window
 local MultiColumnList = {}
 CEGUI.MultiColumnList = MultiColumnList
 CEGUI.MultiColumnList = MultiColumnList


 CEGUI.MultiColumnList.RowSingle = 1
 CEGUI.MultiColumnList.RowMultiple = 2
 CEGUI.MultiColumnList.CellSingle = 3
 CEGUI.MultiColumnList.CellMultiple = 4
 CEGUI.MultiColumnList.NominatedColumnSingle = 5
 CEGUI.MultiColumnList.NominatedColumnMultiple = 6
 CEGUI.MultiColumnList.ColumnSingle = 7
 CEGUI.MultiColumnList.ColumnMultiple = 8
 CEGUI.MultiColumnList.NominatedRowSingle = 9
 CEGUI.MultiColumnList.NominatedRowMultiple = 10
---isUserSortControlEnabled
---@return boolean
 function CEGUI.MultiColumnList:isUserSortControlEnabled() end

---isUserColumnSizingEnabled
---@return boolean
 function CEGUI.MultiColumnList:isUserColumnSizingEnabled() end

---isUserColumnDraggingEnabled
---@return boolean
 function CEGUI.MultiColumnList:isUserColumnDraggingEnabled() end

---getColumnCount
---@return number
 function CEGUI.MultiColumnList:getColumnCount() end

---getRowCount
---@return number
 function CEGUI.MultiColumnList:getRowCount() end

---getSortColumn
---@return number
 function CEGUI.MultiColumnList:getSortColumn() end

---getColumnWithID
---@param col_id number
---@return number
 function CEGUI.MultiColumnList:getColumnWithID(col_id) end

---getColumnWithHeaderText
---@param text string
---@return number
 function CEGUI.MultiColumnList:getColumnWithHeaderText(text) end

---getTotalColumnHeadersWidth
---@return CEGUI.UDim
 function CEGUI.MultiColumnList:getTotalColumnHeadersWidth() end

---getColumnHeaderWidth
---@param col_idx number
---@return CEGUI.UDim
 function CEGUI.MultiColumnList:getColumnHeaderWidth(col_idx) end

---getSortDirection
---@return CEGUI.ListHeaderSegment.SortDirection
 function CEGUI.MultiColumnList:getSortDirection() end

---getHeaderSegmentForColumn
---@param col_idx number
---@return CEGUI.ListHeaderSegment
 function CEGUI.MultiColumnList:getHeaderSegmentForColumn(col_idx) end

---getItemRowIndex
---@param item CEGUI.ListboxItem
---@return number
 function CEGUI.MultiColumnList:getItemRowIndex(item) end

---getItemColumnIndex
---@param item CEGUI.ListboxItem
---@return number
 function CEGUI.MultiColumnList:getItemColumnIndex(item) end

---getItemGridReference
---@param item CEGUI.ListboxItem
---@return CEGUI.MCLGridRef
 function CEGUI.MultiColumnList:getItemGridReference(item) end

---getItemAtGridReference
---@param grid_ref CEGUI.MCLGridRef
---@return CEGUI.ListboxItem
 function CEGUI.MultiColumnList:getItemAtGridReference(grid_ref) end

---isListboxItemInColumn
---@param item CEGUI.ListboxItem
---@param col_idx number
---@return boolean
 function CEGUI.MultiColumnList:isListboxItemInColumn(item, col_idx) end

---isListboxItemInRow
---@param item CEGUI.ListboxItem
---@param row_idx number
---@return boolean
 function CEGUI.MultiColumnList:isListboxItemInRow(item, row_idx) end

---isListboxItemInList
---@param item CEGUI.ListboxItem
---@return boolean
 function CEGUI.MultiColumnList:isListboxItemInList(item) end

---findColumnItemWithText
---@param text string
---@param col_idx number
---@param start_item CEGUI.ListboxItem
---@return CEGUI.ListboxItem
 function CEGUI.MultiColumnList:findColumnItemWithText(text, col_idx, start_item) end

---findRowItemWithText
---@param text string
---@param row_idx number
---@param start_item CEGUI.ListboxItem
---@return CEGUI.ListboxItem
 function CEGUI.MultiColumnList:findRowItemWithText(text, row_idx, start_item) end

---findListItemWithText
---@param text string
---@param start_item CEGUI.ListboxItem
---@return CEGUI.ListboxItem
 function CEGUI.MultiColumnList:findListItemWithText(text, start_item) end

---getFirstSelectedItem
---@return CEGUI.ListboxItem
 function CEGUI.MultiColumnList:getFirstSelectedItem() end

---getNextSelected
---@param start_item CEGUI.ListboxItem
---@return CEGUI.ListboxItem
 function CEGUI.MultiColumnList:getNextSelected(start_item) end

---getSelectedCount
---@return number
 function CEGUI.MultiColumnList:getSelectedCount() end

---isItemSelected
---@param grid_ref CEGUI.MCLGridRef
---@return boolean
 function CEGUI.MultiColumnList:isItemSelected(grid_ref) end

---getNominatedSelectionColumnID
---@return number
 function CEGUI.MultiColumnList:getNominatedSelectionColumnID() end

---getNominatedSelectionColumn
---@return number
 function CEGUI.MultiColumnList:getNominatedSelectionColumn() end

---getNominatedSelectionRow
---@return number
 function CEGUI.MultiColumnList:getNominatedSelectionRow() end

---getSelectionMode
---@return CEGUI.MultiColumnList.SelectionMode
 function CEGUI.MultiColumnList:getSelectionMode() end

---isVertScrollbarAlwaysShown
---@return boolean
 function CEGUI.MultiColumnList:isVertScrollbarAlwaysShown() end

---isHorzScrollbarAlwaysShown
---@return boolean
 function CEGUI.MultiColumnList:isHorzScrollbarAlwaysShown() end

---getColumnID
---@param col_idx number
---@return number
 function CEGUI.MultiColumnList:getColumnID(col_idx) end

---getRowID
---@param row_idx number
---@return number
 function CEGUI.MultiColumnList:getRowID(row_idx) end

---getRowWithID
---@param row_id number
---@return number
 function CEGUI.MultiColumnList:getRowWithID(row_id) end

---getListRenderArea
---@return CEGUI.Rect_float_
 function CEGUI.MultiColumnList:getListRenderArea() end

---getVertScrollbar
---@return CEGUI.Scrollbar
 function CEGUI.MultiColumnList:getVertScrollbar() end

---getHorzScrollbar
---@return CEGUI.Scrollbar
 function CEGUI.MultiColumnList:getHorzScrollbar() end

---getListHeader
---@return CEGUI.ListHeader
 function CEGUI.MultiColumnList:getListHeader() end

---getTotalRowsHeight
---@return number
 function CEGUI.MultiColumnList:getTotalRowsHeight() end

---getWidestColumnItemWidth
---@param col_idx number
---@return number
 function CEGUI.MultiColumnList:getWidestColumnItemWidth(col_idx) end

---getHighestRowItemHeight
---@param row_idx number
---@return number
 function CEGUI.MultiColumnList:getHighestRowItemHeight(row_idx) end

---resetList
 function CEGUI.MultiColumnList:resetList() end

---addColumn
---@param text string
---@param col_id number
---@param width CEGUI.UDim
 function CEGUI.MultiColumnList:addColumn(text, col_id, width) end

---insertColumn
---@param text string
---@param col_id number
---@param width CEGUI.UDim
---@param position number
 function CEGUI.MultiColumnList:insertColumn(text, col_id, width, position) end

---removeColumn
---@param col_idx number
 function CEGUI.MultiColumnList:removeColumn(col_idx) end

---removeColumnWithID
---@param col_id number
 function CEGUI.MultiColumnList:removeColumnWithID(col_id) end

---moveColumn
---@param col_idx number
---@param position number
 function CEGUI.MultiColumnList:moveColumn(col_idx, position) end

---moveColumnWithID
---@param col_id number
---@param position number
 function CEGUI.MultiColumnList:moveColumnWithID(col_id, position) end

---addRow
---@return number
 function CEGUI.MultiColumnList:addRow() end

---addRow
---@param item CEGUI.ListboxItem
---@param col_id number
---@return number
 function CEGUI.MultiColumnList:addRow(item, col_id) end

---insertRow
---@param row_idx number
---@return number
 function CEGUI.MultiColumnList:insertRow(row_idx) end

---insertRow
---@param item CEGUI.ListboxItem
---@param col_id number
---@param row_idx number
---@return number
 function CEGUI.MultiColumnList:insertRow(item, col_id, row_idx) end

---removeRow
---@param row_idx number
 function CEGUI.MultiColumnList:removeRow(row_idx) end

---setItem
---@param item CEGUI.ListboxItem
---@param position CEGUI.MCLGridRef
 function CEGUI.MultiColumnList:setItem(item, position) end

---setItem
---@param item CEGUI.ListboxItem
---@param col_id number
---@param row_idx number
 function CEGUI.MultiColumnList:setItem(item, col_id, row_idx) end

---setSelectionMode
---@param sel_mode CEGUI.MultiColumnList.SelectionMode
 function CEGUI.MultiColumnList:setSelectionMode(sel_mode) end

---setNominatedSelectionColumnID
---@param col_id number
 function CEGUI.MultiColumnList:setNominatedSelectionColumnID(col_id) end

---setNominatedSelectionColumn
---@param col_idx number
 function CEGUI.MultiColumnList:setNominatedSelectionColumn(col_idx) end

---setNominatedSelectionRow
---@param row_idx number
 function CEGUI.MultiColumnList:setNominatedSelectionRow(row_idx) end

---setSortDirection
---@param direction CEGUI.ListHeaderSegment.SortDirection
 function CEGUI.MultiColumnList:setSortDirection(direction) end

---setSortColumn
---@param col_idx number
 function CEGUI.MultiColumnList:setSortColumn(col_idx) end

---setSortColumnByID
---@param col_id number
 function CEGUI.MultiColumnList:setSortColumnByID(col_id) end

---setShowVertScrollbar
---@param setting boolean
 function CEGUI.MultiColumnList:setShowVertScrollbar(setting) end

---setShowHorzScrollbar
---@param setting boolean
 function CEGUI.MultiColumnList:setShowHorzScrollbar(setting) end

---clearAllSelections
 function CEGUI.MultiColumnList:clearAllSelections() end

---setItemSelectState
---@param item CEGUI.ListboxItem
---@param state boolean
 function CEGUI.MultiColumnList:setItemSelectState(item, state) end

---setItemSelectState
---@param grid_ref CEGUI.MCLGridRef
---@param state boolean
 function CEGUI.MultiColumnList:setItemSelectState(grid_ref, state) end

---handleUpdatedItemData
 function CEGUI.MultiColumnList:handleUpdatedItemData() end

---setColumnHeaderWidth
---@param col_idx number
---@param width CEGUI.UDim
 function CEGUI.MultiColumnList:setColumnHeaderWidth(col_idx, width) end

---setUserSortControlEnabled
---@param setting boolean
 function CEGUI.MultiColumnList:setUserSortControlEnabled(setting) end

---setUserColumnSizingEnabled
---@param setting boolean
 function CEGUI.MultiColumnList:setUserColumnSizingEnabled(setting) end

---setUserColumnDraggingEnabled
---@param setting boolean
 function CEGUI.MultiColumnList:setUserColumnDraggingEnabled(setting) end

---autoSizeColumnHeader
---@param col_idx number
 function CEGUI.MultiColumnList:autoSizeColumnHeader(col_idx) end

---setRowID
---@param row_idx number
---@param row_id number
 function CEGUI.MultiColumnList:setRowID(row_idx, row_id) end

---ensureRowIsVisible
---@param row_idx number
 function CEGUI.MultiColumnList:ensureRowIsVisible(row_idx) end

---ensureColumnIsVisible
---@param col_idx number
 function CEGUI.MultiColumnList:ensureColumnIsVisible(col_idx) end

---ensureItemRowIsVisible
---@param item CEGUI.ListboxItem
 function CEGUI.MultiColumnList:ensureItemRowIsVisible(item) end

---ensureItemColumnIsVisible
---@param item CEGUI.ListboxItem
 function CEGUI.MultiColumnList:ensureItemColumnIsVisible(item) end

---ensureItemIsVisible
---@param item CEGUI.ListboxItem
 function CEGUI.MultiColumnList:ensureItemIsVisible(item) end

---ensureItemIsVisible
---@param grid_ref CEGUI.MCLGridRef
 function CEGUI.MultiColumnList:ensureItemIsVisible(grid_ref) end

---setAutoSizeColumnUsesHeader
---@param include_header boolean
 function CEGUI.MultiColumnList:setAutoSizeColumnUsesHeader(include_header) end

---getAutoSizeColumnUsesHeader
---@return boolean
 function CEGUI.MultiColumnList:getAutoSizeColumnUsesHeader() end


---------------------------------------------------------------------------------
---ItemEntry
---@class CEGUI.ItemEntry : CEGUI.Window
 local ItemEntry = {}
 CEGUI.ItemEntry = ItemEntry
 CEGUI.ItemEntry = ItemEntry


---getItemPixelSize
---@return CEGUI.Size_float_
 function CEGUI.ItemEntry:getItemPixelSize() end

---getOwnerList
---@return CEGUI.ItemListBase
 function CEGUI.ItemEntry:getOwnerList() end

---isSelected
---@return boolean
 function CEGUI.ItemEntry:isSelected() end

---isSelectable
---@return boolean
 function CEGUI.ItemEntry:isSelectable() end

---setSelected
---@param setting boolean
 function CEGUI.ItemEntry:setSelected(setting) end

---select
 function CEGUI.ItemEntry:select() end

---deselect
 function CEGUI.ItemEntry:deselect() end

---setSelectable
---@param setting boolean
 function CEGUI.ItemEntry:setSelectable(setting) end


---------------------------------------------------------------------------------
---ItemListBase
---@class CEGUI.ItemListBase : CEGUI.Window
 local ItemListBase = {}
 CEGUI.ItemListBase = ItemListBase
 CEGUI.ItemListBase = ItemListBase


 CEGUI.ItemListBase.Ascending = 1
 CEGUI.ItemListBase.Descending = 2
 CEGUI.ItemListBase.UserSort = 3
---getItemCount
---@return number
 function CEGUI.ItemListBase:getItemCount() end

---getItemFromIndex
---@param index number
---@return CEGUI.ItemEntry
 function CEGUI.ItemListBase:getItemFromIndex(index) end

---getItemIndex
---@param item CEGUI.ItemEntry
---@return number
 function CEGUI.ItemListBase:getItemIndex(item) end

---findItemWithText
---@param text string
---@param start_item CEGUI.ItemEntry
---@return CEGUI.ItemEntry
 function CEGUI.ItemListBase:findItemWithText(text, start_item) end

---isItemInList
---@param item CEGUI.ItemEntry
---@return boolean
 function CEGUI.ItemListBase:isItemInList(item) end

---isAutoResizeEnabled
---@return boolean
 function CEGUI.ItemListBase:isAutoResizeEnabled() end

---isSortEnabled
---@return boolean
 function CEGUI.ItemListBase:isSortEnabled() end

---getSortMode
---@return CEGUI.ItemListBase.SortMode
 function CEGUI.ItemListBase:getSortMode() end

---getItemRenderArea
---@return CEGUI.Rect_float_
 function CEGUI.ItemListBase:getItemRenderArea() end

---getContentPane
---@return CEGUI.Window
 function CEGUI.ItemListBase:getContentPane() end

---resetList
 function CEGUI.ItemListBase:resetList() end

---addItem
---@param item CEGUI.ItemEntry
 function CEGUI.ItemListBase:addItem(item) end

---insertItem
---@param item CEGUI.ItemEntry
---@param position CEGUI.ItemEntry
 function CEGUI.ItemListBase:insertItem(item, position) end

---removeItem
---@param item CEGUI.ItemEntry
 function CEGUI.ItemListBase:removeItem(item) end

---handleUpdatedItemData
 function CEGUI.ItemListBase:handleUpdatedItemData() end

---setAutoResizeEnabled
---@param setting boolean
 function CEGUI.ItemListBase:setAutoResizeEnabled(setting) end

---sizeToContent
 function CEGUI.ItemListBase:sizeToContent() end

---setSortEnabled
---@param setting boolean
 function CEGUI.ItemListBase:setSortEnabled(setting) end

---setSortMode
---@param mode CEGUI.ItemListBase.SortMode
 function CEGUI.ItemListBase:setSortMode(mode) end

---sortList
 function CEGUI.ItemListBase:sortList() end


---------------------------------------------------------------------------------
---MenuBase
---@class CEGUI.MenuBase : CEGUI.ItemListBase
 local MenuBase = {}
 CEGUI.MenuBase = MenuBase
 CEGUI.MenuBase = MenuBase


---getItemSpacing
---@return number
 function CEGUI.MenuBase:getItemSpacing() end

---isMultiplePopupsAllowed
---@return boolean
 function CEGUI.MenuBase:isMultiplePopupsAllowed() end

---getPopupMenuItem
---@return CEGUI.MenuItem
 function CEGUI.MenuBase:getPopupMenuItem() end

---setItemSpacing
---@param spacing number
 function CEGUI.MenuBase:setItemSpacing(spacing) end

---changePopupMenuItem
---@param item CEGUI.MenuItem
 function CEGUI.MenuBase:changePopupMenuItem(item) end

---setAllowMultiplePopups
---@param setting boolean
 function CEGUI.MenuBase:setAllowMultiplePopups(setting) end

---getAutoCloseNestedPopups
---@return boolean
 function CEGUI.MenuBase:getAutoCloseNestedPopups() end

---getPopupMenuItem
---@return CEGUI.MenuItem
 function CEGUI.MenuBase:getPopupMenuItem() end


---------------------------------------------------------------------------------
---Menubar
---@class CEGUI.Menubar : CEGUI.MenuBase
 local Menubar = {}
 CEGUI.Menubar = Menubar
 CEGUI.Menubar = Menubar



---------------------------------------------------------------------------------
---PopupMenu
---@class CEGUI.PopupMenu : CEGUI.MenuBase
 local PopupMenu = {}
 CEGUI.PopupMenu = PopupMenu
 CEGUI.PopupMenu = PopupMenu


---getFadeInTime
---@return number
 function CEGUI.PopupMenu:getFadeInTime() end

---getFadeOutTime
---@return number
 function CEGUI.PopupMenu:getFadeOutTime() end

---setFadeInTime
---@param fadetime number
 function CEGUI.PopupMenu:setFadeInTime(fadetime) end

---setFadeOutTime
---@param fadetime number
 function CEGUI.PopupMenu:setFadeOutTime(fadetime) end

---openPopupMenu
 function CEGUI.PopupMenu:openPopupMenu() end

---closePopupMenu
 function CEGUI.PopupMenu:closePopupMenu() end


---------------------------------------------------------------------------------
---MenuItem
---@class CEGUI.MenuItem : CEGUI.ItemEntry
 local MenuItem = {}
 CEGUI.MenuItem = MenuItem
 CEGUI.MenuItem = MenuItem


---isHovering
---@return boolean
 function CEGUI.MenuItem:isHovering() end

---isPushed
---@return boolean
 function CEGUI.MenuItem:isPushed() end

---getPopupMenu
---@return CEGUI.PopupMenu
 function CEGUI.MenuItem:getPopupMenu() end

---setPopupMenu
---@param popup CEGUI.PopupMenu
 function CEGUI.MenuItem:setPopupMenu(popup) end

---openPopupMenu
 function CEGUI.MenuItem:openPopupMenu() end

---closePopupMenu
---@param notify boolean
 function CEGUI.MenuItem:closePopupMenu(notify) end

---togglePopupMenu
---@return boolean
 function CEGUI.MenuItem:togglePopupMenu() end

---hasAutoPopup
---@return boolean
 function CEGUI.MenuItem:hasAutoPopup() end

---getAutoPopupTimeout
---@return number
 function CEGUI.MenuItem:getAutoPopupTimeout() end

---setAutoPopupTimeout
---@param time number
 function CEGUI.MenuItem:setAutoPopupTimeout(time) end

---getPopupOffset
---@return CEGUI.UVector2
 function CEGUI.MenuItem:getPopupOffset() end

---setPopupOffset
---@param popupOffset CEGUI.UVector2
 function CEGUI.MenuItem:setPopupOffset(popupOffset) end


---------------------------------------------------------------------------------
---ScrolledItemListBase
---@class CEGUI.ScrolledItemListBase : CEGUI.ItemListBase
 local ScrolledItemListBase = {}
 CEGUI.ScrolledItemListBase = ScrolledItemListBase
 CEGUI.ScrolledItemListBase = ScrolledItemListBase


---isVertScrollbarAlwaysShown
---@return boolean
 function CEGUI.ScrolledItemListBase:isVertScrollbarAlwaysShown() end

---isHorzScrollbarAlwaysShown
---@return boolean
 function CEGUI.ScrolledItemListBase:isHorzScrollbarAlwaysShown() end

---getVertScrollbar
---@return CEGUI.Scrollbar
 function CEGUI.ScrolledItemListBase:getVertScrollbar() end

---getHorzScrollbar
---@return CEGUI.Scrollbar
 function CEGUI.ScrolledItemListBase:getHorzScrollbar() end

---setShowVertScrollbar
---@param mode boolean
 function CEGUI.ScrolledItemListBase:setShowVertScrollbar(mode) end

---setShowHorzScrollbar
---@param mode boolean
 function CEGUI.ScrolledItemListBase:setShowHorzScrollbar(mode) end


---------------------------------------------------------------------------------
---ItemListbox
---@class CEGUI.ItemListbox : CEGUI.ScrolledItemListBase
 local ItemListbox = {}
 CEGUI.ItemListbox = ItemListbox
 CEGUI.ItemListbox = ItemListbox


---getSelectedCount
---@return number
 function CEGUI.ItemListbox:getSelectedCount() end

---getLastSelectedItem
---@return CEGUI.ItemEntry
 function CEGUI.ItemListbox:getLastSelectedItem() end

---getFirstSelectedItem
---@param start_index number
---@return CEGUI.ItemEntry
 function CEGUI.ItemListbox:getFirstSelectedItem(start_index) end

---getNextSelectedItem
---@return CEGUI.ItemEntry
 function CEGUI.ItemListbox:getNextSelectedItem() end

---getNextSelectedItemAfter
---@param start_item CEGUI.ItemEntry
---@return CEGUI.ItemEntry
 function CEGUI.ItemListbox:getNextSelectedItemAfter(start_item) end

---isMultiSelectEnabled
---@return boolean
 function CEGUI.ItemListbox:isMultiSelectEnabled() end

---isItemSelected
---@param index number
---@return boolean
 function CEGUI.ItemListbox:isItemSelected(index) end

---setMultiSelectEnabled
---@param state boolean
 function CEGUI.ItemListbox:setMultiSelectEnabled(state) end

---clearAllSelections
 function CEGUI.ItemListbox:clearAllSelections() end

---selectRange
---@param a number
---@param z number
 function CEGUI.ItemListbox:selectRange(a, z) end

---selectAllItems
 function CEGUI.ItemListbox:selectAllItems() end


---------------------------------------------------------------------------------
---GroupBox
---@class CEGUI.GroupBox : CEGUI.Window
 local GroupBox = {}
 CEGUI.GroupBox = GroupBox
 CEGUI.GroupBox = GroupBox


---drawAroundWidget
---@param name string
---@return boolean
 function CEGUI.GroupBox:drawAroundWidget(name) end


---------------------------------------------------------------------------------
---LayoutContainer
---@class CEGUI.LayoutContainer : CEGUI.Window
 local LayoutContainer = {}
 CEGUI.LayoutContainer = LayoutContainer
 CEGUI.LayoutContainer = LayoutContainer


---markNeedsLayouting
 function CEGUI.LayoutContainer:markNeedsLayouting() end

---needsLayouting
---@return boolean
 function CEGUI.LayoutContainer:needsLayouting() end

---layout
 function CEGUI.LayoutContainer:layout() end

---layoutIfNecessary
 function CEGUI.LayoutContainer:layoutIfNecessary() end


---------------------------------------------------------------------------------
---SequentialLayoutContainer
---@class CEGUI.SequentialLayoutContainer : CEGUI.LayoutContainer
 local SequentialLayoutContainer = {}
 CEGUI.SequentialLayoutContainer = SequentialLayoutContainer
 CEGUI.SequentialLayoutContainer = SequentialLayoutContainer


---getPositionOfChild
---@param wnd CEGUI.Window
---@return number
 function CEGUI.SequentialLayoutContainer:getPositionOfChild(wnd) end

---getPositionOfChild
---@param wnd string
---@return number
 function CEGUI.SequentialLayoutContainer:getPositionOfChild(wnd) end

---getChildAtPosition
---@param position number
---@return CEGUI.Window
 function CEGUI.SequentialLayoutContainer:getChildAtPosition(position) end

---swapChildPositions
---@param wnd1 number
---@param wnd2 number
 function CEGUI.SequentialLayoutContainer:swapChildPositions(wnd1, wnd2) end

---swapChildren
---@param wnd1 CEGUI.Window
---@param wnd2 CEGUI.Window
 function CEGUI.SequentialLayoutContainer:swapChildren(wnd1, wnd2) end

---swapChildren
---@param wnd1 string
---@param wnd2 CEGUI.Window
 function CEGUI.SequentialLayoutContainer:swapChildren(wnd1, wnd2) end

---swapChildren
---@param wnd1 CEGUI.Window
---@param wnd2 string
 function CEGUI.SequentialLayoutContainer:swapChildren(wnd1, wnd2) end

---swapChildren
---@param wnd1 string
---@param wnd2 string
 function CEGUI.SequentialLayoutContainer:swapChildren(wnd1, wnd2) end

---moveChildToPosition
---@param wnd CEGUI.Window
---@param position number
 function CEGUI.SequentialLayoutContainer:moveChildToPosition(wnd, position) end

---moveChildToPosition
---@param wnd string
---@param position number
 function CEGUI.SequentialLayoutContainer:moveChildToPosition(wnd, position) end

---moveChild
---@param window CEGUI.Window
---@param delta number
 function CEGUI.SequentialLayoutContainer:moveChild(window, delta) end

---addChildToPosition
---@param window CEGUI.Window
---@param position number
 function CEGUI.SequentialLayoutContainer:addChildToPosition(window, position) end

---removeChildFromPosition
---@param position number
 function CEGUI.SequentialLayoutContainer:removeChildFromPosition(position) end


---------------------------------------------------------------------------------
---HorizontalLayoutContainer
---@class CEGUI.HorizontalLayoutContainer : CEGUI.SequentialLayoutContainer
 local HorizontalLayoutContainer = {}
 CEGUI.HorizontalLayoutContainer = HorizontalLayoutContainer
 CEGUI.HorizontalLayoutContainer = HorizontalLayoutContainer



---------------------------------------------------------------------------------
---VerticalLayoutContainer
---@class CEGUI.VerticalLayoutContainer : CEGUI.SequentialLayoutContainer
 local VerticalLayoutContainer = {}
 CEGUI.VerticalLayoutContainer = VerticalLayoutContainer
 CEGUI.VerticalLayoutContainer = VerticalLayoutContainer



---------------------------------------------------------------------------------
---GridLayoutContainer
---@class CEGUI.GridLayoutContainer : CEGUI.LayoutContainer
 local GridLayoutContainer = {}
 CEGUI.GridLayoutContainer = GridLayoutContainer
 CEGUI.GridLayoutContainer = GridLayoutContainer


 CEGUI.GridLayoutContainer.AP_Disabled = 1
 CEGUI.GridLayoutContainer.AP_LeftToRight = 2
 CEGUI.GridLayoutContainer.AP_TopToBottom = 3
---setGridDimensions
---@param width number
---@param height number
 function CEGUI.GridLayoutContainer:setGridDimensions(width, height) end

---getGridWidth
---@return number
 function CEGUI.GridLayoutContainer:getGridWidth() end

---getGridHeight
---@return number
 function CEGUI.GridLayoutContainer:getGridHeight() end

---setAutoPositioning
---@param positioning CEGUI.GridLayoutContainer.AutoPositioning
 function CEGUI.GridLayoutContainer:setAutoPositioning(positioning) end

---getAutoPositioning
---@return CEGUI.GridLayoutContainer.AutoPositioning
 function CEGUI.GridLayoutContainer:getAutoPositioning() end

---setNextAutoPositioningIdx
---@param idx number
 function CEGUI.GridLayoutContainer:setNextAutoPositioningIdx(idx) end

---getNextAutoPositioningIdx
---@return number
 function CEGUI.GridLayoutContainer:getNextAutoPositioningIdx() end

---autoPositioningSkipCells
---@param cells number
 function CEGUI.GridLayoutContainer:autoPositioningSkipCells(cells) end

---addChildToPosition
---@param window CEGUI.Window
---@param gridX number
---@param gridY number
 function CEGUI.GridLayoutContainer:addChildToPosition(window, gridX, gridY) end

---getChildAtPosition
---@param gridX number
---@param gridY number
---@return CEGUI.Window
 function CEGUI.GridLayoutContainer:getChildAtPosition(gridX, gridY) end

---removeChildFromPosition
---@param gridX number
---@param gridY number
 function CEGUI.GridLayoutContainer:removeChildFromPosition(gridX, gridY) end

---swapChildPositions
---@param wnd1 number
---@param wnd2 number
 function CEGUI.GridLayoutContainer:swapChildPositions(wnd1, wnd2) end

---swapChildPositions
---@param gridX1 number
---@param gridY1 number
---@param gridX2 number
---@param gridY2 number
 function CEGUI.GridLayoutContainer:swapChildPositions(gridX1, gridY1, gridX2, gridY2) end

---swapChildren
---@param wnd1 CEGUI.Window
---@param wnd2 CEGUI.Window
 function CEGUI.GridLayoutContainer:swapChildren(wnd1, wnd2) end

---swapChildren
---@param wnd1 CEGUI.Window
---@param wnd2 string
 function CEGUI.GridLayoutContainer:swapChildren(wnd1, wnd2) end

---swapChildren
---@param wnd1 string
---@param wnd2 CEGUI.Window
 function CEGUI.GridLayoutContainer:swapChildren(wnd1, wnd2) end

---moveChildToPosition
---@param wnd CEGUI.Window
---@param gridX number
---@param gridY number
 function CEGUI.GridLayoutContainer:moveChildToPosition(wnd, gridX, gridY) end

---moveChildToPosition
---@param wnd string
---@param gridX number
---@param gridY number
 function CEGUI.GridLayoutContainer:moveChildToPosition(wnd, gridX, gridY) end


 CEGUI.DT_LEFT_EDGE = 1
 CEGUI.DT_X_POSITION = 2
 CEGUI.DT_TOP_EDGE = 3
 CEGUI.DT_Y_POSITION = 4
 CEGUI.DT_RIGHT_EDGE = 5
 CEGUI.DT_BOTTOM_EDGE = 6
 CEGUI.DT_WIDTH = 7
 CEGUI.DT_HEIGHT = 8
 CEGUI.DT_X_OFFSET = 9
 CEGUI.DT_Y_OFFSET = 10
 CEGUI.DT_INVALID = 11
 CEGUI.VF_TOP_ALIGNED = 1
 CEGUI.VF_CENTRE_ALIGNED = 2
 CEGUI.VF_BOTTOM_ALIGNED = 3
 CEGUI.VF_STRETCHED = 4
 CEGUI.VF_TILED = 5
 CEGUI.HF_LEFT_ALIGNED = 1
 CEGUI.HF_CENTRE_ALIGNED = 2
 CEGUI.HF_RIGHT_ALIGNED = 3
 CEGUI.HF_STRETCHED = 4
 CEGUI.HF_TILED = 5
 CEGUI.VTF_TOP_ALIGNED = 1
 CEGUI.VTF_CENTRE_ALIGNED = 2
 CEGUI.VTF_BOTTOM_ALIGNED = 3
 CEGUI.HTF_LEFT_ALIGNED = 1
 CEGUI.HTF_RIGHT_ALIGNED = 2
 CEGUI.HTF_CENTRE_ALIGNED = 3
 CEGUI.HTF_JUSTIFIED = 4
 CEGUI.HTF_WORDWRAP_LEFT_ALIGNED = 5
 CEGUI.HTF_WORDWRAP_RIGHT_ALIGNED = 6
 CEGUI.HTF_WORDWRAP_CENTRE_ALIGNED = 7
 CEGUI.HTF_WORDWRAP_JUSTIFIED = 8
 CEGUI.FMT_LINE_SPACING = 1
 CEGUI.FMT_BASELINE = 2
 CEGUI.FMT_HORZ_EXTENT = 3
 CEGUI.DOP_NOOP = 1
 CEGUI.DOP_ADD = 2
 CEGUI.DOP_SUBTRACT = 3
 CEGUI.DOP_MULTIPLY = 4
 CEGUI.DOP_DIVIDE = 5
 CEGUI.FIC_BACKGROUND = 1
 CEGUI.FIC_TOP_LEFT_CORNER = 2
 CEGUI.FIC_TOP_RIGHT_CORNER = 3
 CEGUI.FIC_BOTTOM_LEFT_CORNER = 4
 CEGUI.FIC_BOTTOM_RIGHT_CORNER = 5
 CEGUI.FIC_LEFT_EDGE = 6
 CEGUI.FIC_RIGHT_EDGE = 7
 CEGUI.FIC_TOP_EDGE = 8
 CEGUI.FIC_BOTTOM_EDGE = 9
 CEGUI.FIC_FRAME_IMAGE_COUNT = 10
---------------------------------------------------------------------------------
---BaseDim
---@class CEGUI.BaseDim
 local BaseDim = {}
 CEGUI.BaseDim = BaseDim
 CEGUI.BaseDim = BaseDim


---getValue
---@param wnd CEGUI.Window
---@return number
 function CEGUI.BaseDim:getValue(wnd) end

---getValue
---@param wnd CEGUI.Window
---@param container CEGUI.Rect_float_
---@return number
 function CEGUI.BaseDim:getValue(wnd, container) end

---clone
---@return CEGUI.BaseDim
 function CEGUI.BaseDim:clone() end


---------------------------------------------------------------------------------
---OperatorDim
---@class CEGUI.OperatorDim : CEGUI.BaseDim
 local OperatorDim = {}
 CEGUI.OperatorDim = OperatorDim
 CEGUI.OperatorDim = OperatorDim


---new
---@return CEGUI.OperatorDim
 function CEGUI.OperatorDim:new() end

---
-- new_local 
-- @function [parent=#CEGUI.OperatorDim] new_local
-- @param self
-- @return #CEGUI.OperatorDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.OperatorDim
-- @param self
-- @return #CEGUI.OperatorDim

---new
---@param op CEGUI.DimensionOperator
---@return CEGUI.OperatorDim
 function CEGUI.OperatorDim:new(op) end

---
-- new_local 
-- @function [parent=#CEGUI.OperatorDim] new_local
-- @param self
-- @param #CEGUI.DimensionOperator op
-- @return #CEGUI.OperatorDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.OperatorDim
-- @param self
-- @return #CEGUI.OperatorDim

---new
---@param op CEGUI.DimensionOperator
---@param left CEGUI.BaseDim
---@param right CEGUI.BaseDim
---@return CEGUI.OperatorDim
 function CEGUI.OperatorDim:new(op, left, right) end

---
-- new_local 
-- @function [parent=#CEGUI.OperatorDim] new_local
-- @param self
-- @param #CEGUI.DimensionOperator op
-- @param #CEGUI.BaseDim left
-- @param #CEGUI.BaseDim right
-- @return #CEGUI.OperatorDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.OperatorDim
-- @param self
-- @return #CEGUI.OperatorDim

---setLeftOperand
---@param operand CEGUI.BaseDim
 function CEGUI.OperatorDim:setLeftOperand(operand) end

---getLeftOperand
---@return CEGUI.BaseDim
 function CEGUI.OperatorDim:getLeftOperand() end

---setRightOperand
---@param operand CEGUI.BaseDim
 function CEGUI.OperatorDim:setRightOperand(operand) end

---getRightOperand
---@return CEGUI.BaseDim
 function CEGUI.OperatorDim:getRightOperand() end

---setOperator
---@param op CEGUI.DimensionOperator
 function CEGUI.OperatorDim:setOperator(op) end

---getOperator
---@return CEGUI.DimensionOperator
 function CEGUI.OperatorDim:getOperator() end

---setNextOperand
---@param operand CEGUI.BaseDim
 function CEGUI.OperatorDim:setNextOperand(operand) end


---------------------------------------------------------------------------------
---AbsoluteDim
---@class CEGUI.AbsoluteDim : CEGUI.BaseDim
 local AbsoluteDim = {}
 CEGUI.AbsoluteDim = AbsoluteDim
 CEGUI.AbsoluteDim = AbsoluteDim


---setBaseValue
---@param val number
 function CEGUI.AbsoluteDim:setBaseValue(val) end

---getBaseValue
---@return number
 function CEGUI.AbsoluteDim:getBaseValue() end

---new
---@param val number
---@return CEGUI.AbsoluteDim
 function CEGUI.AbsoluteDim:new(val) end

---
-- new_local 
-- @function [parent=#CEGUI.AbsoluteDim] new_local
-- @param self
-- @param #number val
-- @return #CEGUI.AbsoluteDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.AbsoluteDim
-- @param self
-- @return #CEGUI.AbsoluteDim


---------------------------------------------------------------------------------
---ImageDimBase
---@class CEGUI.ImageDimBase : CEGUI.BaseDim
 local ImageDimBase = {}
 CEGUI.ImageDimBase = ImageDimBase
 CEGUI.ImageDimBase = ImageDimBase


---setSourceDimension
---@param dim CEGUI.DimensionType
 function CEGUI.ImageDimBase:setSourceDimension(dim) end

---getSourceDimension
---@return CEGUI.DimensionType
 function CEGUI.ImageDimBase:getSourceDimension() end


---------------------------------------------------------------------------------
---ImageDim
---@class CEGUI.ImageDim : CEGUI.ImageDimBase
 local ImageDim = {}
 CEGUI.ImageDim = ImageDim
 CEGUI.ImageDim = ImageDim


---setSourceImage
---@param name string
 function CEGUI.ImageDim:setSourceImage(name) end

---getSourceImage
---@return string
 function CEGUI.ImageDim:getSourceImage() end

---new
---@param image_name string
---@param dim CEGUI.DimensionType
---@return CEGUI.ImageDim
 function CEGUI.ImageDim:new(image_name, dim) end

---
-- new_local 
-- @function [parent=#CEGUI.ImageDim] new_local
-- @param self
-- @param #string image_name
-- @param #CEGUI.DimensionType dim
-- @return #CEGUI.ImageDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ImageDim
-- @param self
-- @return #CEGUI.ImageDim


---------------------------------------------------------------------------------
---ImagePropertyDim
---@class CEGUI.ImagePropertyDim : CEGUI.ImageDimBase
 local ImagePropertyDim = {}
 CEGUI.ImagePropertyDim = ImagePropertyDim
 CEGUI.ImagePropertyDim = ImagePropertyDim


---setSourceProperty
---@param name string
 function CEGUI.ImagePropertyDim:setSourceProperty(name) end

---getSourceProperty
---@return string
 function CEGUI.ImagePropertyDim:getSourceProperty() end

---new
---@param property_name string
---@param dim CEGUI.DimensionType
---@return CEGUI.ImagePropertyDim
 function CEGUI.ImagePropertyDim:new(property_name, dim) end

---
-- new_local 
-- @function [parent=#CEGUI.ImagePropertyDim] new_local
-- @param self
-- @param #string property_name
-- @param #CEGUI.DimensionType dim
-- @return #CEGUI.ImagePropertyDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ImagePropertyDim
-- @param self
-- @return #CEGUI.ImagePropertyDim


---------------------------------------------------------------------------------
---WidgetDim
---@class CEGUI.WidgetDim : CEGUI.BaseDim
 local WidgetDim = {}
 CEGUI.WidgetDim = WidgetDim
 CEGUI.WidgetDim = WidgetDim


---setWidgetName
---@param name string
 function CEGUI.WidgetDim:setWidgetName(name) end

---getWidgetName
---@return string
 function CEGUI.WidgetDim:getWidgetName() end

---setSourceDimension
---@param dim CEGUI.DimensionType
 function CEGUI.WidgetDim:setSourceDimension(dim) end

---getSourceDimension
---@return CEGUI.DimensionType
 function CEGUI.WidgetDim:getSourceDimension() end

---new
---@param name string
---@param dim CEGUI.DimensionType
---@return CEGUI.WidgetDim
 function CEGUI.WidgetDim:new(name, dim) end

---
-- new_local 
-- @function [parent=#CEGUI.WidgetDim] new_local
-- @param self
-- @param #string name
-- @param #CEGUI.DimensionType dim
-- @return #CEGUI.WidgetDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.WidgetDim
-- @param self
-- @return #CEGUI.WidgetDim


---------------------------------------------------------------------------------
---UnifiedDim
---@class CEGUI.UnifiedDim : CEGUI.BaseDim
 local UnifiedDim = {}
 CEGUI.UnifiedDim = UnifiedDim
 CEGUI.UnifiedDim = UnifiedDim


---getBaseValue
---@return CEGUI.UDim
 function CEGUI.UnifiedDim:getBaseValue() end

---setBaseValue
---@param val CEGUI.UDim
 function CEGUI.UnifiedDim:setBaseValue(val) end

---getSourceDimension
---@return CEGUI.DimensionType
 function CEGUI.UnifiedDim:getSourceDimension() end

---setSourceDimension
---@param dim CEGUI.DimensionType
 function CEGUI.UnifiedDim:setSourceDimension(dim) end

---new
---@param value CEGUI.UDim
---@param dim CEGUI.DimensionType
---@return CEGUI.UnifiedDim
 function CEGUI.UnifiedDim:new(value, dim) end

---
-- new_local 
-- @function [parent=#CEGUI.UnifiedDim] new_local
-- @param self
-- @param #CEGUI.UDim value
-- @param #CEGUI.DimensionType dim
-- @return #CEGUI.UnifiedDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.UnifiedDim
-- @param self
-- @return #CEGUI.UnifiedDim


---------------------------------------------------------------------------------
---FontDim
---@class CEGUI.FontDim : CEGUI.BaseDim
 local FontDim = {}
 CEGUI.FontDim = FontDim
 CEGUI.FontDim = FontDim


---getName
---@return string
 function CEGUI.FontDim:getName() end

---setName
---@param name string
 function CEGUI.FontDim:setName(name) end

---getFont
---@return string
 function CEGUI.FontDim:getFont() end

---setFont
---@param font string
 function CEGUI.FontDim:setFont(font) end

---getText
---@return string
 function CEGUI.FontDim:getText() end

---setText
---@param text string
 function CEGUI.FontDim:setText(text) end

---getMetric
---@return CEGUI.FontMetricType
 function CEGUI.FontDim:getMetric() end

---setMetric
---@param metric CEGUI.FontMetricType
 function CEGUI.FontDim:setMetric(metric) end

---getPadding
---@return number
 function CEGUI.FontDim:getPadding() end

---setPadding
---@param padding number
 function CEGUI.FontDim:setPadding(padding) end

---new
---@param name string
---@param font string
---@param text string
---@param metric CEGUI.FontMetricType
---@param padding number
---@return CEGUI.FontDim
 function CEGUI.FontDim:new(name, font, text, metric, padding) end

---
-- new_local 
-- @function [parent=#CEGUI.FontDim] new_local
-- @param self
-- @param #string name
-- @param #string font
-- @param #string text
-- @param #CEGUI.FontMetricType metric
-- @param #number padding
-- @return #CEGUI.FontDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.FontDim
-- @param self
-- @return #CEGUI.FontDim


---------------------------------------------------------------------------------
---PropertyDim
---@class CEGUI.PropertyDim : CEGUI.BaseDim
 local PropertyDim = {}
 CEGUI.PropertyDim = PropertyDim
 CEGUI.PropertyDim = PropertyDim


---getWidgetName
---@return string
 function CEGUI.PropertyDim:getWidgetName() end

---setWidgetName
---@param name string
 function CEGUI.PropertyDim:setWidgetName(name) end

---getPropertyName
---@return string
 function CEGUI.PropertyDim:getPropertyName() end

---setPropertyName
---@param property string
 function CEGUI.PropertyDim:setPropertyName(property) end

---getSourceDimension
---@return CEGUI.DimensionType
 function CEGUI.PropertyDim:getSourceDimension() end

---setSourceDimension
---@param dim CEGUI.DimensionType
 function CEGUI.PropertyDim:setSourceDimension(dim) end

---new
---@param name string
---@param property string
---@param type CEGUI.DimensionType
---@return CEGUI.PropertyDim
 function CEGUI.PropertyDim:new(name, property, type) end

---
-- new_local 
-- @function [parent=#CEGUI.PropertyDim] new_local
-- @param self
-- @param #string name
-- @param #string property
-- @param #CEGUI.DimensionType type
-- @return #CEGUI.PropertyDim

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.PropertyDim
-- @param self
-- @return #CEGUI.PropertyDim


---------------------------------------------------------------------------------
---Dimension
---@class CEGUI.Dimension
 local Dimension = {}
 CEGUI.Dimension = Dimension
 CEGUI.Dimension = Dimension


---getBaseDimension
---@return CEGUI.BaseDim
 function CEGUI.Dimension:getBaseDimension() end

---setBaseDimension
---@param dim CEGUI.BaseDim
 function CEGUI.Dimension:setBaseDimension(dim) end

---getDimensionType
---@return CEGUI.DimensionType
 function CEGUI.Dimension:getDimensionType() end

---setDimensionType
---@param type CEGUI.DimensionType
 function CEGUI.Dimension:setDimensionType(type) end

---new
---@param dim CEGUI.BaseDim
---@param type CEGUI.DimensionType
---@return CEGUI.Dimension
 function CEGUI.Dimension:new(dim, type) end

---
-- new_local 
-- @function [parent=#CEGUI.Dimension] new_local
-- @param self
-- @param #CEGUI.BaseDim dim
-- @param #CEGUI.DimensionType type
-- @return #CEGUI.Dimension

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Dimension
-- @param self
-- @return #CEGUI.Dimension

---new
---@param other CEGUI.Dimension
---@return CEGUI.Dimension
 function CEGUI.Dimension:new(other) end

---
-- new_local 
-- @function [parent=#CEGUI.Dimension] new_local
-- @param self
-- @param #CEGUI.Dimension other
-- @return #CEGUI.Dimension

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Dimension
-- @param self
-- @return #CEGUI.Dimension

---new
---@return CEGUI.Dimension
 function CEGUI.Dimension:new() end

---
-- new_local 
-- @function [parent=#CEGUI.Dimension] new_local
-- @param self
-- @return #CEGUI.Dimension

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.Dimension
-- @param self
-- @return #CEGUI.Dimension


---------------------------------------------------------------------------------
---ComponentArea
---@class CEGUI.ComponentArea
 local ComponentArea = {}
 CEGUI.ComponentArea = ComponentArea
 CEGUI.ComponentArea = ComponentArea


---getPixelRect
---@param wnd CEGUI.Window
---@return CEGUI.Rect_float_
 function CEGUI.ComponentArea:getPixelRect(wnd) end

---getPixelRect
---@param wnd CEGUI.Window
---@param container CEGUI.Rect_float_
---@return CEGUI.Rect_float_
 function CEGUI.ComponentArea:getPixelRect(wnd, container) end

---isAreaFetchedFromProperty
---@return boolean
 function CEGUI.ComponentArea:isAreaFetchedFromProperty() end

---getAreaPropertySource
---@return string
 function CEGUI.ComponentArea:getAreaPropertySource() end

---setAreaPropertySource
---@param property string
 function CEGUI.ComponentArea:setAreaPropertySource(property) end

---setNamedAreaSouce
---@param widget_look string
---@param area_name string
 function CEGUI.ComponentArea:setNamedAreaSouce(widget_look, area_name) end

---isAreaFetchedFromNamedArea
---@return boolean
 function CEGUI.ComponentArea:isAreaFetchedFromNamedArea() end

---
-- @field [parent=#CEGUI.ComponentArea] #CEGUI.Dimension d_left

---
-- @field [parent=#CEGUI.ComponentArea] #CEGUI.Dimension d_top

---
-- @field [parent=#CEGUI.ComponentArea] #CEGUI.Dimension d_right_or_width

---
-- @field [parent=#CEGUI.ComponentArea] #CEGUI.Dimension d_bottom_or_height

---new
---@return CEGUI.ComponentArea
 function CEGUI.ComponentArea:new() end

---
-- new_local 
-- @function [parent=#CEGUI.ComponentArea] new_local
-- @param self
-- @return #CEGUI.ComponentArea

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ComponentArea
-- @param self
-- @return #CEGUI.ComponentArea


---------------------------------------------------------------------------------
---NamedArea
---@class CEGUI.NamedArea
 local NamedArea = {}
 CEGUI.NamedArea = NamedArea
 CEGUI.NamedArea = NamedArea


---getName
---@return string
 function CEGUI.NamedArea:getName() end

---getArea
---@return CEGUI.ComponentArea
 function CEGUI.NamedArea:getArea() end

---setArea
---@param area CEGUI.ComponentArea
 function CEGUI.NamedArea:setArea(area) end

---new
---@return CEGUI.NamedArea
 function CEGUI.NamedArea:new() end

---
-- new_local 
-- @function [parent=#CEGUI.NamedArea] new_local
-- @param self
-- @return #CEGUI.NamedArea

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.NamedArea
-- @param self
-- @return #CEGUI.NamedArea

---new
---@param name string
---@return CEGUI.NamedArea
 function CEGUI.NamedArea:new(name) end

---
-- new_local 
-- @function [parent=#CEGUI.NamedArea] new_local
-- @param self
-- @param #string name
-- @return #CEGUI.NamedArea

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.NamedArea
-- @param self
-- @return #CEGUI.NamedArea


---------------------------------------------------------------------------------
---PropertyInitialiser
---@class CEGUI.PropertyInitialiser
 local PropertyInitialiser = {}
 CEGUI.PropertyInitialiser = PropertyInitialiser
 CEGUI.PropertyInitialiser = PropertyInitialiser


---apply
---@param target CEGUI.Window
 function CEGUI.PropertyInitialiser:apply(target) end

---getTargetPropertyName
---@return string
 function CEGUI.PropertyInitialiser:getTargetPropertyName() end

---getInitialiserValue
---@return string
 function CEGUI.PropertyInitialiser:getInitialiserValue() end

---new
---@param property string
---@param value string
---@return CEGUI.PropertyInitialiser
 function CEGUI.PropertyInitialiser:new(property, value) end

---
-- new_local 
-- @function [parent=#CEGUI.PropertyInitialiser] new_local
-- @param self
-- @param #string property
-- @param #string value
-- @return #CEGUI.PropertyInitialiser

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.PropertyInitialiser
-- @param self
-- @return #CEGUI.PropertyInitialiser


---------------------------------------------------------------------------------
---FalagardComponentBase
---@class CEGUI.FalagardComponentBase
 local FalagardComponentBase = {}
 CEGUI.FalagardComponentBase = FalagardComponentBase
 CEGUI.FalagardComponentBase = FalagardComponentBase


---render
---@param srcWindow CEGUI.Window
---@param modColours CEGUI.ColourRect
---@param clipper CEGUI.Rect_float_
---@param clipToDisplay boolean
 function CEGUI.FalagardComponentBase:render(srcWindow, modColours, clipper, clipToDisplay) end

---render
---@param srcWindow CEGUI.Window
---@param baseRect CEGUI.Rect_float_
---@param modColours CEGUI.ColourRect
---@param clipper CEGUI.Rect_float_
---@param clipToDisplay boolean
 function CEGUI.FalagardComponentBase:render(srcWindow, baseRect, modColours, clipper, clipToDisplay) end

---getComponentArea
---@return CEGUI.ComponentArea
 function CEGUI.FalagardComponentBase:getComponentArea() end

---setComponentArea
---@param area CEGUI.ComponentArea
 function CEGUI.FalagardComponentBase:setComponentArea(area) end

---getColours
---@return CEGUI.ColourRect
 function CEGUI.FalagardComponentBase:getColours() end

---setColours
---@param cols CEGUI.ColourRect
 function CEGUI.FalagardComponentBase:setColours(cols) end

---setColoursPropertySource
---@param property string
 function CEGUI.FalagardComponentBase:setColoursPropertySource(property) end


---------------------------------------------------------------------------------
---FrameComponent
---@class CEGUI.FrameComponent : CEGUI.FalagardComponentBase
 local FrameComponent = {}
 CEGUI.FrameComponent = FrameComponent
 CEGUI.FrameComponent = FrameComponent


---setLeftEdgeFormatting
---@param fmt CEGUI.VerticalFormatting
 function CEGUI.FrameComponent:setLeftEdgeFormatting(fmt) end

---setRightEdgeFormatting
---@param fmt CEGUI.VerticalFormatting
 function CEGUI.FrameComponent:setRightEdgeFormatting(fmt) end

---setTopEdgeFormatting
---@param fmt CEGUI.HorizontalFormatting
 function CEGUI.FrameComponent:setTopEdgeFormatting(fmt) end

---setBottomEdgeFormatting
---@param fmt CEGUI.HorizontalFormatting
 function CEGUI.FrameComponent:setBottomEdgeFormatting(fmt) end

---setBackgroundVerticalFormatting
---@param fmt CEGUI.VerticalFormatting
 function CEGUI.FrameComponent:setBackgroundVerticalFormatting(fmt) end

---setBackgroundHorizontalFormatting
---@param fmt CEGUI.HorizontalFormatting
 function CEGUI.FrameComponent:setBackgroundHorizontalFormatting(fmt) end

---setLeftEdgeFormattingPropertySource
---@param property_name string
 function CEGUI.FrameComponent:setLeftEdgeFormattingPropertySource(property_name) end

---setRightEdgeFormattingPropertySource
---@param property_name string
 function CEGUI.FrameComponent:setRightEdgeFormattingPropertySource(property_name) end

---setTopEdgeFormattingPropertySource
---@param property_name string
 function CEGUI.FrameComponent:setTopEdgeFormattingPropertySource(property_name) end

---setBottomEdgeFormattingPropertySource
---@param property_name string
 function CEGUI.FrameComponent:setBottomEdgeFormattingPropertySource(property_name) end

---setBackgroundVerticalFormattingPropertySource
---@param property_name string
 function CEGUI.FrameComponent:setBackgroundVerticalFormattingPropertySource(property_name) end

---setBackgroundHorizontalFormattingPropertySource
---@param property_name string
 function CEGUI.FrameComponent:setBackgroundHorizontalFormattingPropertySource(property_name) end

---getLeftEdgeFormatting
---@param wnd CEGUI.Window
---@return CEGUI.VerticalFormatting
 function CEGUI.FrameComponent:getLeftEdgeFormatting(wnd) end

---getRightEdgeFormatting
---@param wnd CEGUI.Window
---@return CEGUI.VerticalFormatting
 function CEGUI.FrameComponent:getRightEdgeFormatting(wnd) end

---getTopEdgeFormatting
---@param wnd CEGUI.Window
---@return CEGUI.HorizontalFormatting
 function CEGUI.FrameComponent:getTopEdgeFormatting(wnd) end

---getBottomEdgeFormatting
---@param wnd CEGUI.Window
---@return CEGUI.HorizontalFormatting
 function CEGUI.FrameComponent:getBottomEdgeFormatting(wnd) end

---getBackgroundVerticalFormatting
---@param wnd CEGUI.Window
---@return CEGUI.VerticalFormatting
 function CEGUI.FrameComponent:getBackgroundVerticalFormatting(wnd) end

---getBackgroundHorizontalFormatting
---@param wnd CEGUI.Window
---@return CEGUI.HorizontalFormatting
 function CEGUI.FrameComponent:getBackgroundHorizontalFormatting(wnd) end

---getImage
---@param part CEGUI.FrameImageComponent
---@param wnd CEGUI.Window
---@return CEGUI.Image
 function CEGUI.FrameComponent:getImage(part, wnd) end

---setImage
---@param part CEGUI.FrameImageComponent
---@param image CEGUI.Image
 function CEGUI.FrameComponent:setImage(part, image) end

---setImage
---@param part CEGUI.FrameImageComponent
---@param name string
 function CEGUI.FrameComponent:setImage(part, name) end

---setImagePropertySource
---@param part CEGUI.FrameImageComponent
---@param name string
 function CEGUI.FrameComponent:setImagePropertySource(part, name) end

---isImageSpecified
---@param part CEGUI.FrameImageComponent
---@return boolean
 function CEGUI.FrameComponent:isImageSpecified(part) end

---isImageFetchedFromProperty
---@param part CEGUI.FrameImageComponent
---@return boolean
 function CEGUI.FrameComponent:isImageFetchedFromProperty(part) end

---getImagePropertySource
---@param part CEGUI.FrameImageComponent
---@return string
 function CEGUI.FrameComponent:getImagePropertySource(part) end

---new
---@return CEGUI.FrameComponent
 function CEGUI.FrameComponent:new() end

---
-- new_local 
-- @function [parent=#CEGUI.FrameComponent] new_local
-- @param self
-- @return #CEGUI.FrameComponent

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.FrameComponent
-- @param self
-- @return #CEGUI.FrameComponent


---------------------------------------------------------------------------------
---ImageryComponent
---@class CEGUI.ImageryComponent : CEGUI.FalagardComponentBase
 local ImageryComponent = {}
 CEGUI.ImageryComponent = ImageryComponent
 CEGUI.ImageryComponent = ImageryComponent


---getImage
---@return CEGUI.Image
 function CEGUI.ImageryComponent:getImage() end

---setImage
---@param image CEGUI.Image
 function CEGUI.ImageryComponent:setImage(image) end

---setImage
---@param name string
 function CEGUI.ImageryComponent:setImage(name) end

---getVerticalFormatting
---@param wnd CEGUI.Window
---@return CEGUI.VerticalFormatting
 function CEGUI.ImageryComponent:getVerticalFormatting(wnd) end

---setVerticalFormatting
---@param fmt CEGUI.VerticalFormatting
 function CEGUI.ImageryComponent:setVerticalFormatting(fmt) end

---getHorizontalFormatting
---@param wnd CEGUI.Window
---@return CEGUI.HorizontalFormatting
 function CEGUI.ImageryComponent:getHorizontalFormatting(wnd) end

---setHorizontalFormatting
---@param fmt CEGUI.HorizontalFormatting
 function CEGUI.ImageryComponent:setHorizontalFormatting(fmt) end

---setHorizontalFormattingPropertySource
---@param property_name string
 function CEGUI.ImageryComponent:setHorizontalFormattingPropertySource(property_name) end

---setVerticalFormattingPropertySource
---@param property_name string
 function CEGUI.ImageryComponent:setVerticalFormattingPropertySource(property_name) end

---isImageFetchedFromProperty
---@return boolean
 function CEGUI.ImageryComponent:isImageFetchedFromProperty() end

---getImagePropertySource
---@return string
 function CEGUI.ImageryComponent:getImagePropertySource() end

---setImagePropertySource
---@param property string
 function CEGUI.ImageryComponent:setImagePropertySource(property) end

---new
---@return CEGUI.ImageryComponent
 function CEGUI.ImageryComponent:new() end

---
-- new_local 
-- @function [parent=#CEGUI.ImageryComponent] new_local
-- @param self
-- @return #CEGUI.ImageryComponent

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ImageryComponent
-- @param self
-- @return #CEGUI.ImageryComponent


---------------------------------------------------------------------------------
---TextComponent
---@class CEGUI.TextComponent : CEGUI.FalagardComponentBase
 local TextComponent = {}
 CEGUI.TextComponent = TextComponent
 CEGUI.TextComponent = TextComponent


---getText
---@return string
 function CEGUI.TextComponent:getText() end

---getEffectiveText
---@param wnd CEGUI.Window
---@return string
 function CEGUI.TextComponent:getEffectiveText(wnd) end

---getTextVisual
---@return string
 function CEGUI.TextComponent:getTextVisual() end

---getEffectiveVisualText
---@param wnd CEGUI.Window
---@return string
 function CEGUI.TextComponent:getEffectiveVisualText(wnd) end

---setText
---@param text string
 function CEGUI.TextComponent:setText(text) end

---getFont
---@return string
 function CEGUI.TextComponent:getFont() end

---getEffectiveFont
---@param wnd CEGUI.Window
---@return string
 function CEGUI.TextComponent:getEffectiveFont(wnd) end

---setFont
---@param font string
 function CEGUI.TextComponent:setFont(font) end

---getVerticalFormatting
---@param wnd CEGUI.Window
---@return CEGUI.VerticalTextFormatting
 function CEGUI.TextComponent:getVerticalFormatting(wnd) end

---setVerticalFormatting
---@param fmt CEGUI.VerticalTextFormatting
 function CEGUI.TextComponent:setVerticalFormatting(fmt) end

---getHorizontalFormatting
---@param wnd CEGUI.Window
---@return CEGUI.HorizontalTextFormatting
 function CEGUI.TextComponent:getHorizontalFormatting(wnd) end

---setHorizontalFormatting
---@param fmt CEGUI.HorizontalTextFormatting
 function CEGUI.TextComponent:setHorizontalFormatting(fmt) end

---setHorizontalFormattingPropertySource
---@param property_name string
 function CEGUI.TextComponent:setHorizontalFormattingPropertySource(property_name) end

---setVerticalFormattingPropertySource
---@param property_name string
 function CEGUI.TextComponent:setVerticalFormattingPropertySource(property_name) end

---isTextFetchedFromProperty
---@return boolean
 function CEGUI.TextComponent:isTextFetchedFromProperty() end

---getTextPropertySource
---@return string
 function CEGUI.TextComponent:getTextPropertySource() end

---setTextPropertySource
---@param property string
 function CEGUI.TextComponent:setTextPropertySource(property) end

---isFontFetchedFromProperty
---@return boolean
 function CEGUI.TextComponent:isFontFetchedFromProperty() end

---getFontPropertySource
---@return string
 function CEGUI.TextComponent:getFontPropertySource() end

---setFontPropertySource
---@param property string
 function CEGUI.TextComponent:setFontPropertySource(property) end

---getHorizontalTextExtent
---@param window CEGUI.Window
---@return number
 function CEGUI.TextComponent:getHorizontalTextExtent(window) end

---getVerticalTextExtent
---@param window CEGUI.Window
---@return number
 function CEGUI.TextComponent:getVerticalTextExtent(window) end

---new
---@return CEGUI.TextComponent
 function CEGUI.TextComponent:new() end

---
-- new_local 
-- @function [parent=#CEGUI.TextComponent] new_local
-- @param self
-- @return #CEGUI.TextComponent

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.TextComponent
-- @param self
-- @return #CEGUI.TextComponent


---------------------------------------------------------------------------------
---ImagerySection
---@class CEGUI.ImagerySection
 local ImagerySection = {}
 CEGUI.ImagerySection = ImagerySection
 CEGUI.ImagerySection = ImagerySection


---render
---@param srcWindow CEGUI.Window
---@param modColours CEGUI.ColourRect
---@param clipper CEGUI.Rect_float_
---@param clipToDisplay boolean
 function CEGUI.ImagerySection:render(srcWindow, modColours, clipper, clipToDisplay) end

---render
---@param srcWindow CEGUI.Window
---@param baseRect CEGUI.Rect_float_
---@param modColours CEGUI.ColourRect
---@param clipper CEGUI.Rect_float_
---@param clipToDisplay boolean
 function CEGUI.ImagerySection:render(srcWindow, baseRect, modColours, clipper, clipToDisplay) end

---addImageryComponent
---@param img CEGUI.ImageryComponent
 function CEGUI.ImagerySection:addImageryComponent(img) end

---clearImageryComponents
 function CEGUI.ImagerySection:clearImageryComponents() end

---addTextComponent
---@param text CEGUI.TextComponent
 function CEGUI.ImagerySection:addTextComponent(text) end

---clearTextComponents
 function CEGUI.ImagerySection:clearTextComponents() end

---clearFrameComponents
 function CEGUI.ImagerySection:clearFrameComponents() end

---addFrameComponent
---@param frame CEGUI.FrameComponent
 function CEGUI.ImagerySection:addFrameComponent(frame) end

---getMasterColours
---@return CEGUI.ColourRect
 function CEGUI.ImagerySection:getMasterColours() end

---setMasterColours
---@param cols CEGUI.ColourRect
 function CEGUI.ImagerySection:setMasterColours(cols) end

---getName
---@return string
 function CEGUI.ImagerySection:getName() end

---setMasterColoursPropertySource
---@param property string
 function CEGUI.ImagerySection:setMasterColoursPropertySource(property) end

---getBoundingRect
---@param wnd CEGUI.Window
---@return CEGUI.Rect_float_
 function CEGUI.ImagerySection:getBoundingRect(wnd) end

---getBoundingRect
---@param wnd CEGUI.Window
---@param rect CEGUI.Rect_float_
---@return CEGUI.Rect_float_
 function CEGUI.ImagerySection:getBoundingRect(wnd, rect) end

---new
---@return CEGUI.ImagerySection
 function CEGUI.ImagerySection:new() end

---
-- new_local 
-- @function [parent=#CEGUI.ImagerySection] new_local
-- @param self
-- @return #CEGUI.ImagerySection

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ImagerySection
-- @param self
-- @return #CEGUI.ImagerySection

---new
---@param name string
---@return CEGUI.ImagerySection
 function CEGUI.ImagerySection:new(name) end

---
-- new_local 
-- @function [parent=#CEGUI.ImagerySection] new_local
-- @param self
-- @param #string name
-- @return #CEGUI.ImagerySection

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.ImagerySection
-- @param self
-- @return #CEGUI.ImagerySection


---------------------------------------------------------------------------------
---SectionSpecification
---@class CEGUI.SectionSpecification
 local SectionSpecification = {}
 CEGUI.SectionSpecification = SectionSpecification
 CEGUI.SectionSpecification = SectionSpecification


---render
---@param srcWindow CEGUI.Window
---@param modcols CEGUI.ColourRect
---@param clipper CEGUI.Rect_float_
---@param clipToDisplay boolean
 function CEGUI.SectionSpecification:render(srcWindow, modcols, clipper, clipToDisplay) end

---render
---@param srcWindow CEGUI.Window
---@param baseRect CEGUI.Rect_float_
---@param modcols CEGUI.ColourRect
---@param clipper CEGUI.Rect_float_
---@param clipToDisplay boolean
 function CEGUI.SectionSpecification:render(srcWindow, baseRect, modcols, clipper, clipToDisplay) end

---getOwnerWidgetLookFeel
---@return string
 function CEGUI.SectionSpecification:getOwnerWidgetLookFeel() end

---getSectionName
---@return string
 function CEGUI.SectionSpecification:getSectionName() end

---getOverrideColours
---@return CEGUI.ColourRect
 function CEGUI.SectionSpecification:getOverrideColours() end

---setOverrideColours
---@param cols CEGUI.ColourRect
 function CEGUI.SectionSpecification:setOverrideColours(cols) end

---isUsingOverrideColours
---@return boolean
 function CEGUI.SectionSpecification:isUsingOverrideColours() end

---setUsingOverrideColours
---@param setting boolean
 function CEGUI.SectionSpecification:setUsingOverrideColours(setting) end

---setOverrideColoursPropertySource
---@param property string
 function CEGUI.SectionSpecification:setOverrideColoursPropertySource(property) end

---setRenderControlPropertySource
---@param property string
 function CEGUI.SectionSpecification:setRenderControlPropertySource(property) end

---new
---@param owner string
---@param sectionName string
---@param controlPropertySource string
---@param controlPropertyValue string
---@param controlPropertyWidget string
---@return CEGUI.SectionSpecification
 function CEGUI.SectionSpecification:new(owner, sectionName, controlPropertySource, controlPropertyValue, controlPropertyWidget) end

---
-- new_local 
-- @function [parent=#CEGUI.SectionSpecification] new_local
-- @param self
-- @param #string owner
-- @param #string sectionName
-- @param #string controlPropertySource
-- @param #string controlPropertyValue
-- @param #string controlPropertyWidget
-- @return #CEGUI.SectionSpecification

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.SectionSpecification
-- @param self
-- @return #CEGUI.SectionSpecification

---new
---@param owner string
---@param sectionName string
---@param controlPropertySource string
---@param controlPropertyValue string
---@param controlPropertyWidget string
---@param cols CEGUI.ColourRect
---@return CEGUI.SectionSpecification
 function CEGUI.SectionSpecification:new(owner, sectionName, controlPropertySource, controlPropertyValue, controlPropertyWidget, cols) end

---
-- new_local 
-- @function [parent=#CEGUI.SectionSpecification] new_local
-- @param self
-- @param #string owner
-- @param #string sectionName
-- @param #string controlPropertySource
-- @param #string controlPropertyValue
-- @param #string controlPropertyWidget
-- @param #CEGUI.ColourRect cols
-- @return #CEGUI.SectionSpecification

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.SectionSpecification
-- @param self
-- @return #CEGUI.SectionSpecification


---------------------------------------------------------------------------------
---LayerSpecification
---@class CEGUI.LayerSpecification
 local LayerSpecification = {}
 CEGUI.LayerSpecification = LayerSpecification
 CEGUI.LayerSpecification = LayerSpecification


---render
---@param srcWindow CEGUI.Window
---@param modcols CEGUI.ColourRect
---@param clipper CEGUI.Rect_float_
---@param clipToDisplay boolean
 function CEGUI.LayerSpecification:render(srcWindow, modcols, clipper, clipToDisplay) end

---render
---@param srcWindow CEGUI.Window
---@param baseRect CEGUI.Rect_float_
---@param modcols CEGUI.ColourRect
---@param clipper CEGUI.Rect_float_
---@param clipToDisplay boolean
 function CEGUI.LayerSpecification:render(srcWindow, baseRect, modcols, clipper, clipToDisplay) end

---addSectionSpecification
---@param section CEGUI.SectionSpecification
 function CEGUI.LayerSpecification:addSectionSpecification(section) end

---clearSectionSpecifications
 function CEGUI.LayerSpecification:clearSectionSpecifications() end

---getLayerPriority
---@return number
 function CEGUI.LayerSpecification:getLayerPriority() end

---.lt
---@param other CEGUI.LayerSpecification
---@return boolean
 function CEGUI.LayerSpecification:__lt(other) end

---new
---@param priority number
---@return CEGUI.LayerSpecification
 function CEGUI.LayerSpecification:new(priority) end

---
-- new_local 
-- @function [parent=#CEGUI.LayerSpecification] new_local
-- @param self
-- @param #number priority
-- @return #CEGUI.LayerSpecification

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.LayerSpecification
-- @param self
-- @return #CEGUI.LayerSpecification


---------------------------------------------------------------------------------
---StateImagery
---@class CEGUI.StateImagery
 local StateImagery = {}
 CEGUI.StateImagery = StateImagery
 CEGUI.StateImagery = StateImagery


---render
---@param srcWindow CEGUI.Window
---@param modcols CEGUI.ColourRect
---@param clipper CEGUI.Rect_float_
 function CEGUI.StateImagery:render(srcWindow, modcols, clipper) end

---render
---@param srcWindow CEGUI.Window
---@param baseRect CEGUI.Rect_float_
---@param modcols CEGUI.ColourRect
---@param clipper CEGUI.Rect_float_
 function CEGUI.StateImagery:render(srcWindow, baseRect, modcols, clipper) end

---addLayer
---@param layer CEGUI.LayerSpecification
 function CEGUI.StateImagery:addLayer(layer) end

---clearLayers
 function CEGUI.StateImagery:clearLayers() end

---getName
---@return string
 function CEGUI.StateImagery:getName() end

---isClippedToDisplay
---@return boolean
 function CEGUI.StateImagery:isClippedToDisplay() end

---setClippedToDisplay
---@param setting boolean
 function CEGUI.StateImagery:setClippedToDisplay(setting) end

---new
---@param name string
---@return CEGUI.StateImagery
 function CEGUI.StateImagery:new(name) end

---
-- new_local 
-- @function [parent=#CEGUI.StateImagery] new_local
-- @param self
-- @param #string name
-- @return #CEGUI.StateImagery

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.StateImagery
-- @param self
-- @return #CEGUI.StateImagery

---new
---@return CEGUI.StateImagery
 function CEGUI.StateImagery:new() end

---
-- new_local 
-- @function [parent=#CEGUI.StateImagery] new_local
-- @param self
-- @return #CEGUI.StateImagery

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.StateImagery
-- @param self
-- @return #CEGUI.StateImagery


---------------------------------------------------------------------------------
---WidgetComponent
---@class CEGUI.WidgetComponent
 local WidgetComponent = {}
 CEGUI.WidgetComponent = WidgetComponent
 CEGUI.WidgetComponent = WidgetComponent


---create
---@param parent CEGUI.Window
 function CEGUI.WidgetComponent:create(parent) end

---getComponentArea
---@return CEGUI.ComponentArea
 function CEGUI.WidgetComponent:getComponentArea() end

---setComponentArea
---@param area CEGUI.ComponentArea
 function CEGUI.WidgetComponent:setComponentArea(area) end

---getBaseWidgetType
---@return string
 function CEGUI.WidgetComponent:getBaseWidgetType() end

---setBaseWidgetType
---@param type string
 function CEGUI.WidgetComponent:setBaseWidgetType(type) end

---getWidgetLookName
---@return string
 function CEGUI.WidgetComponent:getWidgetLookName() end

---setWidgetLookName
---@param look string
 function CEGUI.WidgetComponent:setWidgetLookName(look) end

---getWidgetName
---@return string
 function CEGUI.WidgetComponent:getWidgetName() end

---setWidgetName
---@param suffix string
 function CEGUI.WidgetComponent:setWidgetName(suffix) end

---getWindowRendererType
---@return string
 function CEGUI.WidgetComponent:getWindowRendererType() end

---setWindowRendererType
---@param type string
 function CEGUI.WidgetComponent:setWindowRendererType(type) end

---getVerticalWidgetAlignment
---@return CEGUI.VerticalAlignment
 function CEGUI.WidgetComponent:getVerticalWidgetAlignment() end

---setVerticalWidgetAlignment
---@param alignment CEGUI.VerticalAlignment
 function CEGUI.WidgetComponent:setVerticalWidgetAlignment(alignment) end

---getHorizontalWidgetAlignment
---@return CEGUI.HorizontalAlignment
 function CEGUI.WidgetComponent:getHorizontalWidgetAlignment() end

---setHorizontalWidgetAlignment
---@param alignment CEGUI.HorizontalAlignment
 function CEGUI.WidgetComponent:setHorizontalWidgetAlignment(alignment) end

---addPropertyInitialiser
---@param initialiser CEGUI.PropertyInitialiser
 function CEGUI.WidgetComponent:addPropertyInitialiser(initialiser) end

---clearPropertyInitialisers
 function CEGUI.WidgetComponent:clearPropertyInitialisers() end

---setAutoWindow
---@param is_auto boolean
 function CEGUI.WidgetComponent:setAutoWindow(is_auto) end

---isAutoWindow
---@return boolean
 function CEGUI.WidgetComponent:isAutoWindow() end

---layout
---@param owner CEGUI.Window
 function CEGUI.WidgetComponent:layout(owner) end

---findPropertyInitialiser
---@param propertyName string
---@return CEGUI.PropertyInitialiser
 function CEGUI.WidgetComponent:findPropertyInitialiser(propertyName) end

---new
---@return CEGUI.WidgetComponent
 function CEGUI.WidgetComponent:new() end

---
-- new_local 
-- @function [parent=#CEGUI.WidgetComponent] new_local
-- @param self
-- @return #CEGUI.WidgetComponent

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.WidgetComponent
-- @param self
-- @return #CEGUI.WidgetComponent

---new
---@param type string
---@param look string
---@param suffix string
---@param renderer string
---@param autoWindow boolean
---@return CEGUI.WidgetComponent
 function CEGUI.WidgetComponent:new(type, look, suffix, renderer, autoWindow) end

---
-- new_local 
-- @function [parent=#CEGUI.WidgetComponent] new_local
-- @param self
-- @param #string type
-- @param #string look
-- @param #string suffix
-- @param #string renderer
-- @param #boolean autoWindow
-- @return #CEGUI.WidgetComponent

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.WidgetComponent
-- @param self
-- @return #CEGUI.WidgetComponent


---------------------------------------------------------------------------------
---WidgetLookFeel
---@class CEGUI.WidgetLookFeel
 local WidgetLookFeel = {}
 CEGUI.WidgetLookFeel = WidgetLookFeel
 CEGUI.WidgetLookFeel = WidgetLookFeel


---getStateImagery
---@param state string
---@return CEGUI.StateImagery
 function CEGUI.WidgetLookFeel:getStateImagery(state) end

---getImagerySection
---@param section string
---@return CEGUI.ImagerySection
 function CEGUI.WidgetLookFeel:getImagerySection(section) end

---getName
---@return string
 function CEGUI.WidgetLookFeel:getName() end

---addImagerySection
---@param section CEGUI.ImagerySection
 function CEGUI.WidgetLookFeel:addImagerySection(section) end

---addWidgetComponent
---@param widget CEGUI.WidgetComponent
 function CEGUI.WidgetLookFeel:addWidgetComponent(widget) end

---addStateSpecification
---@param state CEGUI.StateImagery
 function CEGUI.WidgetLookFeel:addStateSpecification(state) end

---addPropertyInitialiser
---@param initialiser CEGUI.PropertyInitialiser
 function CEGUI.WidgetLookFeel:addPropertyInitialiser(initialiser) end

---clearImagerySections
 function CEGUI.WidgetLookFeel:clearImagerySections() end

---clearWidgetComponents
 function CEGUI.WidgetLookFeel:clearWidgetComponents() end

---clearStateSpecifications
 function CEGUI.WidgetLookFeel:clearStateSpecifications() end

---clearPropertyInitialisers
 function CEGUI.WidgetLookFeel:clearPropertyInitialisers() end

---initialiseWidget
---@param widget CEGUI.Window
 function CEGUI.WidgetLookFeel:initialiseWidget(widget) end

---isStateImageryPresent
---@param state string
---@return boolean
 function CEGUI.WidgetLookFeel:isStateImageryPresent(state) end

---addNamedArea
---@param area CEGUI.NamedArea
 function CEGUI.WidgetLookFeel:addNamedArea(area) end

---clearNamedAreas
 function CEGUI.WidgetLookFeel:clearNamedAreas() end

---getNamedArea
---@param name string
---@return CEGUI.NamedArea
 function CEGUI.WidgetLookFeel:getNamedArea(name) end

---isNamedAreaDefined
---@param name string
---@return boolean
 function CEGUI.WidgetLookFeel:isNamedAreaDefined(name) end

---layoutChildWidgets
---@param owner CEGUI.Window
 function CEGUI.WidgetLookFeel:layoutChildWidgets(owner) end

---clearPropertyDefinitions
 function CEGUI.WidgetLookFeel:clearPropertyDefinitions() end

---clearPropertyLinkDefinitions
 function CEGUI.WidgetLookFeel:clearPropertyLinkDefinitions() end

---findPropertyInitialiser
---@param propertyName string
---@return CEGUI.PropertyInitialiser
 function CEGUI.WidgetLookFeel:findPropertyInitialiser(propertyName) end

---findWidgetComponent
---@param nameSuffix string
---@return CEGUI.WidgetComponent
 function CEGUI.WidgetLookFeel:findWidgetComponent(nameSuffix) end

---new
---@param name string
---@param inherits string
---@return CEGUI.WidgetLookFeel
 function CEGUI.WidgetLookFeel:new(name, inherits) end

---
-- new_local 
-- @function [parent=#CEGUI.WidgetLookFeel] new_local
-- @param self
-- @param #string name
-- @param #string inherits
-- @return #CEGUI.WidgetLookFeel

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.WidgetLookFeel
-- @param self
-- @return #CEGUI.WidgetLookFeel

---new
---@return CEGUI.WidgetLookFeel
 function CEGUI.WidgetLookFeel:new() end

---
-- new_local 
-- @function [parent=#CEGUI.WidgetLookFeel] new_local
-- @param self
-- @return #CEGUI.WidgetLookFeel

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.WidgetLookFeel
-- @param self
-- @return #CEGUI.WidgetLookFeel


---------------------------------------------------------------------------------
---WidgetLookManager
---@class CEGUI.WidgetLookManager
 local WidgetLookManager = {}
 CEGUI.WidgetLookManager = WidgetLookManager
 CEGUI.WidgetLookManager = WidgetLookManager


---getSingleton
---@return CEGUI.WidgetLookManager
 function CEGUI.WidgetLookManager:getSingleton() end

---parseLookNFeelSpecificationFromFile
---@param filename string
---@param resourceGroup string
 function CEGUI.WidgetLookManager:parseLookNFeelSpecificationFromFile(filename, resourceGroup) end

---parseLookNFeelSpecificationFromString
---@param source string
 function CEGUI.WidgetLookManager:parseLookNFeelSpecificationFromString(source) end

---isWidgetLookAvailable
---@param widget string
---@return boolean
 function CEGUI.WidgetLookManager:isWidgetLookAvailable(widget) end

---getWidgetLook
---@param widget string
---@return CEGUI.WidgetLookFeel
 function CEGUI.WidgetLookManager:getWidgetLook(widget) end

---eraseWidgetLook
---@param widget string
 function CEGUI.WidgetLookManager:eraseWidgetLook(widget) end

---eraseAllWidgetLooks
 function CEGUI.WidgetLookManager:eraseAllWidgetLooks() end

---addWidgetLook
---@param look CEGUI.WidgetLookFeel
 function CEGUI.WidgetLookManager:addWidgetLook(look) end

---writeWidgetLookToStream
---@param name string
---@param out_stream CEGUI.OutStream
 function CEGUI.WidgetLookManager:writeWidgetLookToStream(name, out_stream) end

---writeWidgetLookSeriesToStream
---@param prefix string
---@param out_stream CEGUI.OutStream
 function CEGUI.WidgetLookManager:writeWidgetLookSeriesToStream(prefix, out_stream) end

---new
---@return CEGUI.WidgetLookManager
 function CEGUI.WidgetLookManager:new() end

---
-- new_local 
-- @function [parent=#CEGUI.WidgetLookManager] new_local
-- @param self
-- @return #CEGUI.WidgetLookManager

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.WidgetLookManager
-- @param self
-- @return #CEGUI.WidgetLookManager

---setDefaultResourceGroup
---@param resourceGroup string
 function CEGUI.WidgetLookManager:setDefaultResourceGroup(resourceGroup) end

---getDefaultResourceGroup
---@return string
 function CEGUI.WidgetLookManager:getDefaultResourceGroup() end


---createListboxTextItem
---@param text string
---@param item_id number
---@param disabled boolean
---@param auto_delete boolean
---@return CEGUI.ListboxTextItem
 function CEGUI:createListboxTextItem(text, item_id, disabled, auto_delete) end

---createTreeItem
---@param text string
---@param item_id number
---@param disabled boolean
---@param auto_delete boolean
---@return CEGUI.TreeItem
 function CEGUI:createTreeItem(text, item_id, disabled, auto_delete) end

---------------------------------------------------------------------------------
---OutStream
---@class CEGUI.OutStream
 local OutStream = {}
 CEGUI.OutStream = OutStream
 CEGUI.OutStream = OutStream



---------------------------------------------------------------------------------
---FileStream
---@class CEGUI.FileStream : CEGUI.OutStream
 local FileStream = {}
 CEGUI.FileStream = FileStream
 CEGUI.FileStream = FileStream


---new
---@return CEGUI.FileStream
 function CEGUI.FileStream:new() end

---
-- new_local 
-- @function [parent=#CEGUI.FileStream] new_local
-- @param self
-- @return #CEGUI.FileStream

---
-- .call
-- Construct on the Lua Memory.
-- @callof #CEGUI.FileStream
-- @param self
-- @return #CEGUI.FileStream

---is_open
---@return boolean
 function CEGUI.FileStream:is_open() end

---open
---@param filename number
 function CEGUI.FileStream:open(filename) end

---close
 function CEGUI.FileStream:close() end


 return nil