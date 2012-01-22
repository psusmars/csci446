class Player
	@health
	def initialize
		@health = 20
	end
	
	def play_turn(warrior)
	if warrior.feel.empty?
		if warrior.health < 12 and !(@health > warrior.health)
			warrior.rest!
		else
			warrior.walk!
		end
	else
		if warrior.feel.captive?
			warrior.rescue!
		else
			warrior.attack!
		end
	end
	@health = warrior.health
	end
end
