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
	
	send_command('bind ~f9 gs c warp') 				--shift+f9
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
		--ammo="Ginsen",
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Ken. Jinpachi +1",
		body="Mpaca's Doublet",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		--legs="Hiza. Hizayoroi +2",
		legs="Bhikku Hose +3",
		feet="Anch. Gaiters +3",
		neck={ name="Mnk. Nodowa +1", augments={'Path: A',}},
		waist="Moonbow Belt +1",
		--left_ear="Cessance Earring",
		--right_ear="Brutal Earring",
		--right_ear="Mache Earring +1",
		left_ear="Sherida Earring",
		right_ear={name="Schere Earring", augments={'Path: A',}},
		left_ring="Epona's Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}
	
	sets.melee.acc = set_combine(sets.melee.normal, {
		ammo="Falcon Eye",
		--body="Mummu Jacket +1",
		--feet="Mummu Gamash. +1",
		--right_ear="Odr Earring",
		--left_ear="Mache Earring +1",
		--left_ring="Mummu Ring",
		--right_ring="Niqmaddu Ring",
	})
	
	sets.melee.pdt = {
		--ammo="Amar Cluster",
		body="Mpaca's Doublet",
		hands="Malignance Gloves",
		legs="Bhikku Hose +3", 
		--feet={ name="Herculean Boots", augments={'Attack+26','Weapon skill damage +1%','DEX+15','Accuracy+8',}},--
		--neck="Loricate Torque +1",
		--waist="Moonbow Belt +1",
		--right_ear="Etiolation/ Earring",
		--left_ring="Defending Ring",
	}
	
	sets.idle.normal = set_combine(sets.melee.normal, { body="Hiza. Haramaki +2" })
	sets.idle.acc = set_combine(sets.melee.acc, { body="Hiza. Haramaki +2" })
	sets.idle.pdt = set_combine(sets.melee.pdt, { body="Hiza. Haramaki +2" })
	
	-- JobAbility sets --
	sets.JA.Chakra = { body="Temple Cyclas", hands="Melee Gloves", }
	
	sets.JA.Focus = { head="Temple Crown" }
	
	sets.JA.Boost = { hands="Temple Gloves" }
	
	sets.JA.Dodge = { feet="Anch. Gaiters +3" }
	
	sets.JA.Impetus = { body="Bhikku Cyclas +2" }
	
	sets.JA.Mantra = {}
	
	sets.JA['Perfect Counter'] = sets.melee.pdt
	
	sets.JA['Footwork'] = { feet="Anch. Gaiters +3" }
	
	-- Weapon Skill sets --
	sets.WS['Victory Smite'] = {
		ammo="Knobkierrie",
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body="Mpaca's Doublet",
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs="Mpaca's Hose",
		feet="Mpaca's Boots",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		left_ear="Odr Earring",
		right_ear={name="Schere Earring", augments={'Path: A',}},
		left_ring="Rufescent Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}
	
	sets.WS['Shijin Spiral'] = {
		ammo="Knobkierrie",
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
		back={ name="Segomo's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},

	}
	
	sets.WS['Tornado Kick'] = {
		ammo="Knobkierrie",
		head="Mpaca's Cap",
		body="Hiza. Haramaki +2",
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs="Mpaca's Hose",
		feet="Anch. Gaiters +3",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		--left_ear="Mache earring +1",
		--right_ear="Odr Earring",
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		right_ear={name="Schere Earring", augments={'Path: A',}},
		left_ring="Rufescent Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}
	
	sets.WS['Dragon Kick'] = sets.WS['Tornado Kick']
	
	
	sets.WS['Howling Fist'] = {
		ammo="Knobkierrie",
		head="Mpaca's Cap",
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands={ name="Ryuo Tekko +1", augments={'STR+12','DEX+12','Accuracy+20',}},
		legs="Mpaca's Hose",
		feet="Hiza. Sune-Ate +1",
		neck="Fotia Gorget",
		waist="Moonbow Belt +1",
		--left_ear="Cessance Earring",
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		right_ear={name="Schere Earring", augments={'Path: A',}},
		left_ring="Rufescent Ring",
		right_ring="Niqmaddu Ring",
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}

	sets.WS['Raging Fists'] = {
		ammo="Knobkierrie",
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
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},
	}
	
	sets.WS['Asuran Fists'] = {
		ammo="Knobkierrie",
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
		back={ name="Segomo's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}},

	}

end
-- this pretarget function can be deleted if you don't wat to use aliasses for JAs
function pretarget(spell)
	--if sub == war? 
	if spell.name == 'Perfect Counter' and buffactive['Perfect Counter'] then 		
		cancel_spell()
		send_command('@input /ja \'Dodge\' <me>')
	elseif spell.name == 'Aggressor' and buffactive['Aggressor'] then 		
		cancel_spell()
		send_command('@input /ja \'Berserk\' <me>')
	elseif spell.name == 'Impetus' and buffactive['Impetus'] then 		
		cancel_spell()
		send_command('@input /ja \'Focus\' <me>')
	end
end


function precast(spell)

	if sets.JA[spell.name] then
		equip(sets.JA[spell.name]) 
		
		if spell.name == 'Perfect Counter' then
			DTMode:set('pdt')
			--update_tpmode()
		end
		-- TODO rules combine JA gear with current TP set ???
	elseif spell.name == 'Victory Smite' and buffactive['Impetus'] then
		equip(
			set_combine(sets.WS['Victory Smite'], sets.JA['Impetus'])
			)
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
	-- ensure equip is maintained persistant buffs (buffactive is not returning true on initial JA use until next call!)
	if spell.name == 'Impetus' then
		equip(sets.JA['Impetus'])
	elseif spell.name == 'Footwork' then
		equip(sets.JA['Footwork'])
	end
	
end
 
 -- Returns to TP or Idle set depending on if the player is engaged 
 function idle()

	if player.status=='Engaged' then
		equip(sets.melee[AccMode.current])
		if DTMode.current ~= 'normal' then
		equip(sets.melee[DTMode.current]) end
	else
		equip(sets.idle[AccMode.current])
		if DTMode.current ~= 'normal' then
		equip(sets.melee[DTMode.current]) end
		if MspeedMode.current ~= 'off' then 
			equip({feet="Herald's Gaiters"}) 
		end
	end
		
	if buffactive['Impetus'] then
		equip(sets.JA['Impetus'])
	end
	if buffactive['Footwork'] then
		equip(sets.JA['Footwork'])
	end
end
 
function status_change(new,old)	
	idle()
end

function buff_change(buff, gain)
	if (buff:lower() == 'impetus' or buff:lower()== 'Footwork') and not gain then
		idle()
	end		
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
	elseif command == 'warp' then
		use_ring("warp ring")
	elseif commandArgs == 'lock rings' then
		toggle_ring_lock()
	end
	
	if command == 'test' then
		send_command('@input /echo Ring test = '..tostring(player.equipment.right_ring))
	end
	
	idle()
	
end

function set_default_macro_book()
	send_command('@input /macro book 1; wait .1; input /macro set 1')
end

function set_lockstyle()
	send_command('wait 1; input /lockstyleset 1')
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
		
function use_ring(ring)
	equip({ring1=ring})
	toggle_ring_lock()
	send_command('wait 9.5; input /item "'..ring..'" <me>')
	send_command('@input /echo Using '..ring)
end	































--[[function update_tpmode()
	if DTMode.current == 'pdt' then
		TPMode:set('pdt')
	else
		local mode = AccMode.current
		TPMode:set(mode)
	end
end]]--



	--[[if #commandArgs:split(' ') >= 2 then
		commandArgs = T(commandArgs:split(' '))
		
		if commandArgs[1] == 'mode' then
			if commandArgs[2] == 'acc' then
				AccMode:cycle()
				send_command('@input /echo'..tostring(AccMode.current))
			end
			if commandArgs[2] == 'pdt' then
				DTMode:cycle()
			end
			--update_tpmode()
			idle() ]]--