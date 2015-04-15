class Node
  def initialize(position)
    @status = :EMPTY
    @position = position
  end

  def print_node
    print "{#{@status},#{@position}}"
  end

  attr_accessor :status,:position
end


class Board
  def initialize
    #slightly complex below - just inits a 3X3 matrix with positions 1-9
    #like this:
    #1,2,3
    #4,5,6
    #7,6,9
    #@board = Array.new(3) { |i| Array.new(3){ |j| Node.new((i*3)+(j+1)) } }
    @board = Array.new(9) { |i| Node.new(i+1) }
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

