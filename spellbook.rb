$elements = ['water', 'life', 'shield', 'cold', 'lightning', 
             'arcane', 'earth', 'fire', 'ice', 'steam']
$conflictingElements = [ ['water', 'cold'], ['water', 'lightning'],
                         ['water', 'fire'], ['life', 'arcane'],
                         ['shield', 'shield'], ['cold', 'fire'],
                         ['cold', 'steam'], ['lightning', 'earth'],
                         ['fire', 'ice'], ['ice', 'steam'] ]


def buildSpell (spell, position, spellbook)
  spellbook << spell
  return if position > 4
  for element in 0..9
    unless (conflict(spell, position, element))
      newSpell = spell.dup
      newSpell[position] = element
      buildSpell(newSpell, position + 1, spellbook)
    end
  end
end

def conflict (spell, position, newElement)
  newElementName = $elements[newElement]
  for i in 0..position-1
    existingElementName = $elements[spell[i]]
    if $conflictingElements.include?([newElementName, existingElementName]) or
       $conflictingElements.include?([existingElementName, newElementName])
      return true
    end
  end
  return false
end

def describeSpell(spell)
  if spell.length == 0
    spellDesc = 'none'
  else
    spellDesc = ''
    for element in spell
      spellDesc += $elements[element] + ' '
    end
  end
  return spellDesc
end

def displaySpellbook(spellbook)
  for spell in spellbook
    puts describeSpell(spell)
  end
end

spellbook = []
buildSpell([], 0, spellbook)
displaySpellbook(spellbook)
