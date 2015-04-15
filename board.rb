class Node
  def initialize(position)
    @status = :EMPTY
    @position = position
  end
  
  attr_reader :status,:position

  def print_node
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
end


class Board
  def initialize
    @board = Array.new(9) { |i| Node.new(i+1) }
  end

  #Note: I'm not going to check if these are legal moves here
  #since I'll be the sole caller to these functions. Just no point.
  def place_player(position)
    @board[position].place_player(position) 
  end

  def place_computer(position)
    @board[position].place_computer(position) 
  end

  def move_chip(position_from, position_to)
    status = @board[position_from]
    @board[position_from].empty_node
    @board[position_to].place_computer if status == :COMPUTER
    @board[position_to].place_player if status == :PLAYER
  end

  def print_board
    i = 1
    @board.each do |node|
      node.print_node
      puts "\n" if i % 3 == 0
      i = i + 1
    end
  end

  def set_node=(node_position, node_status)
     
  end
end

board = Board.new
board.print_board

