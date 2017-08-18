
   def printBoard(board)
    puts "printboard"
    count = 1
    (0..2).each do |row|
      print "       "
      (0..2).each do |col|
        board[row[col]] = count
        print board[row[col]].to_s
        print " | " if col != 2
        count += 1
      end
      print "\n"
      print "       ---------\n" unless row == 2
    end
    print "\n"
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
puts "arr is " + arr.to_s
printBoard(arr)

def validGrid(digit, board)
    puts "board is " + board.to_s
    tempBoard = board.flatten
    puts "board is " + tempBoard.to_s
    return (tempBoard[digit-1]) == " "
end

(1..9).each do |turn|
  
if (turn%2 == 0)
  player = "2"
  symbol = "O"
else
  player = "1"
  symbol = "X"
end
  
    puts "player #{player} , choose a grid: "
    input = gets.chomp!.to_i

    while input < 0 || input > 9
      puts "Please enter a digit between 1 to 9"
      input = gets.chomp!
    end
    
    while validGrid(input,arr)
      puts "Please choose an available digit from the grid: "
      input = gets.chomp!
    end
    
    #
    #assign value to arr  
    #
    
    if(turn == 9) #last turn, no winner
      puts "It's a draw! Thank you for playing!"
      break
    end
    
    printBoard(arr)
end
