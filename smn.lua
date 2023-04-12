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
--include('spellmap.lua')
IdleMode = M{'dt','refresh'}
MspeedMode = M{'idle','locked','off'}

function get_sets()
	-- set keybinds --
	send_command('bind f9 gs c idle mode')
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
	
	
	sets.idle = {} 					-- Leave this empty.
	sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty
	sets.pet_midcast = {}
    sets.aftercast = {}             -- leave this empty
	
	sets.melee = {}
	sets.JA = {}
	sets.WS = {}
	
	
	-- Precast --
	sets.precast.FC = {
		main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
		sub="Umbra Strap",
		--sub="Elan Strap +1"
		ammo={ name="Epitaph", augments={'Path: A',}},
		head="Beckoner's Horn +2",
		body="Beck. Doublet +2",
		hands="Asteria Mitts +1",
		legs="Assid. Pants +1",
		feet="Beck. Pigaches +2",
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear={ name="Beck. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+11 Pet: Rng. Acc.+11','Pet: Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		--back="Conveyance Cape",
	}

    sets.precast.Cure = set_combine(sets.precast.FC, {
        ear2="Mendi. Earring", --5
    })
	
	-- Midcast --
	
	-- BP Timer Gear
    -- Use BP Recast Reduction here, along with Avatar's Favor gear.
    -- Avatar's Favor skill tiers are 512 / 575 / 670.
	sets.midcast.BP = {
		--main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
		body="Con. Doublet +3",
	}
	
	sets.pet_midcast.Physical = {
		main={ name="Gridarvor", augments={'Pet: Accuracy+70','Pet: Attack+70','Pet: "Dbl. Atk."+15',}},
		sub="Elan Strap +1",
		ammo={ name="Epitaph", augments={'Path: A',}},
		head="Beckoner's Horn +2",
		body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Blood Pact Dmg.+10','Pet: Mag. Acc.+1','Pet: "Mag.Atk.Bns."+4',}},
		legs="Avatara Slops",
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		neck="Adad Amulet",
		waist="Incarnation Sash",
		left_ear="Evans Earring",
		right_ear={ name="Beck. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+11 Pet: Rng. Acc.+11','Pet: Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10',}},
	}

	sets.pet_midcast.Mdmg = {
		main={ name="Grioavolr", augments={'Blood Pact Dmg.+8','Pet: VIT+2','Pet: Mag. Acc.+18','Pet: "Mag.Atk.Bns."+23',}},
		sub="Elan Strap +1",
		ammo={ name="Epitaph", augments={'Path: A',}},
		head="Beckoner's Horn +2",
		body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		hands={ name="Merlinic Dastanas", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Blood Pact Dmg.+10','Pet: Mag. Acc.+1','Pet: "Mag.Atk.Bns."+4',}},
		legs="Avatara Slops",
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		neck="Adad Amulet",
		waist="Incarnation Sash",
		left_ear="Evans Earring",
		right_ear={ name="Beck. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+11 Pet: Rng. Acc.+11','Pet: Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Varar Ring +1",
		right_ring="Varar Ring +1",
		back={ name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','Pet: Magic Damage+10',}},
	}
	
	sets.pet_midcast.Hybrid = set_combine(sets.pet_midcast.Mdmg, {
        body="Con. Doublet +3",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10',}},
    })
	
	sets.pet_midcast.SummoningSkill = {
		main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
		sub="Umbra Strap",
		ammo={ name="Epitaph", augments={'Path: A',}},
		head="Beckoner's Horn +2",
		body="Beck. Doublet +2",
		hands="Lamassu Mitts +1",
		legs="Beck. Spats +2",
		feet="Beck. Pigaches +2",
		neck="Incanter's Torque",
		waist="Lucidity Sash",
		left_ear="Andoaa Earring",
		right_ear={ name="Beck. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+11 Pet: Rng. Acc.+11','Pet: Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Defending Ring",
		right_ring="Evoker's Ring",
		back={ name="Conveyance Cape", augments={'Summoning magic skill +2','Blood Pact Dmg.+3','Blood Pact ab. del. II -2',}},
	}
	
	sets.midcast.Cure = {
		main="Chatoyant Staff",
		sub="Enki Strap",
		ammo="Ghastly Tathlum +1",
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		--body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		hands="Asteria Mitts +1",
		legs="Assid. Pants +1",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Nodens Gorget",
		waist="Lucidity Sash",
		left_ear="Etiolation Earring",
		right_ear="Mendi. Earring",
		left_ring="Defending Ring",
		--left_ring="Mephitas's Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back="Fi Follet Cape +1",
	}
	
	-- Main perpetuation set --
	sets.aftercast.refresh = {
		main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
		sub="Umbra Strap",
		ammo={ name="Epitaph", augments={'Path: A',}},
		head="Beckoner's Horn +2",
		body={ name="Apo. Dalmatica +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		hands="Asteria Mitts +1",
		legs="Assid. Pants +1",
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		neck="Adad Amulet",
		waist="Lucidity Sash",
		left_ear="Evans Earring",
		right_ear={ name="Beck. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+11 Pet: Rng. Acc.+11','Pet: Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Defending Ring",
		right_ring="Evoker's Ring",
		back={ name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+10',}},
	}
	
	sets.aftercast.dt = set_combine(sets.aftercast.refresh, {
        body="Beck. Doublet +2",
		feet="Beck. Pigaches +2",
    })
	
	-- Idle & engaged sets --
	sets.melee.normal = {}
	sets.melee.acc  = {}
	sets.melee.pdt = {}
	sets.idle.acc = {}
	sets.idle.pdt = {}
	
	sets.idle.movespeed = {}
	
	
	-- JobAbility sets --
	sets.JA['example'] = {}
	
	-- Weapon Skill sets --
	sets.WS['example'] = {}
	
end

Magic_BPs = S{'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Clarsach Call','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen','Holy Mist','Nether Blast','Zantetsuken',
'Night Terror','Thunderspark','Tornado II','Sonic Buffet','Impact','Conflag Strike','Level ? Holy','Lunar Bay','Meteorite','Meteor Strike','Geocrush','Grand Fall','Wind Blade','Heavenly Strike','Thunderstorm',
'Fire II','Fire IV','Stone II','Stone IV','Water II','Water IV','Aero II','Aero IV','Blizzard II','Blizzard IV','Thunder II','Thunder IV'}

function precast(spell)
	if (pet.isvalid and pet_midaction() and not spell.type=="SummonerPact") or spell.type=="Item" then
		--send_command("@input /echo Gearswap cancelled (pet mid action)...")
        return
    end

	check_cp_cape()
	if spell.name:match('Cure') or spell.name:match('Cura') then
		--equip(sets.precast.Cure)
	elseif spell.action_type == 'Magic' then
		equip(sets.precast.FC)
	end
end

function midcast(spell)
	if (pet.isvalid and pet_midaction()) or spell.type=="Item" then
        return
    end
	
	-- temp basic rules to be tweaked and added to over time...
	if spell.name:match('Cure') or spell.name:match('Cura') then
		equip(sets.midcast.Cure)
		check_weather(spell)
	end
	-- BP -duration gear equiped here. BP potency equiped during pet_midcast.
	if spell.type:match("BloodPact") then
        equip(sets.midcast.BP)
        
	end
end

function pet_midcast(spell)
	--if not LagMode then
        equipBPGear(spell)
    --end
end

function equipBPGear(spell)
	if spell.type == 'BloodPactWard' then
		equip(sets.pet_midcast.SummoningSkill)
		
	elseif spell.name == 'Flaming Crush' then  -- also Burning Strike?
		equip(sets.pet_midcast.Hybrid)
	elseif Magic_BPs:contains(spell.name) then
		equip(sets.pet_midcast.Mdmg)
		send_command('@input /echo Magic BP used.')	
	else -- BP is physical
		equip(sets.pet_midcast.Physical)
		send_command('@input /echo Physical BP used.')
	end
end

function aftercast(spell)
	if spell.type:match("BloodPact") or pet_midaction() or spell.type=="Item" then
        return
	else
		idle()
	end
end

function pet_aftercast(spell)
	idle()
end

function idle()
	equip(sets.aftercast[IdleMode.current])
	check_cp_cape()
end

--[[
function idle()

	if player.status=='Engaged' then
		equip(sets.melee[DTMode.current])
	else
		equip(sets.idle[DTMode.current])
		if MspeedMode.current ~= 'off' then  
			equip({legs="Crimson Cuisses"}) -- Heralds Gaiter's 
		end
	end
	check_cp_cape()
end
]]--

function status_change(new,old)
	if new=='Resting' then
		idle()
		equip({waist="Qiqirn sash"})
	else
		idle()
	end
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
	if commandArgs == 'idle mode' then
		IdleMode:cycle()
		send_command('@input /echo Idle mode: '..tostring(IdleMode.current))		
	
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

--[[function buff_change(buff, gain) 
	
end]]--

--[[function sub_job_change(new,old)
	if new ~= old then 
		set_lockstyle()
	end
end]]--

function check_weather(spell)
	if spell.element == world.weather_element or spell.element == world.day_element then
		equip({waist='Hachirin-no-Obi'})
	end
end

function check_cp_cape()
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

function set_default_macro_book()
	send_command('@input /macro book 7; wait .1; input /macro set 1')
end

function set_lockstyle()
	send_command('wait 1; input /lockstyleset 71')
end