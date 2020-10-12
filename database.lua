function init_database()
	materials={
		{
			t1="lEATHER",
			t2="+8 ATK",
			atk=10,wgt=5,sol=6,
			g=60,
			icon=1
		},
		{
			t1="sTIFF lEATHER",
			t2="+12 ATK",
			atk=12,wgt=5,sol=6,
			g=80,
			icon=1
		},
		{
			t1="tHICK lEATHER",
			t2="+20 ATK",
			atk=20,wgt=5,sol=6,
			g=115,
			icon=1
		},
		{
			t1="sCALE iRON",
			t2="+18 ATK",
			atk=18,wgt=12,sol=18,
			g=210,
			icon=2
		}
	}
	enchants={
		{
			t1="fIRE rEPEL",
			t2="rEQ.iRON",
			g=450,
			icon=3
		},
		{
			t1="pOISONOUS",
			t2="rEQ.bLADE",
			g=450,
			icon=4
		}
	}
	cur_wep={atk=0,wgt=0,sol=0}
	quests={
		{
			t1="pOISONOUS sWORD",
			t2=
[[…WE NEED A NEW
STRATEGY TO TAKE
OVER THIS WAR.
PLEASE HELP US!]],
			atk=16,atk_bonus=true,
			wgt=8,
			sol=11,sol_bonus=true,
			poison=true,
			fire=true
		}
	}
end
