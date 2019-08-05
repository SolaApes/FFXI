function get_sets()

	-- Preshot --
    sets.Preshot = {

	}
				
	 -- Midshot --
    sets.Midshot = {

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
