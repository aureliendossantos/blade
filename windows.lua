-----------------------------
--common background & title--
-----------------------------

function draw_win_background(win)
	local x, y, w, h, t = win.x, win.y, 
	win.w, win.h, win.t
	rectfill(x+2, y+2, x+w, y+h, 0)
	rectfill(x+1, y+1, x+w-2, y+h-2, 1)
	line(x+1, y, x+w-2, y, 6)
	line(x+1, y+h-1, x+w-2, y+h-1)
	line(x, y+1, x, y+h-2)
	line(x+w-1, y+1, x+w-1, y+h-2)
	pset(x+2, y+2)
	pset(x+w-3, y+2)
	pset(x+2, y+h-3)
	pset(x+w-3, y+h-3)
	if t then
		print(t, x+w/2-#t*4/2, y+6, 6)
	end
end

----------
--popups--
----------

function create_popup(question, ...)
	local c = {...}
	local width = #question*4+12
	local height = 15+#c*12
	popup = {
		x = 64-width/2, 
		y = 64-height/2, 
		w = width, 
		h = height, 
		t = question, 
		choices = c, 
		index = 1
	}
end

function draw_popup()
	if popup then
		draw_win_background(popup)
		local c = popup.choices
		local w = 0
		for i = 1, #c do
			local test = #c[i]*4+8
			w = test>w and test or w
		end
		for i = 1, #c do
			local h = 8
			local x = 64-w/2
			local y = popup.y+15+(i-1)*(h+2)
			rectfill(x, y, x+w, y+h, 0)
			rect(x, y, x+w, y+h, popup.index == i and 6 or 5)
			print(c[i], 65-#c[i]*2, y+2, popup.index == i and 6 or 5)
		end
	end
end

------------------------
--materials & enchants--
------------------------

function init_materials_win()
	mat_win = {x = 0, y = 7, w = 75, h = 121}
end

function init_weapon_win()
	wep_win = {x = 76, y = 7, w = 52, h = 121}
end

function draw_materials_win()
	draw_win_background(mat_win)
	local sprites = {48, 53, 58}
	spr(sprites[tab], 4, 0, 5, 1)
	local arrays = {blueprints, materials, enchants}
	local c = arrays[tab]
	local index = index[tab]
	local chosen = chosen[tab]
	local w = 68
	local h = 16
	local x = 3
	clip(x, 11, w+1, 113)
	if #c > 6 then
		--if index lower than camera, place index at bottom of the screen
		if (camy <= 18*index-114) camy = 18*index-108
		--if index is higher than camera, place index at top of the screen
		if (camy >= 18*index-18) camy = 18*index-24
		if (index == 1) camy = 0
		if (index == #c) camy = 18*index-114
	else
		camy = 0
	end
	camera(0, camy)
	for i = 1, #c do
		local y = 11+(i-1)*(h+2)
		local col = index == i and 6 or 5
		if tab == 1 or tab == 2 then
			if (chosen == i) col = 9
		elseif tab == 3 then
			for j in all(chosen) do
				if (j == i) col = 9
			end
		end
		rectfill(x, y, x+w, y+h, 0)
		rect(x, y, x+w, y+h, col)
		spr(c[i].icon, x+3, y+4)
		print(c[i].t1, x+13, y+3, 6)
		print(c[i].t2, x+13, y+9, 5)
		local g = tostr(c[i].price)
		local gx = x+w-#g*4
		print(g, gx-1, y+9, 6)
		spr(16, gx-6, y+7)
	end
	camera()
	fillp(0b0101101001011010.1)
	if (camy < 18*#c-114) rectfill(x, 122, x+w, 123, 1)
	if (camy > 0) rectfill(x, 11, x+w, 12, 1)
	fillp()
	clip()
end

function draw_weapon_win()
	draw_win_background(wep_win)
	local x = 80
	local y = 20
	print("ATK:"..current_weapon.atk, x, y, 7)
	y += 7
	print("WGT:"..current_weapon.wgt, x, y, 7)
	y += 7
	print("SOL:"..current_weapon.sol, x, y, 7)
	y += 7
	print(current_weapon.price, x, y, 7)
	y += 8
	for i in all(current_weapon.enc) do
		local e = enchants[i]
		spr(e.icon, x-2, y-2)
		print(e.t1, x+6, y, 6)
		y += 7
	end
end

---------
--quest--
---------

function init_quest_win()
	qu_win = {x = 30, y = 11, w = 75, h = 101, t = quests[current_quest].t1}
end

function draw_quest_win()
	draw_win_background(qu_win)
	local q = quests[current_quest]
	local x = qu_win.x+4
	local y = qu_win.y+20
	local w = qu_win.w
	print(q.t2, x, y, 7)
	local s = "-requirements-"
	print(s, x-4+w/2-#s*2, y+30, 6)
	y += 40
	s = "ATK:"..q.atk
	print(s, x, y, 6)
	if q.atk_bonus then
		spr(17, x+#s*4, y)
	end
	y += 7
	s = "WGT:"..q.wgt
	print(s, x, y, 6)
	if q.wgt_bonus then
		spr(17, x+#s*4, y)
	end
	y += 7
	s = "SOL:"..q.sol
	print(s, x, y, 6)
	if q.sol_bonus then
		spr(17, x+#s*4, y)
	end
	y += 8
	for i in all(q.effects) do
		local e = enchants[i]
		spr(e.icon, x-2, y-2)
		print(e.t1, x+6, y, 6)
		y += 7
	end
end
