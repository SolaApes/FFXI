function get_sets()

	-- Preshot --
    sets.Preshot = {
		head="Orion beret +3",
		neck="Scout's Gorget +2",
        body="Amini caban +1",
		hands="Carmine Fin. Ga. +1",
	    back={ name="Belenus's Cape", augments={'"Snapshot"+10',}},
		waist="Yemaya Belt",
		legs="Adhemar Kecks +1",
	}
				
	 -- Midshot --
    sets.Midshot = {
		head="Arcadian Beret +2",
		neck="Scout's Gorget +2",
		ear1="Dedition Earring",
		ear2="Enervating Earring",
        body="Orion Jerkin +3",
	    hands="Adhemar Wrist. +1",
		ring1="Petrov ring",
		ring2="Rajas ring",
        back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','"Store TP"+10',}},
		waist="Yemaya belt",
		legs="Adhemar Kecks +1",
		feet="Adhe. Gamashes +1",
	}

end
				
function autoRA()
    send_command('@wait 2.5; input /ra <t>')
end
		
function precast(spell,action)
    if spell.english == 'Ranged' then
		equipSet = GearSet
		equip(sets.Preshot)
    end	
end				

function midcast(spell,action)
    if spell.english == 'Ranged' then
		equipSet = GearSet
		equip(sets.Midshot)
    end	
end	

function ChangeGear(GearSet)
	equipSet = GearSet
	equip(GearSet)
end
