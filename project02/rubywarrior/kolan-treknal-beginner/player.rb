class Player
	@health  = 20
  def play_turn(warrior)
	if warrior.feel.empty?
		if warrior.health < 7 and @health != warrior.health 
			warrior.rest!
		else
			warrior.walk!
		end
	else
		warrior.attack!
	end
	@health = warrior.health
  end
end
