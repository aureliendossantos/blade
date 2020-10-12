-----------------------------
--common background & title--
-----------------------------

function draw_win_background(win)
	local x,y,w,h,t=win.x,win.y,
	win.w,win.h,win.t
	rectfill(x+2,y+2,x+w,y+h,0)
	rectfill(x+1,y+1,x+w-2,y+h-2,1)
	line(x+1,y,x+w-2,y,6)
	line(x+1,y+h-1,x+w-2,y+h-1)
	line(x,y+1,x,y+h-2)
	line(x+w-1,y+1,x+w-1,y+h-2)
	pset(x+2,y+2)
	pset(x+w-3,y+2)
	pset(x+2,y+h-3)
	pset(x+w-3,y+h-3)
	if t then
		print(t,x+w/2-#t*4/2,y+6,6)
	end
end

----------
--popups--
----------

function create_popup(question,...)
	local c={...}
	local width=#question*4+12
	local height=15+#c*12
	popup={
		x=64-width/2,
		y=64-height/2,
		w=width,
		h=height,
		t=question,
		choices=c,
		index=1
	}
end

function draw_popup()
	if popup then
		draw_win_background(popup)
		local c=popup.choices
		local w=0
		for i=1,#c do
			local test=#c[i]*4+8
			w=test>w and test or w
		end
		for i=1,#c do
			local h=8
			local x=64-w/2
			local y=popup.y+15+(i-1)*(h+2)
			rectfill(x,y,x+w,y+h,0)
			rect(x,y,x+w,y+h,popup.index==i and 6 or 5)
			print(c[i],65-#c[i]*2,y+2,popup.index==i and 6 or 5)
		end
	end
end

------------------------
--materials & enchants--
------------------------

function init_materials_win()
	mat_win={x=0,y=7,w=75,h=121}
end

function init_weapon_win()
	wep_win={x=76,y=7,w=52,h=121}
end

function draw_materials_win()
	draw_win_background(mat_win)
	spr(tab and 48 or 51,4,0,3,1)
	local c=materials
	local index=mat_index
	local chosen=chosen_mat
	if not tab then
		c=enchants
		index=enc_index
		chosen=chosen_enc
	end
	for i=1,#c do
		local w=68
		local h=16
		local x=3
		local y=11+(i-1)*(h+2)
		local col=5
		if chosen==i then
			col=9
		elseif index==i then
			col=6
		end
		rectfill(x,y,x+w,y+h,0)
		rect(x,y,x+w,y+h,col)
		spr(c[i].icon,x+3,y+4)
		print(c[i].t1,x+13,y+3,6)
		print(c[i].t2,x+13,y+9,5)
		local g=tostr(c[i].g)
		local gx=x+w-#g*4
		print(g,gx-1,y+9,6)
		spr(54,gx-6,y+7)
	end
end

function draw_weapon_win()
	draw_win_background(wep_win)
	local x=80
	local y=20
	print("ATK:"..cur_wep.atk,x,y,7)
	y+=7
	print("WGT:"..cur_wep.wgt,x,y,7)
	y+=7
	print("SOL:"..cur_wep.sol,x,y,7)
end

---------
--quest--
---------

function init_quest_win()
	qu_win={x=30,y=11,w=75,h=101,t=quests[cur_qu].t1}
end

function draw_quest_win()
	draw_win_background(qu_win)
	local q=quests[cur_qu]
	local x=qu_win.x+4
	local y=qu_win.y+20
	local w=qu_win.w
	print(q.t2,x,y,7)
	local s="-requirements-"
	print(s,x-4+w/2-#s*2,y+30,6)
	y+=40
	s="ATK:"..q.atk
	print(s,x,y,6)
	if q.atk_bonus then
		spr(55,x+#s*4,y)
	end
	y+=7
	s="WGT:"..q.wgt
	print(s,x,y,6)
	if q.wgt_bonus then
		spr(55,x+#s*4,y)
	end
	y+=7
	s="SOL:"..q.sol
	print(s,x,y,6)
	if q.sol_bonus then
		spr(55,x+#s*4,y)
	end
	y+=8
	if q.poison then
		spr(4,x-2,y-2)
		print("pOISONOUS",x+6,y,6)
		y+=7
	end
	if q.fire then
		spr(3,x-2,y-2)
		print("fIRE rEPEL",x+6,y,6)
		y+=7
	end
end
