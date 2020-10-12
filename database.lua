function init_database()
	blueprints = {
		{
			t1 = "sWORD"
		}
	}
	materials = {
		{
			t1 = "lEATHER",
			t2 = "+8 ATK",
			atk = 10, wgt = 5, sol = 6,
			price = 60,
			icon = 1
		},
		{
			t1 = "sTIFF lEATHER",
			t2 = "+12 ATK",
			atk = 12, wgt = 5, sol = 6,
			price = 80,
			icon = 1
		},
		{
			t1 = "tHICK lEATHER",
			t2 = "+20 ATK",
			atk = 20, wgt = 5, sol = 6,
			price = 115,
			icon = 1
		},
		{
			t1 = "sCALE iRON",
			t2 = "+18 ATK",
			atk = 18, wgt = 12, sol = 18,
			price = 210,
			icon = 2
		},
		{
			t1 = "hUH",
			t2 = "OKOK",
		},
		{
			t1 = "hUH",
			t2 = "OKOK",
		},
		{
			t1 = "hUH",
			t2 = "OKOK",
		},
		{
			t1 = "hUH",
			t2 = "OKOK",
		}
	}
	enchants = {
		{
			t1 = "fIRE rEPEL",
			t2 = "rEQ.iRON",
			price = 450,
			icon = 3
		},
		{
			t1 = "pOISONOUS",
			t2 = "rEQ.bLADE",
			price = 450,
			icon = 4
		}
	}
	quests = {
		{
			t1 = "pOISONOUS sWORD",
			t2 = 
[[…WE NEED A NEW
STRATEGY TO TAKE
OVER THIS WAR.
PLEASE HELP US!]],
			atk = 16, atk_bonus = true,
			wgt = 8,
			sol = 11, sol_bonus = true,
			effects = {1, 2}
		}
	}
end
