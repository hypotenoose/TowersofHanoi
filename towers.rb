require 'byebug'

class TowersOfHanoi

  attr_accessor :towers

  def initialize(size)
    @size = size
  end

  def build
    @towers = Array.new(3) {Array.new}
    @towers[0] = (1..@size).to_a.reverse
    # @towers[1] << @towers[0].pop
    @towers
  end

  def get_move
    puts "What tower do you want to take from? (0-2)"
    @from = gets.chomp.to_i
    puts "What tower do you want to move the piece to? (0-2)"
    @to = gets.chomp.to_i
  end

  def display
    p @towers
  end

  def move(from, to)
    # debugger
    raise ArgumentError.new unless from.between?(0,2) || to.between?(0,2)
    raise ArgumentError.new if @towers[from].empty?
    raise ArgumentError.new unless (@towers[to].empty? || @towers[from].last < @towers[to].last)
    @towers[to] << @towers[from].pop
    @towers
  end

   def valid_move?
     !@towers[@from].empty? &&
     (@towers[@to].empty? || @towers[@from].last < @towers[@to].last)
   end

  def won?
    @towers[2] == (1..@size).to_a.reverse
  end
#
   def play
     build
     until won?
       display
       get_move
       move
    end
  end
end

a = TowersOfHanoi.new(3)
