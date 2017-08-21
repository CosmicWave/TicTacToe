  firstTime = true

  def printBoard(board)
    print "\n"
    count = 1
    (0..2).each do |row|
      print "       "
      (0..2).each do |col|
        board[row][col] = count if firstTime
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
  
  def randomGrid{board}
      valid = board.flatten.select{|gridNum| gridNum.is_a? Integer}
      valid.sample
  end
  
  def validGrid(digit, board)
    (board.flatten[digit-1]).is_a? Integer   #if digit in board is an int, its a valid grid
  end
  
  def checkWin()

  end


puts "Welcome to Tic Tac Toe!"

#init board, print it
gridArr = Array.new(3) {Array.new(3, " ") }
gridArr = printBoard(gridArr)
firstTime = false

p "Choose a Game Mode: "
p "1. Player 1 vs Player 2"
p "2. Player 1 vs Random"
gameMode = gets.chomp!.to_i


(1..9).each do |turn|
  
    if (turn%2 == 0) #player 2's turn - even turns
      player = "2"
      symbol = "O"
    else              #player 1's turn - odd turns
      player = "1"
      symbol = "X"
    end
    
    randomAI = true if gameMode == 2 && player == "2" #AI turn

    if !randomAI
      puts "player #{player} , choose a grid: "
      input = gets.chomp!.to_i
      
      #input validation - user should input digit between 1 to 9
      while input < 0 || input > 9
        puts "Please enter a digit between 1 to 9"
        input = gets.chomp!
      end
    
      #input validation - user should input digit that has not been taken up in grid
      unless validGrid(input,arr)
        puts "Please choose an available digit from the grid: "
        input = gets.chomp!
      end
      
    else                                          #AI turn, returns a random number
      input = randomGrid(gridArr)
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
    
    printBoard(gridArr)
end
