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
include('spellmap.lua')

DTMode = M{'normal', 'hybrid'}
MspeedMode = M{'idle','locked','off'}

Blu_Macc_Mdmg = S{ 'Magical', 'BluAcc', 'Breath', 'BluSkill', 'Healing' }

time_start = 0

function get_sets()
	-- set keybinds --
	send_command('bind f9 gs c dt mode')
	send_command('bind f12 gs c lock rings')
	ring_lock = false
	
	send_command('bind ^f9 gs c toggle movespeed') 	--ctrl+f9 gs toggle movespeed
	send_command('bind ^f10 gs c lock movespeed') 	--ctrl+f10 lock movespeed
	
	function file_unload()
		send_command('unbind f9')
        send_command('unbind f12')
		
		send_command('unbind ^f9')
        send_command('unbind ^f10')
	end
		
	set_default_macro_book()
	set_lockstyle()
	
	-- Start of sets --
	sets.idle = {} 					-- Leave this empty.
	sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty
	
	sets.melee = {}
	sets.JA = {}
	sets.WS = {}
	
	-- Precast --
	sets.precast.FC = { --62% without head augments
		ammo="Sapience Orb",
		head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
		body="Hashishin Mintan +2",
		hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
		legs="Aya. Cosciales +2",
		feet="Carmine Greaves",
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}
	
	-- Micast --
	sets.midcast.BluEnhancing = {
		ammo="Mavi Tathlum",
		head={ name="Luh. Keffiyeh +1", augments={'Enhances "Convergence" effect',}},
		body="Assim. Jubbah +3",
		hands="Hashi. Bazu. +1",
		legs="Hashishin Tayt +1",
		feet={ name="Luhlaza Charuqs", augments={'Enhances "Diffusion" effect',}},
		neck={ name="Mirage Stole +1", augments={'Path: A',}},
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}
	sets.midcast['Occultation'] = sets.midcast.BluEnhancing
	
	sets.midcast.BluMagical = {
	    ammo="Ghastly Tathlum +1",
		body={ name="Cohort Cloak +1", augments={'Path: A',}},
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
		feet={ name="Herculean Boots", augments={'Attack+26','Weapon skill damage +1%','DEX+15','Accuracy+8',}},
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Kishar Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}
	
	
	-- Idle & engaged sets --
	sets.melee.normal = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body={ name="Adhemar Jacket +1", augments={'STR+12','DEX+12','Attack+20',}},
		hands="Malignance Gloves",
		legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Weapon skill damage +2%','INT+5','Mag. Acc.+2',}},
		feet={ name="Herculean Boots", augments={'Attack+26','Weapon skill damage +1%','DEX+15','Accuracy+8',}},
		neck={ name="Mirage Stole +1", augments={'Path: A',}},
		waist="Windbuffet Belt +1",
		left_ear="Brutal Earring",
		right_ear="Suppanomimi",
		left_ring="Epona's Ring",
		right_ring="Defending Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+2','Weapon skill damage +10%',}},
	}
	
	-- For hybrid set you can switch to Sakpata Sword if needed for approx 41% total dt.
	sets.melee.hybrid = set_combine(sets.melee.normal, {body="Hashishin Mintan +2",legs={ name="Nyame Flanchard", augments={'Path: B',}},})
	
	sets.idle.normal = set_combine(sets.melee.normal, {body="Hashishin Mintan +2",})
	sets.idle.hybrid = set_combine(sets.melee.hybrid, {body="Hashishin Mintan +2",})
	sets.idle.movespeed = {}
	
	
	-- JobAbility sets --
	sets.JA['example'] = {}
	
	-- Weapon Skill sets --
	sets.WS['Savage Blade'] = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Hashishin Kavuk +2",
		body="Assim. Jubbah +3",
		hands="Jhakri Cuffs +2",
		legs={ name="Luhlaza Shalwar +3", augments={'Enhances "Assimilation" effect',}},
		---legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Herculean Boots", augments={'Attack+26','Weapon skill damage +1%','DEX+15','Accuracy+8',}},
		neck={ name="Mirage Stole +1", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Rufescent Ring",
		right_ring="Karieyh Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+2','Weapon skill damage +10%',}},
	}
	sets.WS['Chant du Cygne'] = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head={ name="Adhemar Bonnet +1", augments={'STR+12','DEX+12','Attack+20',}},
		body="Gleti's Cuirass",
		hands="Gleti's Gauntlets",
		legs="Gleti's Breeches",
		feet="Gleti's Boots",
		neck={ name="Mirage Stole +1", augments={'Path: A',}},
		waist="Fotia Belt",
		left_ear="Mache Earring +1",
		right_ear="Odr Earring",
		left_ring="Epona's Ring",
		right_ring="Thundersoul Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+2','Weapon skill damage +10%',}},
	}
	
end

function precast(spell)
	--check_cp_cape()

	if spell.name:match('Cure') or spell.name:match('Cura') then
		--equip(sets.precast.Cure)
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

function midcast(spell)
	if spell.skill == 'Blue Magic' then
		local spellmap = blu_map[spell.name]
		if spellmap ~= null then
			send_command('@input /echo spellmap = '..tostring(spellmap))
		end
		
		if sets.midcast[spell.name] then
			equip(sets.midcast[spell.name])
		elseif spellmap == 'Buffs' or spellmap == 'BluSkill' then
			equip(sets.midcast.BluEnhancing)
			
		elseif Blu_Macc_Mdmg:contains(spellmap) then
			-- equip set for magic based, macc, skill etc... to be expanded later.
			equip(sets.midcast.BluMagical)
		elseif spellmap == 'Physical' then
			--equip physical sets
		end
		
	end
	
end

function aftercast(spell)
	idle()
end

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

	-- Keybinds for reference --
	-- f9: Toggle dt mode
	-- f12: Lock both ring slots
	-- 	default ring_lock = false

	-- ctrl+f9 toggle movespeed
	-- ctrl+f10 lock movespeed
	
function self_command(command)
	local commandArgs = command:lower()	
	
	-- command to set combat mode for acc dt and hybrid modes --
	if commandArgs == 'dt mode' then
		DTMode:cycle()
		send_command('@input /echo DT mode: '..tostring(DTMode.current))		
	
	-- handle equiping and locking movement speed gear --
	elseif commandArgs == 'toggle movespeed' then
		if MspeedMode.current ~= 'idle' then
			MspeedMode:set('idle')
			send_command('@input /echo movespeed set to idle')
		elseif MspeedMode.current ~= 'off' then
			MspeedMode:set('off')
			send_command('@input /echo movespeed equip disabled')
		end
	
	elseif commandArgs == 'lock movespeed' then
		if MspeedMode.current ~= 'locked' then
			MspeedMode:set('locked')
		end	
		send_command('@input /echo movespeed equip locked')
		
	-- handle equiping and locking experience and warp rings --
	elseif commandArgs == 'lock rings' then
		--toggle_ring_lock()
	end
	idle()
end

function auto_cp()
	if windower.ffxi.get_mob_by_target('t') then
		target = windower.ffxi.get_mob_by_target('t')
		
		if (target.name:match("Apex") or target.name:match("Locus")) and target.hpp < 20 then
			equip({back="Mecisto. Mantle"})
			disable("back")
		else
			enable("back")
		end
	end
end


    windower.register_event('prerender', function()
        --Items we want to check every second
        if os.time() > time_start then
            time_start = os.time()
            auto_cp()
        end
    end)

function sub_job_change(new,old)
	if new ~= old then 
		set_lockstyle()
	end
end

function set_default_macro_book()
	send_command('@input /macro book 6; wait .1; input /macro set 1')
end

function set_lockstyle()
	send_command('wait 3; input /lockstyleset 81')
end