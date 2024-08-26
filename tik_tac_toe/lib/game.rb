class Game
    attr_accessor :board, :player_one, :player_two
    
    # need to add turn taking functionality, takes player as arg
    # add a function that places symbol in correct square
    # get row and column as inputs from user
    # need to add a :won function to determine if game is over
    # check across won, down won, or diagonal won
    # I think won would be a while loop that would break on a win, and print a message, asking for another game or quit
    
    def initialize(board, player_one, player_two)
        @board = board
        @player_one = player_one
        @player_two = player_two
        @current_player = @player_one
    end 
    
    def make_a_move
        puts "The current symbol playing is: #{@current_player.symbol}"
        puts "Enter the row: "
        row = gets.chomp.to_i - 1
        puts "Enter the column: "
        column = gets.chomp.to_i - 1
        puts "You entered row #{row} and column #{column}"
        @board.board[row][column] = @current_player.symbol
        @board.print_board
        #switch players at the end of a turn
        # dont switch if game is won
        if game_won
            puts "#{@current_player.symbol} Won!"
        else
            @current_player == @player_one ? @current_player = @player_two : @current_player = @player_one
        end
    end 
    
    def start_game
        while(!game_won) do
            make_a_move    
        end 
    end 
    
    def game_won
        if check_across(@board, @current_player)
            return true
        end 
        if check_down(@board, @current_player)
            return true
        end 
        return false
    end 
        
    
    def print_board
        @board.print_board
    end 
    
    private
    
    # check to see if any acrossed win 
    def check_across(board, player)
        @board.board.count.times do |i|
            if @board.board[i].all? { |el| el == player.symbol }
                return true
            end 
        end 
        return false
    end 
    
    def check_down(board, player)
        pos = 0
        @board.board.count.times do |i|
            
            @board.board[i].count.times do |j|
                p @board.board[i][pos]
                # check each in the column, if it doesn't match, return false
                if @board.board[i][pos] != player.symbol
                    return false
                end
            end 
            # all matched, so return true
            return true
            pos += 1
        end
        return false
    end 
        
end
        