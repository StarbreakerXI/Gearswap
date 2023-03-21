-------------------------------------
---------                   ---------
------                         ------
---         Start of Maps         ---
------                         ------
---------                   ---------
------------------------------------- 

-------------------------
--   BLU Spells List   --
-------------------------
blu_map = {
	--PhysicalSpells
	['Asuran Claws']='Physical', ['Bilgestorm']='Physical', ['Bludgeon']='Physical', ['Body Slam']='Physical', ['Feather Storm']='Physical', ['Mandibular Bite']='Physical', ['Queasyshroom']='Physical',
    ['Power Attack']='Physical', ['Ram Charge']='Physical', ['Saurian Slide']='Physical', ['Screwdriver']='Physical', ['Sickle Slash']='Physical', ['Smite of Rage']='Physical',
    ['Spinal Cleave']='Physical', ['Spiral Spin']='Physical', ['Sweeping Gouge']='Physical', ['Terror Touch']='Physical', ['Battle Dance']='Physical', ['Bloodrake']='Physical',
    ['Death Scissors']='Physical', ['Dimensional Death']='Physical', ['Empty Thrash']='Physical', ['Quadrastrike']='Physical', ['Uppercut']='Physical', ['Tourbillion']='Physical',
    ['Thrashing Assault']='Physical', ['Vertical Cleave']='Physical', ['Whirl of Rage']='Physical', ['Amorphic Spikes']='Physical', ['Barbed Crescent']='Physical',
    ['Claw Cyclone']='Physical', ['Disseverment']='Physical', ['Foot Kick']='Physical', ['Frenetic Rip']='Physical', ['Goblin Rush']='Physical', ['Hysteric Barrage']='Physical',
    ['Paralyzing Triad']='Physical', ['Seedspray']='Physical', ['Sinker Drill']='Physical', ['Vanity Dive']='Physical', ['Cannonball']='Physical', ['Delta Thrust']='Physical',
    ['Glutinous Dart']='Physical', ['Grand Slam']='Physical', ['Quad. Continuum']='Physical', ['Benthic Typhoon']='Physical', ['Helldive']='Physical',
    ['Hydro Shot']='Physical', ['Jet Stream']='Physical', ['Pinecone Bomb']='Physical', ['Wild Oats']='Physical', ['Heavy Strike']='Physical',
	--MagicalSpells
    ['Acrid Stream']='Magical', ['Anvil Lightning']='Magical', ['Crashing Thunder']='Magical', ['Charged Whisker']='Magical', ['Droning Whirlwind']='Magical',
    ['Firespit']='Magical', ['Foul Waters']='Magical', ['Gates of Hades']='Magical', ['Leafstorm']='Magical', ['Molting Plumage']='Magical', ['Magic Barrier']='Magical', ['Nectarous Deluge']='Magical',
    ['Polar Roar']='Magical', ['Regurgitation']='Magical', ['Rending Deluge']='Magical', ['Scouring Spate']='Magical', ['Searing Tempest']='Magical', ['Silent Storm']='Magical',
    ['Spectral Floe']='Magical', ['Subduction']='Magical', ['Sudden Lunge']='Magical', ['Tem. Upheaval']='Magical', ['Thermal Pulse']='Magical', ['Thunderbolt']='Magical', ['Uproot']='Magical',
    ['Water Bomb']='Magical', ['Atra. Libations']='Magical', ['Blood Saber']='Magical', ['Dark Orb']='Magical', ['Death Ray']='Magical', ['Eyes On Me']='Magical', ['Blazing Bound']='Magical',
    ['Evryone. Grudge']='Magical', ['Palling Salvo']='Magical', ['Tenebral Crush']='Magical', ['Blinding Fulgor']='Magical', ['Diffusion Ray']='Magical', ['Ice Break']='Magical',
    ['Magic Hammer']='Magical', ['Rail Cannon']='Magical', ['Retinal Glare']='Magical', ['Embalming Earth']='Magical', ['Entomb']='Magical', ['Sandspin']='Magical', ['Vapor Spray']='Magical',  ['Osmosis']='Magical',
	['Feather Tickle']='Magical', ['Reaving Wind']='Magical',
	--Accuracy
	['1000 Needles']='BluAcc', ['Absolute Terror']='BluAcc', ['Auroral Drape']='BluAcc', ['Awful Eye']='BluAcc', ['Blastbomb']='BluAcc', ['Blank Gaze']='BluAcc', ['Blistering Roar']='BluAcc', ['Blitzstrahl']='BluAcc',
	['Blood Drain']='BluAcc', ['Blood Saber']='BluAcc', ['Chaotic Eye']='BluAcc', ['Cimicine Discharge']='BluAcc', ['Cold Wave']='BluAcc', ['Digest']='BluAcc', ['Corrosive Ooze']='BluAcc',
    ['Demoralizing Roar']='BluAcc', ['Dream Flower']='BluAcc', ['Enervation']='BluAcc', ['Filamented Hold']='BluAcc', ['Frightful Roar']='BluAcc',
    ['Geist Wall']='BluAcc', ['Hecatomb Wave']='BluAcc', ['Infrasonics']='BluAcc', ['Light of Penance']='BluAcc', ['Lowing']='BluAcc', ['Mind Blast']='BluAcc', ['Mortal Ray']='BluAcc',
    ['MP Drainkiss']='BluAcc', ['Sheep Song']='BluAcc', ['Soporific']='BluAcc', ['Sound Blast']='BluAcc', ['Sprout Smack']='BluAcc', ['Stinking Gas']='BluAcc', ['Osmosis']='BluAcc', ['Cruel Joke']='BluAcc',
	--Breath
    ['Bad Breath']='Breath', ['Flying Hip Press']='Breath', ['Final Sting']='Breath', ['Frost Breath']='Breath', ['Heat Breath']='Breath', ['Magnetite Cloud']='Breath',
    ['Poison Breath']='Breath', ['Radiant Breath']='Breath', ['Self Destruct']='Breath', ['Thunder Breath']='Breath', ['Vapor Spray']='Breath', ['Wind Breath']='Breath',
	--Buffs
    ['Barrier Tusk']='Buffs', ['Battery Charge']='Buffs', ['Cocoon']='Buffs', ['Carcharian Verve']='Buffs', ['Erratic Flutter']='Buffs', ['Harden Shell']='Buffs', ['Orcish Counterstance']='Buffs',
    ['Plasma Charge']='Buffs', ['Pyric Bulwark']='Buffs', ['Memento Mori']='Buffs', ['Mighty Guard']='Buffs', ['Nat. Meditation']='Buffs', ['Reactor Cool']='Buffs', ['Saline Coat']='Buffs', 
    ['Feather Barrier']='Buffs',['Refueling']='Buffs', ['Warm-Up']='Buffs', ['Zephyr Mantle']='Buffs', ['Reactor Cool']='Buffs', ['Amplification']='Buffs',   
--- Occultation gets it's own set ---
    --BluSkill
    ['Diamondhide']='BluSkill', ['Metallic Body']='BluSkill', ['Magic Barrier']='BluSkill', ['Atra. Libations']='BluSkill',
	--Healing
    ['Healing Breeze']='Healing', ['Magic Fruit']='Healing', ['Plenilune Embrace']='Healing', ['Pollen']='Healing', ['Restoral']='Healing', ['Wild Carrot']='Healing',
--- Acc + Macc + FC "Stun" set ---
	--Stun
    --['Frypan']='Stun', ['Head Butt']='Stun', ['Sudden Lunge']='Stun', ['Tail slap']='Stun', ['Sub-zero Smash']='Stun', ['Sweeping Gouge']='Stun', -- Duplicates of Subben Linge and Sweeping Gouge. Use alt method?
    --Enmity
    --['Actinic Burst']='Enmity', ['Exuviation']='Enmity', ['Fantod']='Enmity', ['Jettatura']='Enmity', ['Temporal Shift']='Enmity',
	--FastRecast
	--['Osmosis']='FastRecast', ['Feather Tickle']='FastRecast', ['Reaving Wind']='FastRecast', 
}

--[[
--Place spells into either Physical or Magical, and then further seperate them into type--
function maps()
    STR = S {
        'Asuran Claws', 'Bilgestorm', 'Battle Dance', 'Bludgeon', 'Bloodrake', 'Death Scissors', 
        'Dimensional Death', 'Empty Thrash', 'Quadrastrike', 'Uppercut', 'Tourbillion', 'Sinker Drill', 
        'Thrashing Assault', 'Vertical Cleave', 'Whirl of Rage', 'Saurian Slide', 'Sinal Cleave', 
        'Paralyzing Triad'
    }

    DEX = S {
        'Amorphic Spikes', 'Barbed Crescent', 'Claw Cyclone', 'Disseverment', 'Foot Kick',
        'Frenetic Rip', 'Goblin Rush', 'Hysteric Barrage', 'Seedspray',
        'Vanity Dive'
    }

    VIT = S {
        'Cannonball', 'Delta Thrust', 'Glutinous Dart', 'Grand Slam', 'Quad. Continuum',
        'Sprout Smack'
    }

    AGI = S {
        'Benthic Typhoon', 'Helldive', 'Hydro Shot', 'Jet Stream', 'Pinecone Bomb', 'Wild Oats',
        'Spiral Spin'
    }

    --All nuking spells go here then they are filtered specifically. Add accordingly
	
	Dark = S {
        'Blood Saber', 'Dark Orb', 'Death Ray', 'Eyes On Me',
        'Evryone. Grudge', 'Palling Salvo', 'Tenebral Crush'
    }

    Light = S {
        'Blinding Fulgor', 'Diffusion Ray', 'Magic Hammer', 'Rail Cannon', 'Retinal Glare'
    }

    Earth = S {
        'Embalming Earth', 'Entomb', 'Sandspin'
    }
]]--

-------------------------------------------------------------------------------------------------------------------
-- Spell mappings allow defining a general category or description that each of sets of related
-- spells all fall under.
-------------------------------------------------------------------------------------------------------------------

spell_map = {
    ['Cure']='Cure',['Cure II']='Cure',['Cure III']='Cure',['Cure IV']='Cure',['Cure V']='Cure',['Cure VI']='Cure',
    ['Full Cure']='Cure',
    ['Cura']='Curaga',['Cura II']='Curaga',['Cura III']='Curaga',
    ['Curaga']='Curaga',['Curaga II']='Curaga',['Curaga III']='Curaga',['Curaga IV']='Curaga',['Curaga V']='Curaga',
    -- Status Removal doesn't include Esuna or Sacrifice, since they work differently than the rest
    ['Poisona']='StatusRemoval',['Paralyna']='StatusRemoval',['Silena']='StatusRemoval',['Blindna']='StatusRemoval',['Cursna']='StatusRemoval',
    ['Stona']='StatusRemoval',['Viruna']='StatusRemoval',['Erase']='StatusRemoval',
    ['Barfire']='BarElement',['Barstone']='BarElement',['Barwater']='BarElement',['Baraero']='BarElement',['Barblizzard']='BarElement',['Barthunder']='BarElement',
    ['Barfira']='BarElement',['Barstonra']='BarElement',['Barwatera']='BarElement',['Baraera']='BarElement',['Barblizzara']='BarElement',['Barthundra']='BarElement',
    ['Raise']='Raise',['Raise II']='Raise',['Raise III']='Raise',['Arise']='Raise',
    ['Reraise']='Reraise',['Reraise II']='Reraise',['Reraise III']='Reraise',['Reraise IV']='Reraise',
    ['Protect']='Protect',['Protect II']='Protect',['Protect III']='Protect',['Protect IV']='Protect',['Protect V']='Protect',
    ['Shell']='Shell',['Shell II']='Shell',['Shell III']='Shell',['Shell IV']='Shell',['Shell V']='Shell',
    ['Protectra']='Protectra',['Protectra II']='Protectra',['Protectra III']='Protectra',['Protectra IV']='Protectra',['Protectra V']='Protectra',
    ['Shellra']='Shellra',['Shellra II']='Shellra',['Shellra III']='Shellra',['Shellra IV']='Shellra',['Shellra V']='Shellra',
    ['Regen']='Regen',['Regen II']='Regen',['Regen III']='Regen',['Regen IV']='Regen',['Regen V']='Regen',
    ['Refresh']='Refresh',['Refresh II']='Refresh',['Refresh III']='Refresh',
    ['Teleport-Holla']='Teleport',['Teleport-Dem']='Teleport',['Teleport-Mea']='Teleport',['Teleport-Altep']='Teleport',['Teleport-Yhoat']='Teleport',
    ['Teleport-Vahzl']='Teleport',['Recall-Pashh']='Teleport',['Recall-Meriph']='Teleport',['Recall-Jugner']='Teleport',
    ['Valor Minuet']='Minuet',['Valor Minuet II']='Minuet',['Valor Minuet III']='Minuet',['Valor Minuet IV']='Minuet',['Valor Minuet V']='Minuet',
    ["Knight's Minne"]='Minne',["Knight's Minne II"]='Minne',["Knight's Minne III"]='Minne',["Knight's Minne IV"]='Minne',["Knight's Minne V"]='Minne',
    ['Advancing March']='March',['Victory March']='March',
    ['Sword Madrigal']='Madrigal',['Blade Madrigal']='Madrigal',
    ["Hunter's Prelude"]='Prelude',["Archer's Prelude"]='Prelude',
    ['Sheepfoe Mambo']='Mambo',['Dragonfoe Mambo']='Mambo',
    ['Raptor Mazurka']='Mazurka',['Chocobo Mazurka']='Mazurka',
    ['Sinewy Etude']='Etude',['Dextrous Etude']='Etude',['Vivacious Etude']='Etude',['Quick Etude']='Etude',['Learned Etude']='Etude',['Spirited Etude']='Etude',['Enchanting Etude']='Etude',
    ['Herculean Etude']='Etude',['Uncanny Etude']='Etude',['Vital Etude']='Etude',['Swift Etude']='Etude',['Sage Etude']='Etude',['Logical Etude']='Etude',['Bewitching Etude']='Etude',
    ["Mage's Ballad"]='Ballad',["Mage's Ballad II"]='Ballad',["Mage's Ballad III"]='Ballad',
    ["Army's Paeon"]='Paeon',["Army's Paeon II"]='Paeon',["Army's Paeon III"]='Paeon',["Army's Paeon IV"]='Paeon',["Army's Paeon V"]='Paeon',["Army's Paeon VI"]='Paeon',
    ['Fire Carol']='Carol',['Ice Carol']='Carol',['Wind Carol']='Carol',['Earth Carol']='Carol',['Lightning Carol']='Carol',['Water Carol']='Carol',['Light Carol']='Carol',['Dark Carol']='Carol',
    ['Fire Carol II']='Carol',['Ice Carol II']='Carol',['Wind Carol II']='Carol',['Earth Carol II']='Carol',['Lightning Carol II']='Carol',['Water Carol II']='Carol',['Light Carol II']='Carol',['Dark Carol II']='Carol',
    ['Foe Lullaby']='Lullaby',['Foe Lullaby II']='Lullaby',['Horde Lullaby']='Lullaby',['Horde Lullaby II']='Lullaby',
    ['Fire Threnody']='Threnody',['Ice Threnody']='Threnody',['Wind Threnody']='Threnody',['Earth Threnody']='Threnody',['Lightning Threnody']='Threnody',['Water Threnody']='Threnody',['Light Threnody']='Threnody',['Dark Threnody']='Threnody',
    ['Fire Threnody II']='Threnody',['Ice Threnody II']='Threnody',['Wind Threnody II']='Threnody',['Earth Threnody II']='Threnody',['Lightning Threnody II']='Threnody',['Water Threnody II']='Threnody',['Light Threnody II']='Threnody',['Dark Threnody II']='Threnody',
    ['Battlefield Elegy']='Elegy',['Carnage Elegy']='Elegy',
    ['Foe Requiem']='Requiem',['Foe Requiem II']='Requiem',['Foe Requiem III']='Requiem',['Foe Requiem IV']='Requiem',['Foe Requiem V']='Requiem',['Foe Requiem VI']='Requiem',['Foe Requiem VII']='Requiem',
    ['Utsusemi: Ichi']='Utsusemi',['Utsusemi: Ni']='Utsusemi',['Utsusemi: San']='Utsusemi',
    ['Katon: Ichi'] = 'ElementalNinjutsu',['Suiton: Ichi'] = 'ElementalNinjutsu',['Raiton: Ichi'] = 'ElementalNinjutsu',
    ['Doton: Ichi'] = 'ElementalNinjutsu',['Huton: Ichi'] = 'ElementalNinjutsu',['Hyoton: Ichi'] = 'ElementalNinjutsu',
    ['Katon: Ni'] = 'ElementalNinjutsu',['Suiton: Ni'] = 'ElementalNinjutsu',['Raiton: Ni'] = 'ElementalNinjutsu',
    ['Doton: Ni'] = 'ElementalNinjutsu',['Huton: Ni'] = 'ElementalNinjutsu',['Hyoton: Ni'] = 'ElementalNinjutsu',
    ['Katon: San'] = 'ElementalNinjutsu',['Suiton: San'] = 'ElementalNinjutsu',['Raiton: San'] = 'ElementalNinjutsu',
    ['Doton: San'] = 'ElementalNinjutsu',['Huton: San'] = 'ElementalNinjutsu',['Hyoton: San'] = 'ElementalNinjutsu',
    ['Banish']='Banish',['Banish II']='Banish',['Banish III']='Banish',['Banishga']='Banish',['Banishga II']='Banish',
    ['Holy']='Holy',['Holy II']='Holy',['Drain']='Drain',['Drain II']='Drain',['Drain III']='Drain',['Aspir']='Aspir',['Aspir II']='Aspir',
    ['Absorb-Str']='Absorb',['Absorb-Dex']='Absorb',['Absorb-Vit']='Absorb',['Absorb-Agi']='Absorb',['Absorb-Int']='Absorb',['Absorb-Mnd']='Absorb',['Absorb-Chr']='Absorb',
    ['Absorb-Acc']='Absorb',['Absorb-TP']='Absorb',['Absorb-Attri']='Absorb',
    ['Enlight']='Enlight',['Enlight II']='Enlight',['Endark']='Endark',['Endark II']='Endark',
    ['Burn']='ElementalEnfeeble',['Frost']='ElementalEnfeeble',['Choke']='ElementalEnfeeble',['Rasp']='ElementalEnfeeble',['Shock']='ElementalEnfeeble',['Drown']='ElementalEnfeeble',
    ['Pyrohelix']='Helix',['Cryohelix']='Helix',['Anemohelix']='Helix',['Geohelix']='Helix',['Ionohelix']='Helix',['Hydrohelix']='Helix',['Luminohelix']='Helix',['Noctohelix']='DarkHelix',
    ['Pyrohelix II']='Helix',['Cryohelix II']='Helix',['Anemohelix II']='Helix',['Geohelix II']='Helix',['Ionohelix II']='Helix',['Hydrohelix II']='Helix',['Luminohelix II']='Helix',['Noctohelix II']='DarkHelix',
    ['Firestorm']='Storm',['Hailstorm']='Storm',['Windstorm']='Storm',['Sandstorm']='Storm',['Thunderstorm']='Storm',['Rainstorm']='Storm',['Aurorastorm']='Storm',['Voidstorm']='Storm',
    ['Firestorm II']='Storm',['Hailstorm II']='Storm',['Windstorm II']='Storm',['Sandstorm II']='Storm',['Thunderstorm II']='Storm',['Rainstorm II']='Storm',['Aurorastorm II']='Storm',['Voidstorm II']='Storm',
    ['Fire Maneuver']='Maneuver',['Ice Maneuver']='Maneuver',['Wind Maneuver']='Maneuver',['Earth Maneuver']='Maneuver',['Thunder Maneuver']='Maneuver',
    ['Water Maneuver']='Maneuver',['Light Maneuver']='Maneuver',['Dark Maneuver']='Maneuver',
}

-- Get a spell mapping for the spell.
function get_spell_map(spell)
    return spell_map[spell.name]
end

-------------------------------------------------------------------------------------------------------------------
-- Lists of certain NPCs.
-------------------------------------------------------------------------------------------------------------------

npcs = {}
npcs.Trust = S{'Ajido-Marujido','Aldo','Ayame','Cherukiki','Curilla','D.Shantotto','Elivira','Excenmille',
        'Fablinix','FerreousCoffin','Gadalar','Gessho','Ingrid','IronEater','Joachim','Klara','Kupipi',
        'LehkoHabhoka','LhuMhakaracca','Lion','Luzaf','Maat','MihliAliapoh','Mnejing','Moogle','Mumor',
        'NajaSalaheem','Najelith','Naji','NanaaMihgo','Nashmeira','Noillurie','Ovjang','Prishe','Rainemard',
        'RomaaMihgo','Sakura','Shantotto','StarSibyl','Tenzen','Trion','UkaTotlihn','Ulmia','Valaineral',
        'Volker','Zazarg','Zeid'}



