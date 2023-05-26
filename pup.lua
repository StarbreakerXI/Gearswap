-- Public mode manipulation functions: (for reference)
--
-- 1) m:cycle() -- Cycles through the list going forwards.  Acts as a toggle on boolean mode vars.
-- 2) m:cycleback() -- Cycles through the list going backwards.  Acts as a toggle on boolean mode vars.
-- 3) m:toggle() -- Toggles a boolean Mode between true and false.
-- 4) m:set(n) -- Sets the current mode value to n.
--    Note: If m is boolean, n can be boolean true/false, or string of on/off/true/false.
--    Note: If m is boolean and no n is given, this forces m to true.
-- 5) m:unset() -- Sets a boolean mode var to false.
-- 6) m:reset() -- Returns the mode var to its default state.
-- 7) m:default() -- Same as reset()
include('Modes.lua')
DTMode = M{'normal', 'pdt'}
AccMode = M{'normal', 'acc'}
MspeedMode = M{'idle','locked','off'}
--TPMode = M{'normal','acc','pdt'}

function get_sets()

	send_command('bind f9 gs c dt mode')
	send_command('bind f10 gs c acc mode')
	--send_command('bind f11 gs c test')
	send_command('bind f12 gs c lock rings')
	ring_lock = false
	
	--send_command('bind ~f9 gs c warp') 				--shift+f9
	send_command('bind ^f9 gs c toggle movespeed') 	--ctrl+f9 gs toggle movespeed
	send_command('bind ^f10 gs c lock movespeed') 	--ctrl+f10 lock movespeed
	
	function file_unload()
		send_command('unbind f9')
        send_command('unbind f10')
		send_command('unbind f11')
        send_command('unbind f12')
		
		send_command('unbind ~f9')
		
		send_command('unbind ^f9')
        send_command('unbind ^f10')
	end
		
	set_default_macro_book()
	set_lockstyle()
	
	sets.idle = {} 					-- Leave this empty.
	sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty
	
	sets.melee = {}
	
	sets.JA = {}
	sets.WS = {}
	
	-- Idle & engaged sets --
	sets.melee.normal = {
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands="Karagoz Guanti +2",
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Shulmanu Collar",
		waist="Moonbow Belt +1",
		left_ear={ name="Schere Earring", augments={'Path: A',}},
		right_ear={ name="Karagoz Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
		left_ring="Epona's Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},		
	}
	
	sets.melee.acc = set_combine(sets.melee.normal, {})
	
	sets.melee.pdt = {
	}
	
	sets.idle.normal = set_combine(sets.melee.normal, { body="Hiza. Haramaki +2" })
	sets.idle.acc = set_combine(sets.melee.acc, { body="Hiza. Haramaki +2" })
	sets.idle.pdt = set_combine(sets.melee.pdt, { body="Hiza. Haramaki +2" })
	
	-- JobAbility sets --
	sets.JA['Example'] = {}
	
	-- Weapon Skill sets --
	sets.WS['Victory Smite'] = {
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear={ name="Schere Earring", augments={'Path: A',}},
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		left_ring="Rufescent Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},
	}
	
	sets.WS['Stringing Pummel'] = {
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear={ name="Schere Earring", augments={'Path: A',}},
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		left_ring="Rufescent Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},
	}
	
	sets.WS['Shijin Spiral'] = {
		head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Mpaca's Hose",
		feet={ name="Herculean Boots", augments={'Attack+26','Weapon skill damage +1%','DEX+15','Accuracy+8',}},
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Cessance Earring",
		right_ear="Odr Earring",
		left_ring="Thundersoul Ring",
		right_ring="Niqmaddu Ring",
		--back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},

	}
	
	sets.WS['Tornado Kick'] = {
		head="Mpaca's Cap",
		body="Hiza. Haramaki +2",
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs="Mpaca's Hose",
		--feet="Anch. Gaiters +3",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		--left_ear="Mache earring +1",
		--right_ear="Odr Earring",
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		right_ear={name="Schere Earring", augments={'Path: A',}},
		left_ring="Rufescent Ring",
		right_ring="Niqmaddu Ring",
		--back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}
	
	sets.WS['Dragon Kick'] = sets.WS['Tornado Kick']
	
	
	sets.WS['Howling Fist'] = {
		head="Mpaca's Cap",
		body="Mpaca's Doublet",
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear={ name="Schere Earring", augments={'Path: A',}},
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		left_ring="Rufescent Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Haste+10',}},
	}

	sets.WS['Raging Fists'] = {
		head="Mpaca's Cap",
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs="Mpaca's Hose",
		feet="Hiza. Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		--left_ear="Mache Earring +1",
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		right_ear={name="Schere Earring", augments={'Path: A',}},
		left_ring="Rufescent Ring",
		right_ring="Niqmaddu Ring",
		--back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}
	
	sets.WS['Asuran Fists'] = {
		head="Ken. Jinpachi +1",
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs="Mpaca's Hose",
		feet="Hiza. Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Mache Earring +1",
		right_ear="Odr Earring",
		left_ring="Rufescent Ring",
		right_ring="Niqmaddu Ring",
		--back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},

	}

end

function precast(spell)

	if sets.JA[spell.name] then
		equip(sets.JA[spell.name]) 
	elseif sets.WS[spell.name] then
		equip(sets.WS[spell.name])
	end
end

-- function midcast(spell)

function aftercast(spell)
	if spell.type == 'WeaponSkill' then
		send_command('@input /echo TP Return: ['..tostring(player.tp)..']')
	end
	idle()
end
 
 -- Returns to TP or Idle set depending on if the player is engaged 
 function idle()

	if player.status=='Engaged' then
		equip(sets.melee[DTMode.current])
	else
		equip(sets.idle[DTMode.current])
		if MspeedMode.current ~= 'off' then  
			equip({legs="Crimson Cuisses"}) 
		end
	end
	--check_cp_cape()
end
 
function status_change(new,old)	
	idle()
end

function sub_job_change(new,old)
	if new ~= old then 
		set_lockstyle()
	end
end


	--[[
	f9: Toggle dt mode
	f10: Toggle acc mode
	f11: test (currently IDs right ring)
	f12: Lock both ring slots
	ring_lock = false
	
	Shift+f9: equip and use warp ring
	ctrl+f9 toggle movespeed
	ctrl+f10 lock movespeed
	]]--
	
function self_command(command)
	local commandArgs = command:lower()	
	
	-- command to set combat mode for acc dt and hybrid modes --
	if commandArgs == 'dt mode' then
		DTMode:cycle()
		send_command('@input /echo Acc mode '..tostring(DTMode.current))
	elseif commandArgs == 'acc mode' then
		AccMode:cycle()
		send_command('@input /echo Acc mode '..tostring(AccMode.current))		
	
	-- handle equiping and locking movement speed gear --
	elseif commandArgs == 'toggle movespeed' then
		if MspeedMode.current ~= 'idle' then
			MspeedMode:set('idle')
			--send_command('@input /echo movespeed set to idle')
		elseif MspeedMode.current ~= 'off' then
			MspeedMode:set('off')
			--send_command('@input /echo movespeed swap disabled')
		end
		send_command('@input /echo Herald\'s Gaiters '..tostring(MspeedMode.current))
	
	elseif commandArgs == 'lock movespeed' then
		if MspeedMode.current ~= 'locked' then
			MspeedMode:set('locked')
		end	
		send_command('@input /echo Herald\'s Gaiters '..tostring(MspeedMode.current))
		
	-- handle equiping and locking experience and warp rings --
	elseif commandArgs == 'lock rings' then
		toggle_ring_lock()
	end
	
	idle()
	
end

function set_default_macro_book()
	send_command('@input /macro book 28; wait .1; input /macro set 1')
end

function set_lockstyle()
	send_command('wait 1; input /lockstyleset 101')
end

function toggle_ring_lock()
	if ring_lock then			-- if rings are locked then toggle to unlocked state
		ring_lock = false
		enable('ring1', 'ring2')
		send_command('@input /echo rings enabled')
	else
		ring_lock = true
		disable('ring1','ring2')
		send_command('@input /echo rings disabled')
	end
end
