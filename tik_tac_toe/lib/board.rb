class Board
    attr_accessor :board, :count
    
    def initialize
        @board = [["0", "1", "#"], ["0", "1", "#"], ["0", "1", "#"]]
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
end 