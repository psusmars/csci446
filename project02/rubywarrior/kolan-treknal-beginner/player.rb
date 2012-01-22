class Player
	@health
	@rescued
	def initialize
		@health = 20
		@rescued = false
	end
	
	def play_turn(warrior)
	if !(@rescued)
		if warrior.feel(:backward).empty?
			check_health_and_heal(warrior, :backward)
		else
			warrior.rescue!(:backward)
			@rescued = true
		end
	else	
		if warrior.feel.empty?
			check_health_and_heal(warrior, nil)
		else
			if warrior.feel.captive?
				warrior.rescue!
			else
				warrior.attack!
			end
		end
	end
	@health = warrior.health
	end
	
	def check_health_and_heal(warrior, direction)
	if warrior.health < 15 and !(@health > warrior.health)
		warrior.rest!
	else
		warrior.walk!(direction)
	end
	end
end
