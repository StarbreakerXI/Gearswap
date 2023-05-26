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

function get_sets()

	--[[send_command('bind f9 gs c')
	send_command('bind f10 gs c')
	send_command('bind f11 gs c')
	send_command('bind f12 gs c')
	
	send_command('bind ~f9 gs c warp')				--shift+f9
	
	
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
	end]]--
		
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
		--sub="Tokko Grip",
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Walahra Turban",
		body="Homam Corazza",
		hands="Homam Manopolas",
		legs="Homam Cosciales",
		feet="Homam Gambieras",
		neck="Anu Torque",
		left_ear="Brutal Earring",-
		waist="Windbuffet Belt +1",
		right_ear="Sherida Earring",
		left_ring="Niqmaddu Ring",
		right_ring="Rajas Ring",
		back="Forager's Mantle",
	}
	
	sets.melee.acc  = {}
	sets.melee.pdt = {}
	
	sets.idle.normal = {}
	sets.idle.acc = {}
	sets.idle.pdt = {}
	
	sets.idle.movespeed = {}
	
	
	-- JobAbility sets --
	sets.JA['example'] = {}
	
	-- Weapon Skill sets --
	sets.WS['example'] = {}
	
	sets.WS.default = {
		ammo="Knobkierrie",
		head="Voyager Sallet",
		body="Hecatomb Harness",
		hands="Hecatomb Mittens",
		legs="Pln. Seraweels",
		feet="Hct. Leggings",
		neck="Spike Necklace",
		waist="Warwolf Belt",
		left_ear="Assault Earring",
		right_ear="Fang Earring",
		left_ring="Sun Ring",
		right_ring="Rajas Ring",
		back="Forager's Mantle",
	}
	
end

function precast(spell)
	
	if sets.JA[spell.name] then
		equip(sets.JA[spell.name]) 
		
	elseif sets.WS[spell.name] then
		equip(sets.WS[spell.name])
	elseif spell.type == 'WeaponSkill' then
		equip(sets.WS.default)
	end
	
end

function midcast(spell)

end

function aftercast(spell)
	--idle()
	equip(sets.melee.normal)
end

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
			--equip({}) 
		end
	end
	
end
 
function status_change(new,old)
	--idle()
end

--[[function buff_change(buff, gain) 
	
end]]--

function sub_job_change(new,old)
	if new ~= old then 
		set_lockstyle()
	end
end

function set_default_macro_book()
	send_command('@input /macro book 10; wait .1; input /macro set 1')
end

function set_lockstyle()
	send_command('wait 1; input /lockstyleset 103')
end