class Node
  def initialize(position)
    @status = :EMPTY
    @position = position
    @legal_moves = LEGAL_MOVES_HASH[position]
  end
  
  attr_reader :status,:position

  def to_s
    print "{#{@status},#{@position}}"
  end

  def place_computer
    @status = :COMPUTER
  end

  def place_player
    @status = :PLAYER
  end

  def empty_node
    @status = :EMPTY
  end

  private
  LEGAL_MOVES_HASH = {
    1 => [2,4,5],
    2 => [1,3,5],
    3 => [2,5,6],
    4 => [1,5,7],
    5 => [1,2,3,4,6,7,8,9]
    6 => [3,5,9]
    7 => [4,5,8]
    8 => [5,7,9]
    9 => [5,6,8]
  }
end


class Board
  def initialize
    @board = Array.new(9) { |i| Node.new(i+1) }
  end
  
  #Take website provided board state and update
  #our internal board. Example state: "--c--p---"
  def update_board(board_state)
    raise "Board state should be 9 character long string" unless board_state.length == 9
    i = 1
    board_state.split("").each do |char|
      if char == 'c'
        self.place_computer(i)
      elsif char == 'p'
        self.place_player(i)
      else
        self.empty_node(i)
      end
      i = i + 1
    end

    self.to_s
  end

  #Print out the board state
  def to_s 
    i = 1
    @board.each do |node|
      node.to_s
      puts "\n" if i % 3 == 0
      i = i + 1
    end
    puts
  end

  #Get node status at a position
  def get_node_status(position)
    @board[position-1].status
  end

  #Count the number of computer chips on the board
  def get_num_computer_chips
    self.get_num_chips(:COMPUTER)
  end

  #Count the number of player chips on the board
  def get_num_player_chips
    self.get_num_chips(:PLAYER)
  end

  #Counter number of chips of a given chip type on the board
  def get_num_chips(chip_type)
    i = 0
    @board.each do |node|
      i  = i + 1 if node.status == chip_type
    end
    return i
  end

  private
  #Note: I'm not going to check if these are legal moves here
  #since I'll be the sole caller to these functions. Just no point.
  #Also - position inputs will be 1-9, then adapted to be 0-8
  def place_player(position)
    @board[position-1].place_player
  end

  def place_computer(position)
    @board[position-1].place_computer
  end

  def empty_node(position)
    @board[position-1].empty_node
  end



end
