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
	sets.pet_midcast = {}
    sets.aftercast = {}             -- leave this empty
	
	sets.melee = {}
	sets.JA = {}
	sets.WS = {}
	
	
	-- Precast --
	sets.precast.FC = {}

    sets.precast.Cure = set_combine(sets.precast.FC, {
        ear2="Mendi. Earring", --5
    })
	
	-- Midcast --
	
	-- BP Timer Gear
    -- Use BP Recast Reduction here, along with Avatar's Favor gear.
    -- Avatar's Favor skill tiers are 512 / 575 / 670.
	sets.midcast.BP = {
		--main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
		body="Con. Doublet +2",
	}
	
	sets.pet_midcast.BPD = {
		main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
		sub="Umbra Strap",
		ammo={ name="Epitaph", augments={'Path: A',}},
		head="Beckoner's Horn +2",
		body="Con. Doublet +2",
		hands="Asteria Mitts +1",
		legs="Avatara Slops",
		feet="Apogee Pumps +1",
		neck="Adad Amulet",
		waist="Incarnation Sash",
		left_ear="Evans Earring",
		right_ear={ name="Beck. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+11 Pet: Rng. Acc.+11','Pet: Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Defending Ring",
		--left_ring="Mephitas's Ring",
		right_ring="Evoker's Ring",
		back="Conveyance Cape",
	}
	
	sets.midcast.Cure = {
		main="Chatoyant Staff",
		sub="Enki Strap",
		ammo="Ghastly Tathlum +1",
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body="Apo. Dalmatica +1",
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
	sets.aftercast.pet = {
		main={ name="Espiritus", augments={'Enmity-6','Pet: "Mag.Atk.Bns."+30','Pet: Damage taken -4%',}},
		sub="Umbra Strap",
		ammo={ name="Epitaph", augments={'Path: A',}},
		head="Beckoner's Horn +2",
		body="Apo. Dalmatica +1",
		hands="Asteria Mitts +1",
		legs="Assid. Pants +1",
		feet="Apogee Pumps +1",
		neck="Adad Amulet",
		waist="Lucidity Sash",
		left_ear="Evans Earring",
		right_ear={ name="Beck. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Pet: Accuracy+11 Pet: Rng. Acc.+11','Pet: Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Defending Ring",
		--left_ring="Mephitas's Ring",
		right_ring="Evoker's Ring",
		back="Conveyance Cape",
	}
	
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
	if spell.type:match("BloodPact") then
        equip(sets.midcast.BP)
        
	end
end

function pet_midcast(spell)
	--if not LagMode then
        equipBPGear(spell.name)
    --end
end

function equipBPGear(spell)
	equip(sets.pet_midcast.BPD)
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
	equip(sets.aftercast.pet)
	check_cp_cape()
end
 
function status_change(new,old)
	if new=='Resting' then
		equip(sets.aftercast.pet)
		equip({waist="Qiqirn sash"})
	else
		idle()
	end
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