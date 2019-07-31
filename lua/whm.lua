TP_Set_Names = {"None", "Delay Cap" ,"Acc"}
TP_Index = 1

Idle_Set_Names = {'MDT','PDT'}
Idle_Index = 1

Kiting = false

send_command('bind f9 gs c cycle TP set')
send_command('bind f10 gs c equip pdt')
send_command('bind f11 gs c equip mdt')
send_command('bind f12 gs c refresh set')
send_command('bind ^k gs c toggle kiting')

function file_unload()
    send_command('unbind f9')
    send_command('unbind f10')
    send_command('unbind f11')
    send_command('unbind f12')
    send_command('unbind ^k')
end

function help()
    add_to_chat(122, 'Keyboard Bindings:')
    add_to_chat(122, 'F9: Cycle TP set')
    add_to_chat(122, 'F10: Turn on idle pdt')
    add_to_chat(122, 'F11: Turn on idle mdt')
    add_to_chat(122, 'F12: Refresh gear and turn on job abilities')
    add_to_chat(122, 'Ctrl + k: Toggle kiting')
end

help()

function get_sets()

    sets = {}
    
     -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
     sets.divine_caress = {hands="Ebers mitts +1"}
     sets.afflatus_solace = {body="Ebers Bliaud +1"}

	--- Sets for Enhanced Job Abilities ---
	
	sets.ja = {}
	
    sets.ja['Afflatus Solace'] = sets.afflatus_solace
    sets.ja['Benediction'] = {body="Piety Briault +1"}
    sets.ja['Devotion'] = {body="Piety Cap +1"}
	
	--- Fast Cast Sets ---
	sets.fc = {
         main="Cath Palug hammer",
         ammo="Homiliary",
         head="Nahtirah Hat",
         body="Zendik Robe",
         hands={ name="Fanatic Gloves", augments={'MP+50','Healing magic skill +10','"Conserve MP"+7','"Fast Cast"+1',}},
         legs={ name="Kaykaus Tights +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
         feet="Regal Pumps +1",
         neck="Incanter's Torque",
         waist="Luminary Sash",
         left_ear="Loquac. Earring",
         right_ear="Etiolation Earring",
         left_ring="Kishar Ring",
         right_ring="Prolix Ring",
         back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}},
    }
	
    sets.fc.heal = set_combine(sets.fc, {legs="ebers pantaloons +1"})
    
    sets.fc.cure = set_combine(sets.fc, {
        main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
        neck="Aceso's choker +1",
        sub="Sors shield",
        ear2="Nourishing earring +1",
        feet="Hygieia clogs +1",
    })
    
    sets.fc.stoneskin = set_combine(sets.fc, {
        head="Umuthi Hat",
        waist="Siegel Sash",
	})
	
	sets.ws = {
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Aya. Manopolas +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Cessance Earring",
        right_ear="Brutal Earring",
        left_ring="Rajas Ring",
        right_ring="Chirich Ring +1",
        back="Moonbeam Cape",
    }
	
    sets.ws["Hexa Strike"] = {
        ammo="Staunch Tathlum",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Aya. Manopolas +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Fotia Gorget",
        waist="Fotia Belt",
        left_ear="Cessance Earring",
        right_ear="Brutal Earring",
        left_ring="Rajas Ring",
        right_ring="Chirich Ring +1",
        back="Moonbeam Cape",
    } 
	  
	
    sets.tp = {}
    
    sets.tp['Delay Cap'] = {
        ammo="Staunch Tathlum",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Aya. Manopolas +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Sanctity Necklace",
        waist="Grunfeld Rope",
        left_ear="Cessance Earring",
        right_ear="Telos Earring",
        left_ring="Petrov Ring",
        right_ring="Chirich Ring +1",
        back="Moonbeam Cape",
    }

	sets.tp['Acc'] = {
        ammo="Staunch Tathlum",
        head="Aya. Zucchetto +2",
        body="Ayanmo Corazza +2",
        hands="Aya. Manopolas +2",
        legs="Aya. Cosciales +2",
        feet="Aya. Gambieras +2",
        neck="Sanctity Necklace",
        waist="Eschan stone",
        left_ear="Cessance Earring",
        right_ear="Brutal Earring",
        left_ring="Petrov Ring",
        right_ring="Chirich Ring +1",
        back="Moonbeam Cape",
    }
    
    
    sets.idle = {}
	
	sets.idle['PDT'] = {
        main="Mafic cudgel",
        sub="Genbu's Shield",
        ammo="Staunch tathlum",
        head="Ayanmo zucchetto +2",
        neck="Loricate Torque +1",
        ear1="Hearty earring",
        ear2="Etiolation earring",
        body="Ayanmo corazza +2",
        hands="Ayanmo manopolas +2",
        ring1="Defending Ring",
        ring2="Ayanmo ring",
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},
	    waist="Slipor sash",
        legs="Ayanmo cosciales +2",
        feet="Ayanmo gambieras +2"
    }
                
    sets.idle['MDT'] = {
        main="Bolelabunga",
        sub="Genmei Shield",
        ammo="Homiliary",
        head="Befouled Crown",
        body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
        hands="Inyan. Dastanas +2",
        legs="Assid. Pants +1",
        feet="Inyan. Crackows +2",
        neck="Loricate Torque +1",
        waist="Fucho-no-Obi",
        left_ear="Glorious Earring",
        right_ear="Etiolation Earring",
        left_ring="Defending Ring",
        right_ring="Inyanga Ring",
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},
    }

	sets.midcast = {}
	
	sets.midcast.stoneskin = set_combine( sets.fc.stoneskin, {
	    main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
        sub="Sors Shield",
        ammo="Staunch Tathlum +1",
        head="Umuthi Hat",
        body="Manasa Chasuble",
        hands="Regal Cuffs",
        legs="Shedir Seraweels",
        feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +9',}},
        neck="Nodens Gorget",
        waist="Siegel Sash",
        left_ear="Earthcry Earring",
        right_ear="Magnetic Earring",
        left_ring="Kishar Ring",
        right_ring="Stikini Ring +1",
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},
    })
	
    sets.midcast.status_removal = {
        main="Yagrush",
        head="Vanya hood",
        neck="Cleric's torque",
        body="Ebers bliaud +1",
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},
        waist="Austerity belt +1",
        legs="ebers pantaloons +1",
    }

    sets.midcast.cursna = set_combine( sets.midcast.status_removal, {
        neck="Debilis Medallion",
        hands="Fanatic gloves",
        ring1="Haoma's ring",
        ring2="Haoma's ring",
        legs="Theophany pantaloons +3",
        feet="Gendewitha Galoshes",
    })
	
    sets.midcast.cure = {
         main={ name="Queller Rod", augments={'Healing magic skill +15','"Cure" potency +10%','"Cure" spellcasting time -7%',}},
         sub="Sors Shield",
         ammo="Elis Tome",
         head="Kaykaus mitra +1",
         body="Ebers Bliaud +1",
         hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
         legs="Ebers Pant. +1",
         feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
         neck="Incanter's Torque",
         waist="Fucho-no-Obi",
         left_ear="Glorious Earring",
         right_ear="Nourish. Earring +1",
         left_ring="Lebeche ring",
         right_ring="Stikini Ring +1",
         back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},
    }

    sets.midcast.enhancing = {
         main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','STR+7','Mag. Acc.+10','"Mag.Atk.Bns."+6',}},
         sub="Ammurapi Shield",
         ammo="Elis Tome",
         head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +7',}},
         body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
         hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
         legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
         feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +9',}},
         neck="Incanter's Torque",
         waist="Olympus Sash",
         left_ear="Andoaa Earring",
         right_ear="Nourish. Earring +1",
         left_ring="Defending Ring",
         right_ring="Stikini Ring +1",
         back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},
    }

    sets.midcast.bar_element = set_combine( sets.midcast.enhancing, {
        main="Beneficus",
        head="Ebers cap +1",
        body="Ebers Bliaud +1",
        hands="Ebers mitts +1",
        legs="Piety Pantaloons +1",
        feet="Ebers duckbills +1",
    })
    
    sets.midcast['Auspice'] = set_combine( sets.midcast.enhancing, {
        feet="Ebers duckbills +1",
    })

    sets.midcast.protect = set_combine(sets.midcast.enhancing, {
        ring1="Sheltered Ring",
        feet="Piety duckbills +1",
    })

    sets.midcast.shell = set_combine(sets.midcast.enhancing, {
        ring1="Sheltered Ring",
        legs="Piety Pantaloons +1",
    })

    sets.midcast.regen = set_combine(sets.midcast.enhancing, {
        main="Bolelabunga",
        sub="Ammurapi Shield",
        ammo="Elis Tome",
        head="Inyanga Tiara +2",
        body={ name="Piety Briault +1", augments={'Enhances "Benediction" effect',}},
        hands="Ebers Mitts +1",
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
        feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +9',}},
        neck="Incanter's Torque",
        waist="Fucho-no-Obi",
        left_ear="Glorious Earring",
        right_ear="Nourish. Earring +1",
        left_ring="Defending Ring",
        right_ring="Stikini Ring +1",
        back={ name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','Enmity-10','Damage taken-5%',}},
    })

    sets.midcast.enfeebling = {
        main="Gada",
        ammo="Hydrocera",
        head="Befouled crown",
        neck="Erra pendant",
        ear1="Gwati earring",
        ear2="Hermetic earring",
        body="Inyanga Jubbah +2",
        hands="Inyanga dastanas +2",
        ring1="Kishar ring",
        ring2="Stikini Ring +1",
        back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Spell interruption rate down-10%'}},
        waist="Luminary sash",
        legs="Inyanga Shalwar +2",
        feet="Inyanga Crackows +2",
    }

    sets.midcast.divine = {
        main="Gada",
        ammo="Hydrocera",
        neck="Erra pendant",
        ear1="Gwati earring",
        ear2="Hermetic earring",
        body="Theophany briault +3",
        hands="Inyanga dastanas +2",
        ring1="Stikini ring",
        ring2="Stikini ring",
        back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','Enmity-10','Spell interruption rate down-10%'}},
        waist="Luminary sash",
        legs="Theophany pantaloons +3",
        feet="Medium's Sabots",
    }

    sets.kiting = {
        feet='Iaso Boots',
    }

end

function precast(spell)
    -- print_set(spell)
    
    if (sets.ja[spell.english]) then
        equip(sets.ja[spell.english])
    elseif spell.skill == 'Healing Magic' then
        if spell.name:contains("Cure") or spell.name:contains("Curaga") or spell.name:contains("Cura") then
            equip(sets.fc.cure)
        else
            equip(sets.fc.heal)
        end
    elseif spell.name == "Stoneskin" then
        equip(sets.fc.stoneskin)
    elseif spell.action_type == "Magic" then
        equip(sets.fc)
    elseif spell.type == "WeaponSkill" then
        if sets.ws[spell.name] then
            equip(sets.ws[spell.name])
        else
            equip(sets.ws)
        end
    end
end

function midcast(spell)
    -- print_set(spell)
    local set_to_equip = sets.idle[Idle_Set_Names[Idle_Index]]
	if spell.skill == 'Healing Magic' or spell.name == "Erase" then
        if spell.name:contains("Cure") then
            if buffactive['Afflatus Solace'] then
                local solace_cure_set = set_combine(sets.afflatus_solace, sets.midcast.cure)
                set_to_equip = set_combine(set_to_equip, solace_cure_set)
            else
                set_to_equip = set_combine(set_to_equip, sets.midcast.cure)
            end
        elseif spell.name:contains("Curaga") or spell.name:contains("Cura") then
            set_to_equip = set_combine(set_to_equip, sets.midcast.cure)
        elseif spell.name == "Cursna" then
            if buffactive['Divine Caress'] then
                local cursna_divine_caress_set = set_combine(sets.divine_caress, sets.midcast.cursna)
                set_to_equip = set_combine(set_to_equip, cursna_divine_caress_set)
            else
                set_to_equip = set_combine(set_to_equip, sets.midcast.cursna)
            end            
        else
            if buffactive['Divine Caress'] then
                local status_removal_dc = set_combine(sets.divine_caress, sets.midcast.status_removal)
                set_to_equip = set_combine(set_to_equip, status_removal_dc)
            else
                set_to_equip = set_combine(set_to_equip, sets.midcast.status_removal)
            end
        end    
	--Enfeebling Magic	
    elseif spell.skill == 'Enfeebling Magic' then
        set_to_equip = set_combine(set_to_equip, sets.midcast.enfeebling)		
	--Enhancing Magic		
    elseif spell.skill == 'Enhancing Magic' then
        if spell.name == 'Stoneskin' then
            set_to_equip = set_combine(set_to_equip, sets.midcast.stoneskin)
        elseif spell.english:contains('Regen') then
            set_to_equip = set_combine(set_to_equip, sets.midcast.regen)
        elseif spell.english:contains('Bar') then
            if buffactive['Afflatus Solace'] then
                local bar_as = set_combine(sets.afflatus_solace, sets.midcast.bar_element)
                set_to_equip = set_combine(set_to_equip, bar_as)
            else
                set_to_equip = set_combine(set_to_equip, sets.midcast.bar_element)
            end
        elseif spell.english:contains('Protect') then
            set_to_equip = set_combine(set_to_equip, sets.midcast.protect)
		elseif spell.english:contains('Shell') then
            set_to_equip = set_combine(set_to_equip, sets.midcast.shell)
        elseif sets.midcast[spell.english] then
            set_to_equip = set_combine(set_to_equip, sets.midcast[spell.english])
        else
            set_to_equip = set_combine(set_to_equip, sets.midcast.enhancing)
        end
    elseif spell.skill == "Divine Magic" then
        set_to_equip = set_combine(set_to_equip, sets.midcast.divine)
    end
    -- print_set(set_to_equip)
    equip(set_to_equip)
end

function equip_set(status)
    local set_to_equip = nil
    if status=='Engaged' then
        local tp_set_mode = TP_Set_Names[TP_Index]
        if tp_set_mode == 'None' then
            set_to_equip= sets.idle[Idle_Set_Names[Idle_Index]]
        else
            set_to_equip = sets.tp[TP_Set_Names[TP_Index]]
        end
    else
        set_to_equip = sets.idle[Idle_Set_Names[Idle_Index]]
    end

    if Kiting then
        set_to_equip = set_combine(set_to_equip, sets.kiting)
    end

    equip(set_to_equip)
end

function aftercast(spell)
    equip_set(player.status)
end

function status_change(new,old)
    equip_set(new)
end

function self_command(command)
    if command == 'cycle TP set' then
        TP_Index = TP_Index % #TP_Set_Names + 1
        send_command('@input /echo ----- TP Set changed to '..TP_Set_Names[TP_Index]..' -----')
        equip_set(player.status)
    elseif command == 'equip pdt' then
        Idle_Index = 2
        send_command('@input /echo ----- Idle Set changed to '..Idle_Set_Names[Idle_Index]..' -----')
        equip_set(player.status)
    elseif command == 'equip mdt' then
        Idle_Index = 1
        send_command('@input /echo ----- Idle Set changed to '..Idle_Set_Names[Idle_Index]..' -----')
        equip_set(player.status)
    elseif command == 'toggle kiting' then
        Kiting = not Kiting
        if Kiting then
            send_command('@input /echo ----- Kiting Set On -----')
        else
            send_command('@input /echo ----- Kiting Set Off -----')
        end
        equip_set(player.status)
    elseif command == 'refresh set' then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end

        local kitingStatus = (Kiting and "On" or "Off")
        send_command('@input /echo Idle Set: '..Idle_Set_Names[Idle_Index]..' || TP Set: '..TP_Set_Names[TP_Index]..' || Kite: '..kitingStatus )
        equip_set(player.status)
    end
end

--I don't like this stuff in my gear swap. Uncomment if you do.
-- function buff_change(buff,gain_or_loss)
--     if gain_or_loss and buff == 'Silence' then
-- 		send_command('@input /item "Echo Drops" <me>')
-- 	elseif gain_or_loss and buff == 'Paralyze' then
-- 		send_command('@input /item "Remedy" <me>')
--     end
-- end