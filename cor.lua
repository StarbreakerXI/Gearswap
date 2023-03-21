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
RngMode = M('anarchy', 'doomsday', 'holliday') --anarchy, doomsday, Holliday
WpnMode = M('Naegling', 'Tauret', 'Nusku Shield')
DTMode = M{'normal', 'pdt'}
AccMode = M{'normal', 'acc'}
MspeedMode = M{'idle','locked','off'}

rLock = false

function get_sets()

	--[[send_command('bind f10 gs c')
	send_command('bind f11 gs c')
	send_command('bind f12 gs c')
	
	send_command('bind ~f9 gs c warp')				--shift+f9
	
	
	send_command('bind ^f9 gs c toggle movespeed') 	--ctrl+f9 gs toggle movespeed
	send_command('bind ^f10 gs c lock movespeed') 	--ctrl+f10 lock movespeed
	
	function file_unload()
		
        send_command('unbind f10')
		send_command('unbind f11')
        send_command('unbind f12')
		
		send_command('unbind ~f9')
		
		send_command('unbind ^f9')
        send_command('unbind ^f10')
	end]]--
	
	send_command('bind ~f9 gs c cycle ranged')
	send_command('bind ~f10 gs c cycle weapon')
	send_command('bind ~f12 gs c toggle rnglock')
	
	send_command('bind f9 gs c toggle movespeed')
	send_command('bind f10 gs c acc mode')
	
	function file_unload()
		send_command('unbind ~f9')
		send_command('unbind ~f10')
		send_command('unbind ~f12')
		
		send_command('unbind f9')
		send_command('unbind f10')
	end
		
	set_default_macro_book()
	set_lockstyle()
	
	
	sets.idle = {} 					-- Leave this empty.
	sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty
	
	sets.melee = {}
	sets.ranged = {}
	sets.JA = {}
	sets.WS = {}
	
	-- Idle & engaged sets --
	sets.melee.normal = {
	    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands="Malignance Gloves",
		legs="Chas. Culottes +2",
		feet={ name="Herculean Boots", augments={'Attack+26','Weapon skill damage +1%','DEX+15','Accuracy+8',}},
		neck="Ocachi Gorget",
		waist="Windbuffet Belt +1",
		left_ear="Cessance Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Rajas Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}
	sets.melee.acc  = {}
	sets.melee.pdt = {}
	
	--sets.idle.normal = {}
	sets.idle.acc = {}
	sets.idle.normal = {
		head="Chass. Tricorne +2",
		body="Chasseur's Frac +2",
		hands="Malignance Gloves",
		legs="Chas. Culottes +2",
		feet={ name="Herculean Boots", augments={'Attack+26','Weapon skill damage +1%','DEX+15','Accuracy+8',}},
		neck="Loricate Torque +1",
		left_ring="Defending Ring",
	}
	sets.idle.movespeed = {legs="Crimson Cuisses"}
	
    --hands="Chasseur's Gants +2",
	-- Ranged sets --
	sets.ranged.preshot = {
		--ammo="Voluspa Bullet",
		--ammo="Orichalc. Bullet",
		ammo="Eminent Bullet",
		head="Chass. Tricorne +2",
		body="Laksa. Frac +2",
		hands={ name="Lanun Gants +1", augments={'Enhances "Fold" effect',}},
		legs="Chas. Culottes +2",
		feet="Meg. Jam. +1",
		waist="Impulse Belt",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
	}
	sets.ranged.midshot = {
		--ammo="Voluspa Bullet",
		--ammo="Eminent Bullet",
		head="Ikenga's Hat",
		body="Mummu Jacket +2",
		hands="Malignance Gloves",
		--hands="Meg. Gloves +2",
		legs="Chas. Culottes +2",
		feet="Meg. Jam. +1",
		--neck="Ocachi Gorget",
		neck="Sanctity Necklace",
		waist="Elanid Belt",
		left_ear="Volley Earring",
		right_ear="Enervating Earring",
		left_ring="Dingir Ring",
		right_ring="Longshot Ring",
		--left_ring="Arvina Ringlet +1",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
	}
	sets.ranged.acc = {
		neck="Sanctity Necklace",
	}
	--sets.combine(sets.ranged.midshot, {neck="Sanctity Necklace",})
	
	sets.ranged.empty = {
		ammo=empty,
	}
	
	-- Weapon Skill sets --
	sets.WS['Leaden Salute'] = {
		ammo="Orichalc. Bullet",
		head="Pixie Hairpin +1",
		body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','INT+5','Mag. Acc.+2',}},
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		neck={ name="Comm. Charm +1", augments={'Path: A',}},
		--waist="Eschan Stone",
		waist='Hachirin-no-Obi',
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		left_ring="Dingir Ring",
		right_ring="Archon Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}
	sets.WS['Wildfire'] = {
		ammo="Orichalc. Bullet",
		head={ name="Herculean Helm", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Crit. hit damage +2%','INT+6','"Mag.Atk.Bns."+13',}},
		body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','INT+5','Mag. Acc.+2',}},
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		neck={ name="Comm. Charm +1", augments={'Path: A',}},
		--neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Dingir Ring",
		right_ring="Arvina Ringlet +1",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}
	sets.WS['Last Stand'] ={
		ammo="Voluspa Bullet",
		head="Meghanada Visor +1",
		body="Laksa. Frac +2",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +1",
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		left_ring="Dingir Ring",
		--right_ring="Arvina Ringlet +1",
		right_ring="Karieyh Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
	}
	
	sets.WS['Savage Blade'] ={
		head="Meghanada Visor +1",
		body="Laksa. Frac +2",
		hands="Meg. Gloves +2",
		legs="Meg. Chausses +1",
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		--feet={ name="Herculean Boots", augments={'Attack+25','Weapon skill damage +1%','STR+13','Accuracy+14',}},
		neck="Caro Necklace",
		waist="Prosilio Belt",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		left_ring="Rufescent Ring",
		right_ring="Karieyh Ring",
		back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}
	
	sets.WS['Evisceration'] ={
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands="Mummu Wrists +2",
		legs="Mummu Kecks +1",
		feet="Mummu Gamash. +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Odr Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		left_ring="Mummu Ring",
		right_ring="Thundersoul Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Phys. dmg. taken-10%',}},
	}
	
	sets.WS['Aeolian Edge'] ={
		head={ name="Herculean Helm", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Crit. hit damage +2%','INT+6','"Mag.Atk.Bns."+13',}},
		body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','INT+5','Mag. Acc.+2',}},
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
		neck={ name="Comm. Charm +1", augments={'Path: A',}},
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		left_ring="Dingir Ring",
		right_ring="Karieyh Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
	}
	
	sets.WS['Slug Shot'] = sets.WS['Last Stand']
	
	-- JobAbility sets --
	sets.JA['Wild Card'] = { 
		feet={ name="Lanun Bottes +3", augments={'Enhances "Wild Card" effect',}},
	}
	
	-- Melee Weapon sets --
	sets.melee['Naegling'] = {
		main="Naegling",
		sub='Gleti\'s knife',
	}
	sets.melee['Tauret'] = {
		main="Lanun Knife",
		sub="Tauret",
	}
	sets.melee['Nusku Shield'] = {
		main="Lanun Knife",
		sub="Nusku Shield",
	}
	-- Ranged Weapon Sets --
	sets.ranged.doomsday = { 
		range={ name="Doomsday", augments={'"Mag.Atk.Bns."+20','Weapon skill damage +4%','AGI+21',}},
	}
	sets.ranged.holliday ={
		range={ name="Holliday", augments={'Weapon skill damage +3%','MND+1','Rng.Acc.+10','Rng.Atk.+7','DMG:+26',}},
	}
	sets.ranged.corRoll = {
		range={ name="Compensator", augments={'DMG:+15','AGI+15','Rng.Acc.+15',}},
	}
	sets.ranged.anarchy = {
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
	}
	-- ammo="Animikii Bullet",
	-- ammo="Hauksbok Bullet",
	
	-- ammo="Orichalc. Bullet",
	-- ammo="Voluspa Bullet",
	-- ammo="Eminent Bullet"
	
end

function precast(spell)
	--send_command('@input /echo Action type = '..tostring(spell.action_type))
	if spell.action_type == 'Ranged Attack' then
		equip(sets.ranged.preshot)
		check_ammo(spell)
	end
	
	-- wepaon skills --
	if sets.WS[spell.name] then
		equip(sets.WS[spell.name])
		
		if spell.skill == 'Marksmanship'  then
			check_ammo(spell)
		end
	end
	
	-- job abilities --
	if sets.JA[spell.name] then
		equip(sets.JA[spell.name])
	end
	
	if spell.type == 'CorsairShot' then
		send_command('@input /echo Quickdraw used')
		--do stuff
	end
	
	if spell.type == 'CorsairRoll' then
		send_command('@input /echo Phantom roll used')
		if not rLock then
			equip(sets.ranged.corRoll)
		end
	end
end

function midcast(spell)
	if spell.action_type == 'Ranged Attack' then
		equip(sets.ranged.midshot)
		
		if AccMode == 'acc' then
			equip(sets.ranged.acc)
		end
	end
	
end

function aftercast(spell)
	--send_command('@input /echo used '..tostring(spell.type))
	
	-- Switch back to main ranged weapon/set after using Phantom Roll.
	if spell.type == 'CorsairRoll' then
		equip(sets.ranged[RngMode.current])
	else 
		idle()
	end
	
	if spell.type == 'CorsairShot' then
		equip({ammo=empty})
	end
end

function status_change(new,old)
	idle()
end

function idle()

	if player.status=='Engaged' then
		equip(sets.melee[AccMode.current])
		if DTMode.current ~= 'normal' then
		equip(sets.melee[DTMode.current]) end
	else
		equip(sets.melee.normal, sets.idle.normal)
		--equip(sets.idle[AccMode.current])
		-- Movespeed
		if MspeedMode.current ~= 'off' then 
			equip(sets.idle.movespeed) 
		end
	end
	
end

function check_ammo(spell)
	local bullet = player.equipment.ammo
	if (bullet == 'Animikii Bullet' or bullet == 'Hauksbok Bullet') and spell.type ~= 'CorsairShot' then
		cancel_spell()
		equip({ammo=empty})
		send_command('@input /echo Caution! Action cancelled: '..bullet..' unequiped')
	else 
		--send_command('@input /echo Action type = '..tostring(ammo))
	end
end

--[[function buff_change(buff, gain) 
	
end]]--

function self_command(command)
	local commandArgs = command:lower()	
	
	if commandArgs == 'acc mode' then
		AccMode:cycle()
		send_command('@input /echo Acc mode set to '..tostring(AccMode.current))
	end
	
	
	
	-- handle equiping and locking movement speed gear --
	if commandArgs == 'toggle movespeed' then
		if MspeedMode.current ~= 'idle' then
			MspeedMode:set('idle')
		elseif MspeedMode.current ~= 'off' then
			MspeedMode:set('off')
		end
	end
	-- cycle through ranged options --
	if commandArgs == 'cycle ranged' then
		RngMode:cycle()
		send_command('@input /echo Ranged weapon: '..RngMode.current)
		equip(sets.ranged[RngMode.current])
	end	
	
	-- cycle through weapon options --
	if commandArgs == 'cycle weapon' then
		WpnMode:cycle()
		send_command('@input /echo Melee weapon: '..WpnMode.current)
		equip(sets.melee[WpnMode.current])
	end
	
	-- lock ranged slot to prevent TP loss (prevent phantom roll swaps) --
	if commandArgs == 'toggle rnglock' then
		if rLock then
			rLock = false
		else
			rLock = true
		end
		send_command('@input /echo Ranged lock: '..tostring(rLock))
	end
end

function sub_job_change(new,old)
	if new ~= old then 
		set_lockstyle()
	end
end

function set_default_macro_book()
	send_command('@input /macro book 3; wait .1; input /macro set 1')
end

function set_lockstyle()
	send_command('wait 1; input /lockstyleset 21')
end