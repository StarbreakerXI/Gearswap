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
THMode = M{'idle', 'locked', 'off'}

function get_sets()

	send_command('bind f9 gs c')
	send_command('bind f10 gs c')
	send_command('bind f11 gs c')
	send_command('bind f12 gs c')
	
	--send_command('bind ~f9 gs c warp')				--shift+f9
	send_command('bind ~f9 gs c toggle treasurehunter') --shiftf9 gs toggle movespeed
	send_command('bind ~f10 gs c lock treasurehunter') 	--shift+f10 lock movespeed
	
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
	sets.melee.normal = {}
	sets.melee.acc  = {}
	sets.melee.pdt = {}
	
	sets.melee.treasurehunter = {head="White rarab cap +1",hands="Plun. Armlets +1",feet="Skulker's Poulaines"}
	
	sets.idle.normal = {}
	sets.idle.acc = {}
	sets.idle.pdt = {}
	
	sets.idle.movespeed = {feet="Fajin Boots"}
	
	
	-- JobAbility sets --
	sets.JA["Flee"] = {feet="Rogue's Poulaines"}
	
	-- Weapon Skill sets --
	sets.WS['example'] = {}
	
end

function precast(spell)
	if sets.JA[spell.name] then
		equip(sets.JA[spell.name]) 
	elseif sets.WS[spell.name] then
		equip(sets.WS[spell.name])
	end
end

function midcast(spell)

end

function aftercast(spell)
	idle()
end

function idle()

	if player.status=='Engaged' then
		equip(sets.melee[AccMode.current])
		if DTMode.current ~= 'normal' then
			equip(sets.melee[DTMode.current]) 
		end
		
	else
		equip(sets.idle[AccMode.current])
		if DTMode.current ~= 'normal' then
			equip(sets.melee[DTMode.current]) 
		end
		if THMode.current == 'idle' then 
			equip(sets.melee.treasurehunter)
			--equip(sets.idle.movespeed)
		end
	end	
end

 
function self_command(command)
	local commandArgs = command:lower()	
	
	-- handle equiping and locking movement speed gear --
	if commandArgs == 'toggle treasurehunter' then
		if THMode.current ~= 'idle' then
			THMode:set('idle')
			--send_command('@input /echo movespeed set to idle')
		elseif THMode.current ~= 'off' then
			THMode:set('off')
			--send_command('@input /echo movespeed swap disabled')
		end
		send_command('@input /echo Treasure Hunter '..tostring(THMode.current))
	
	elseif commandArgs == 'lock treasurehunter' then
		if THMode.current ~= 'locked' then
			THMode:set('locked')
		end	
		send_command('@input /echo Treasure Hunter '..tostring(THMode.current))
		
	end
end		
 
function status_change(new,old)
	idle()
	--[[if old == 'Idle' and new == 'Engaged' then
		equip(sets.melee.treasurehunter)
	end]]--
	--send_command('@input /echo Status changed to '..new)
	
end

--[[function buff_change(buff, gain) 
	
end]]--

function sub_job_change(new,old)
	if new ~= old then 
		set_lockstyle()
	end
end

function set_default_macro_book()
	send_command('@input /macro book 2; wait .1; input /macro set 2')
end

function set_lockstyle()
	send_command('wait 1; input /lockstyleset 11')
end