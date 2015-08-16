# tictactoe.rb


# create board
# display board

# loop do 
#   player picks an empty square
#   check for winner
#   computer picks an empty square
#   check for winner
# end

# display winner, else display 'draw'

require 'pry'


def draw_board(b)
  system 'clear'          # clears the screen
  puts " #{b[1]} | #{b[2]} | #{b[3]} "
  puts "-----------"
  puts " #{b[4]} | #{b[5]} | #{b[6]} "
  puts "-----------"
  puts " #{b[7]} | #{b[8]} | #{b[9]} "
end


def initialize_board
  b = {}
  (1..9).each { |position| b[position] = ' '}
  b
end

def player_picks_square(b)
  loop do 
    print "choose position (1 - 9): "
    position = gets.chomp.to_i  
    if position.between?(1,9)
      b[position] = 'X' 
      break
    else
      puts "Number 1-9 required. Pick again..."
    end
  end
end


def empty_positions(b)
  b.select { |k, v| v == ' '}.keys
end

def computer_picks_square(b)
  position = empty_positions(b).sample # .sample picks random empty position from board
  b[position] = 'O'
end


def check_winner(b)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if b.values_at(*line).count('X') == 3
    return "Computer" if b.values_at(*line).count('O') == 3
  end
  nil
end

board = initialize_board
draw_board(board)

begin
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?  # continue until all squares taken


if winner # if winner is true, ie. has value
  puts "Winner is #{winner}"
else
  puts "It's a tie"
end



# only accept available squares on user choice. complain if not available.

# AI for computer to choose best square. Hint: think about how to make the computer smarter. To start, the computer should prefer to block any square that may allow 3 in a row. How about a method called two_in_a_row that returns either nil or the square to block if there’s two in a row.