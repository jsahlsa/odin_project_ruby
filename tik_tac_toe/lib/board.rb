class Board
    attr_accessor :board, :count
    
    def initialize
        @board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
        @count = 0
    end
    
    def print_board
        @board.count.times do |i|
            @board[i].count.times do |j|
                @count += 1
                if j == 0 || j == 1
                    print "#{@board[i][j]}|"
                else
                    print @board[i][j]
                end 
                
            end 
            if i == 0 || i == 1
                puts "\n- - -"
            else
                puts ""
            end 
        end
    end 
    
    def board_full?(board)
        board.count.times do |i|
            board[i].count.times do |j|
                if board[i][j] == " "
                    return false
                end 
            end 
        end 
        return true
    end
end 