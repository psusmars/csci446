class Player
	@health
	@rescued
	def initialize
		@health = 20
		@rescued = true
	end
	
	def play_turn(warrior)
	test(warrior)
	if warrior.feel.wall?
		warrior.pivot!
	else
		infront = warrior.look
		
		if !(@rescued)
			if warrior.feel(:backward).empty?
				check_health_and_heal(warrior, :backward)
			else
				warrior.rescue!(:backward)
				@rescued = true
			end
		else	
			if warrior.feel.empty? and !(infront[1].enemy?)
				check_health_and_heal(warrior, :forward)
			else
				if warrior.feel.captive?
					warrior.rescue!
				else
					warrior.shoot!
				end
			end
		end
	end
	@health = warrior.health
	end
	
	private
	def check_health_and_heal(warrior, direction)
	if warrior.health < 15
		if taking_damage(warrior)
			if warrior.health < 12
				warrior.walk!(:backward)
			else
				warrior.walk!(:forward)
			end
		else
			warrior.rest!
		end
	else
		warrior.walk!(direction)
	end
	end
	
	private
	def taking_damage(warrior)
		@health > warrior.health
	end
end
