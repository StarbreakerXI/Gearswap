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
		ammo="Sapience Orb",
		head={ name="Sakpata's Helm", augments={'Path: A',}},
		body={ name="Sakpata's Plate", augments={'Path: A',}},
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet={ name="Sakpata's Leggings", augments={'Path: A',}},
		neck="Unmoving Collar +1",
		waist="Creed Baudrier",
		left_ear="Cryptic Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Warden's Ring",
		right_ring="Rajas Ring",
		back={ name="Mecisto. Mantle", augments={'Cap. Point+31%','HP+25','DEF+5',}},		
	}
	
	sets.melee.acc = set_combine(sets.melee.normal, {})
	
	sets.melee.pdt = {
	}
	
	sets.idle.normal = set_combine(sets.melee.normal, {})
	sets.idle.acc = set_combine(sets.melee.acc, {})
	sets.idle.pdt = set_combine(sets.melee.pdt, {})
	
	-- Precast
	sets.precast.FC = {
		ammo="Sapience Orb",
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		body="Sacro breastplate",
		hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
		legs="Sakpata's Cuisses",
		feet="Carmine Greaves",
		neck="Voltsurge Torque",
		waist="Creed Baudrier",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back={ name="Mecisto. Mantle", augments={'Cap. Point+31%','HP+25','DEF+5',}},
	}
	
	sets.precast.Cure = set_combine(sets.precast.FC, {
        ear2="Mendi. Earring", --5
    })
	
	-- Midcast
	sets.midcast.Enmity = {
	
	}
	
	sets.midcast.Sird = set_combine(sets.midcast.Enmity, {
		
	})
	
	-- JobAbility sets --
	sets.JA['Sentinel'] = {
	
	}
	
	sets.JA['Rampart'] = {
	
	}
	
	sets.JA['Shield Bash'] = {
	
	}
	
	-- Weapon Skill sets --
	sets.WS['Attonement'] = {
		
	}
	
	sets.WS['Savage Blade'] = {
		
	}
	
	sets.WS['Chant du Cygne'] = {
		
	}
	
	sets.WS['Requiescat'] = {
		
	}
	
	sets.WS['Sanguine Blade'] = {
		
	}
	
	
end

function precast(spell)
	
	if spell.name:match('Cure') or spell.name:match('Cura') then
		equip(sets.precast.Cure)
	elseif spell.action_type == 'Magic' then
		if sets.precast[spell.skill] then
			equip(sets.precast[spell.skill])
		else
			equip(sets.precast.FC)
		end
	elseif sets.JA[spell.name] then
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
	send_command('@input /macro book 24; wait .1; input /macro set 1')
end

function set_lockstyle()
	send_command('wait 1; input /lockstyleset 104')
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
