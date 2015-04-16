require "./rota_api.rb"
require "./board.rb"

#Initialize board and api
board = Board.new
api = RotaAPI.new

#Start a new game and update initial board state
hash = api.reset
data = hash["data"]
board_state = data["board"]
board.update_board(board_state)

#Randomly place chips until there are 3 player chips.
#I realize this could result in a loss occasionally,
#but I don't want to waste time coding the initial
#placement logic.
#
#You only need to get lucky once here, and then the game
#will progress into the 'movement' phase.
until board.get_num_player_chips == 3
  node_position = 1
  until board.get_node_status(node_position) == :EMPTY 
    node_position = rand(9)+1   
  end

  response = api.place(node_position)
  if response["status"] != "success"
    puts response.to_s
    break
  else
    board.update_board(response["data"]["board"])
  end
  sleep(9)
end
