require './lib/grid'
require './lib/cell'
require './lib/player'

class Game

	attr_reader 	:player_1, :player_2
	attr_accessor	:turn

	def initialize(player1, player2)
	@player_1 = Player.new(player1)
	@player_2 = Player.new(player2)
	@turn = player_1
	end

	def opponent
		self.turn == player_1 ?  player_2 : player_1 
	end


	def place(ship, on_behalf_of, on_cell, facing)
		on_behalf_of.grid.place(ship, on_cell, facing)
	end 

	def shoot(coordinates)
		opponent.grid.hit(coordinates)
		winner?(turn)
		switch_turn
	end

	def winner?(player)
	player.all_ships_sunk?
	end

	def switch_turn
		self.turn == player_1 ? @turn = player_2 : @turn = player_1 	
	end

end 