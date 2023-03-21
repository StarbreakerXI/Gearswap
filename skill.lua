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
		
	--set_default_macro_book()
	--set_lockstyle()
	
	
	sets.idle = {} 					-- Leave this empty.
	sets.precast = {}               -- leave this empty    
    sets.midcast = {}               -- leave this empty    
    sets.aftercast = {}             -- leave this empty
	
	sets.melee = {}
	sets.JA = {}
	sets.WS = {}
	avatar = "Carbuncle"
	
end

function precast(spell)
	if pet.isvalid and spell.name ~= 'Release' then
		cancel_spell()
		send_command('wait 1.0;input /ja "Release" <me>')
	elseif spell.type == 'SummonerPact' then
		avatar = spell.name
		local recast = windower.ffxi.get_spell_recasts()[spell.recast_id]
		if recast > 0 then
			cancel_spell()
			send_command('wait '..tostring(recast+0.5)..';input /ma "'..avatar..'" <me>')
		end
	end
	return
end

function midcast(spell)
	
end

function aftercast(spell)
	
	if spell.type == 'SummonerPact' then
		send_command('wait 3;input /ja "Release" <me>')
	elseif player.mp > 70  then
		send_command('wait 1;input /ma "'..avatar..'" <me>')
	else
		send_command('wait 1;input /heal')
	end



	--[[if pet.isvalid and spell.name ~= 'Release' then
		send_command('wait 1.0;input /ja "Release" <me>')
	elseif spell.type == 'SummonerPact' then
		local recast = windower.ffxi.get_spell_recasts()[spell.recast_id]
		if recast > 0 then
			cancel_spell()
			send_command('wait '..tostring(recast+0.5)..';input /ma "'..avatar..'" <me>')
		end
	end]]--
	return
end

 
function status_change(new,old)

end

function summon_avatar(spell)
	
end
--[[function buff_change(buff, gain) 
	
end]]--