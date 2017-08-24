  firstTime = true

  def printBoard(board,firstTime)
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
  
  def validGrid(digit, board)
    (board.flatten[digit-1]).is_a? Integer   #if digit in board is an int, its a valid grid
  end
  
  def checkInput(num)
      #input validation - user should input digit between 1 to 9
      while num < 1 || num > 9
        puts "Please enter a digit between 1 to 9"
        num = gets.chomp!.to_i
        
      end  
      return num
  end

  def randomGrid(board)
      valid = board.flatten.select{|gridNum| gridNum.is_a? Integer}
      valid.sample
  end



  def moveScore(possibleBoard,nextMove,turn,score)
 
    if (turn%2 == 0) #player 2's turn - even turns
      player = "2"
      symbol = "O"
    else              #player 1's turn - odd turns
      player = "1"
      symbol = "X"
    end
 
      row = (nextMove-1)/3
      col = (nextMove-1)%3
      possibleBoard[row][col] = symbol
      puts "possibleBoard is now #{possibleBoard}"

      if checkWin(possibleBoard)
        if turn%2 == 1
          score
        elsif turn%2 == 0
          0-score
        end
      else
        copyArr = possibleBoard
        movePoints = 0
        turn += 1
        score -= 2
        next_available_moves = copyArr.flatten.select{|gridNum| gridNum.is_a? Integer}
        next_available_moves.each do |move|
          movePoints += moveScore(copyArr,move,turn,score)
        end
        movePoints
      end
  end

  def computerGrid(board,playerMoves,turn)
     
      pointsArray = Array.new(10,0);

      #winning priority over blocking
      #use this board to do look-ahead
      #if already determine winning outcome, skip the rest of look-ahead

      #use checkWin to evaluate own and opponent option

      #1st level - evaluate your own moves
      available_moves = board.flatten.select{|gridNum| gridNum.is_a? Integer}
      puts "available moves are #{available_moves}"

      available_moves.each do |move|
          pointsArray[move] = moveScore(board,move,turn,10)
          puts "pointsArray is #{pointsArray}"
      end

      pointsArray.each_with_index.max[1]

  end

  
  def checkWin(gridArr)
       if (gridArr[0][0] == gridArr[0][1] && gridArr[0][1] == gridArr[0][2])  #horizontals
         true
    elsif (gridArr[1][0] == gridArr[1][1] && gridArr[1][1] == gridArr[1][2])
         true
    elsif (gridArr[2][0] == gridArr[2][1] && gridArr[2][1] == gridArr[2][2])
         true
    elsif (gridArr[0][2] == gridArr[1][2] && gridArr[1][2] == gridArr[2][2])  #verticals
         true
    elsif (gridArr[0][0] == gridArr[1][0] && gridArr[1][0] == gridArr[2][0])
         true
    elsif (gridArr[0][1] == gridArr[1][1] && gridArr[1][1] == gridArr[2][1])
         true
    elsif (gridArr[0][0] == gridArr[1][1] && gridArr[1][1] == gridArr[2][2])  #diagonals
         true
    elsif (gridArr[0][2] == gridArr[1][1] && gridArr[1][1] == gridArr[2][0])  
         true
    end
  end

puts "Welcome to Tic Tac Toe!"

#init board, print it
gridArr = Array.new(3) {Array.new(3, " ") }
gridArr = printBoard(gridArr,firstTime)
firstTime = false
isWin = false

p "Choose a Game Mode: "
p "1. Player 1 vs Player 2"
p "2. Player 1 vs Random"
p "3. Player 1 vs AI"
gameMode = gets.chomp!.to_i

if gameMode == 3
  playerOneMoves = []
  computerMoves = []
end

(1..9).each do |turn|
  
    if (turn%2 == 0) #player 2's turn - even turns
      player = "2"
      symbol = "O"
    else              #player 1's turn - odd turns
      player = "1"
      symbol = "X"
    end
    
    randomAI = true if gameMode == 2 && player == "2" #randomAI turn
    computerAI = true if gameMode == 3 && player == "2" #computerAI turn

    if (!randomAI && !computerAI) #if human player
      puts "player #{player} , choose a grid: "
      input = checkInput(gets.chomp!.to_i)

    
      #input validation - user should input digit that has not been taken up in grid
      while !(validGrid(input,gridArr) )
        puts "Please choose an available digit from the grid: "
        input = checkInput(gets.chomp!.to_i)
      end
      
    elsif randomAI                                          #AI turn, returns a random number
      input = randomGrid(gridArr)
    elsif computerAI
    copyArr = gridArr.dup
      input = computerGrid(copyArr,playerOneMoves,turn)
      puts "computer input is #{input}"
      input
    end
    
    if (gameMode == 3 && !computerAI) #AIMode, player 1 input
      playerOneMoves.push(input)
    end

    #assign value into grid
    row = (input-1)/3
    col = (input-1)%3
    gridArr[row][col] = symbol

    if turn >= 5
      isWin = checkWin(gridArr)
    end

    if isWin
      printBoard(gridArr,firstTime)
      puts "Player #{player} wins."
      puts "Thank you for playing!"
      break
    end

    if(turn == 9) #last turn, no winner
      printBoard(gridArr,firstTime)
      puts "It's a draw! Thank you for playing!"
     break
    end
    
    printBoard(gridArr,firstTime)
end
