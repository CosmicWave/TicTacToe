
  def printBoard(board)
    print "\n"
    count = 1
    (0..2).each do |row|
      print "       "
      (0..2).each do |col|
        board[row][col] = count
        print board[row][col].to_s
        print " | " if col != 2
        count += 1
      end
      print "\n"
      print "       ---------\n" unless row == 2
    end
    print "\n"
    
    return board
  end


puts "Welcome to Tic Tac Toe!"
# puts "Player 1, please choose your sign: 'X' or 'O'"
# sign = gets.chomp!

# while sign != "X" && symbol != "O"
#   puts "Please enter either 'X' or 'O': " 
#   sign = gets.chomp!.Upcase
#   puts "sign is #{sign}"
# end


#init board, print it
arr = Array.new(3) {Array.new(3, " ") }
arr = printBoard(arr)

def validGrid(digit, board)
    (board.flatten[digit-1]).is_a? Integer   #if digit in board is an int, its a valid grid
end

def checkWin()

end

(1..9).each do |turn|
  
if (turn%2 == 0) #player 2's turn - even turns
  player = "2"
  symbol = "O"
else              #player 1's turn - odd turns
  player = "1"
  symbol = "X"
end
  
    puts "player #{player} , choose a grid: "
    input = gets.chomp!.to_i

    #input validation - user input digit between 1 to 9
    while input < 0 || input > 9
      puts "Please enter a digit between 1 to 9"
      input = gets.chomp!
    end
    
    #input validation - user input digit that has not been taken up
    unless validGrid(input,arr)
      puts "Please choose an available digit from the grid: "
      input = gets.chomp!
    end
    
    #
    #assign value to arr  
    #

    #
    #checkWins
    #

    if(turn == 9) #last turn, no winner
      puts "It's a draw! Thank you for playing!"
      break
    end
    
    printBoard(arr)
end
