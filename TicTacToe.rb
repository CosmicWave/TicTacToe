def initialize
    arr = Array.new(3) { Array.new(3, " ") }
  end


  def printBoard(board)
    count = 1
    (0..2).each do |row|
      print "       "
      (0..2).each do |col|
        board[row][col] = count
        print board[row][col]
        print " | " unless col == 2
        count += 1
      end
      print "\n"
      print "       ---------\n" unless row == 2
    end
    print "\n"
  end
  

printBoard(initialize())