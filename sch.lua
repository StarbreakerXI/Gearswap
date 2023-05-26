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
DTMode = M{'normal', 'pdt'}
AccMode = M{'normal', 'acc'}
MspeedMode = M{'idle','locked','off'}

Ebullience = false

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
	
	
	-- Precast --
	sets.precast.oldFC = {
		ammo="Incantor Stone",
		head="Agwu's Cap",
		body={ name="Pedagogy Gown", augments={'Enhances "Enlightenment" effect',}},
		hands={ name="Peda. Bracers +1", augments={'Enh. "Tranquility" and "Equanimity"',}},
		legs="Agwu's Slops",
		feet={ name="Peda. Loafers", augments={'Enhances "Stormsurge" effect',}},
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		back="Fi Follet Cape +1",
	}
	
	sets.precast.FC = {
		main={ name="Pedagogy Staff", augments={'Path: C',}},
		ammo="Incantor Stone",
		head={ name="Psycloth Tiara", augments={'Mag. Acc.+20','"Fast Cast"+10','INT+7',}},
		body={ name="Pedagogy Gown", augments={'Enhances "Enlightenment" effect',}},
		hands="Acad. Bracers +2",
		legs="Agwu's Slops",
		feet={ name="Peda. Loafers +2", augments={'Enhances "Stormsurge" effect',}},
		neck="Voltsurge Torque",
		waist="Embla Sash",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Kishar Ring",
		right_ring="Prolix Ring",
		back="Fi Follet Cape +1",
	}

    sets.precast['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
    sets.precast['Elemental Magic'] = set_combine(sets.precast.FC, {})
		--sets.precast.FC.Grimoire = {head="Peda. M.Board +3", feet="Acad. Loafers +3"}
    sets.precast.Cure = set_combine(sets.precast.FC, {
        ear2="Mendi. Earring", --5
    })
	
	-- Midcast --
	sets.midcast.Cure = {
		main="Chatoyant Staff",
		sub="Enki Strap",
		ammo="Ghastly Tathlum +1",
		head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body="Arbatel Gown +2",
		hands={ name="Peda. Bracers +1", augments={'Enh. "Tranquility" and "Equanimity"',}},
		legs="Acad. Pants +2",
		feet={ name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}},
		neck="Nodens Gorget",
		waist="Hachirin-no-Obi",
		left_ear="Etiolation Earring",
		right_ear="Mendi. Earring",
		left_ring="Mephitas's Ring",
		right_ring="Metamor. Ring +1",
		back="Fi Follet Cape +1",
	}
	
	sets.midcast['Enhancing Magic'] = {
		main={ name="Pedagogy Staff", augments={'Path: C',}},
		sub="Enki Strap",
		head="Arbatel Bonnet +2",
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +8',}},
		hands="Arbatel Bracers +2",
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'"Regen" potency+3',}},
		waist="Embla Sash",
		back={ name="Bookworm's Cape", augments={'INT+2','MND+2','"Regen" potency+10',}},
	}
	
	sets.midcast['Stoneskin'] = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Nodens Gorget",
		waist="Siegel Sash",
	})
	
	sets.midcast['Dark Magic'] = {
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
		sub="Enki Strap",
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		body="Arbatel Gown +2",
		hands="Arbatel Bracers +2",
		legs="Agwu's Slops",
		feet="Arbatel Loafers +2",
		neck="Erra Pendant",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear={ name="Arbatel Earring", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+10',}},
		left_ring="Evanescence Ring",
		right_ring="Archon Ring",
		back={ name="Bookworm's Cape", augments={'INT+5','MND+1','Helix eff. dur. +19',}},
	}
	
	sets.midcast.elemental = {
		main={ name="Akademos", augments={'INT+15','"Mag.Atk.Bns."+15','Mag. Acc.+15',}},
		sub="Enki Strap",
		ammo="Ghastly Tathlum +1",
		head="Agwu's Cap",
		body="Arbatel Gown +2",
		hands="Arbatel Bracers +2",
		legs="Agwu's Slops",
		feet="Arbatel Loafers +2",
		neck={ name="Argute Stole +1", augments={'Path: A',}},
		waist="Eschan Stone",
		--waist='Hachirin-no-Obi',
		left_ear="Friomisi Earring",
		right_ear={ name="Arbatel Earring", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+10',}},
		left_ring="Kishar Ring",
		right_ring="Metamor. Ring +1",
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
	}
	
	sets.midcast['Ebullience'] = set_combine( sets.midcast.elemental,
		{head="Arbatel Bonnet +2",
	})
	
	
	sets.midcast.helix = set_combine( sets.midcast.elemental, {
		waist="Eschan Stone",
	})
	
	-- Idle & engaged sets --
	sets.melee.normal = {}
	sets.melee.acc  = {}
	sets.melee.pdt = {}
	
	sets.idle.normal = {}
	sets.idle.acc = {}
	sets.idle.pdt = {}
	
	sets.idle.movespeed = {}
	
	
	-- JobAbility sets --
	sets.JA['example'] = {}
	
	-- Weapon Skill sets --
	sets.WS['Myrkr'] = {
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		body="Arbatel Gown +2",
		hands={ name="Peda. Bracers +1", augments={'Enh. "Tranquility" and "Equanimity"',}},
		legs="Helios Spats",
		feet="Arbatel Loafers +2",
		neck="Nodens Gorget",
		waist="Qiqirn Sash",
		left_ear="Etiolation Earring",
		right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
		left_ring="Mephitas's Ring",
		right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		back="Pahtli Cape",
	}
	
end

function precast(spell)
	check_cp_cape()

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

function midcast(spell)
	local spellmap = get_spell_map(spell)
	if spellmap ~= null then
		send_command('@input /echo spellmap = '..tostring(spellmap))
	end
	
	if spell.name == "Ebullience" then
		Ebullience = true
	end
	-- temp basic rules to be tweaked and added to over time...
	if spell.name:match('Cure') or spell.name:match('Cura') then
		equip(sets.midcast.Cure)
		check_weather(spell)
	elseif sets.midcast[spell.name] then
		equip(sets.midcast[spell.name])
	elseif sets.midcast[spell.skill] then
		equip(sets.midcast[spell.skill])
		
	elseif spellmap == 'Helix' then
		equip(sets.midcast.helix) 
	elseif spell.type == 'BlackMagic' then
	
		--if buffactive['Ebullience'] then
		if Ebullience then
			--equip({head="Arbatel Bonnet +2"})
			equip(sets.midcast['Ebullience'])
			--send_command('@input /echo Ebullience gear equiped')
		else
			equip(sets.midcast.elemental)
			--send_command('@input /echo Ebullience gear not equiped!')
		end
		check_weather(spell)
	end
	--[[if buff.active('Perpetuance') then 
		equip({hands="Arbatel Bracers +2"})
	end]]--
end

function aftercast(spell)
	check_cp_cape()
	idle()
end

function idle()
	if player.status=='Engaged' then
		equip(sets.melee[AccMode.current])
		if DTMode.current ~= 'normal' then
		equip(sets.melee[DTMode.current]) end
		equip(sets.idle[AccMode.current])
		if DTMode.current ~= 'normal' then
		equip(sets.melee[DTMode.current]) end
		if MspeedMode.current ~= 'off' then 
			--equip({}) 
		end
	end
	
end
 
function status_change(new,old)
	if new=='Resting' then
		equip({waist="Qiqirn sash"})
	else
		idle()
	end
	--send_command('@input /echo '..player.status)
end

function buff_change(buff, gain) 
	if buff == 'Ebullience' and not gain then
		Ebullience = false
	end
end

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
	send_command('@input /macro book 5; wait .1; input /macro set 1')
end

function set_lockstyle()
	send_command('wait 1; input /lockstyleset 61')
end