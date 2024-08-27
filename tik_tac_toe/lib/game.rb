class Game
    attr_accessor :board, :player_one, :player_two
    
    
    def initialize(board, player_one, player_two)
        @board = board
        @player_one = player_one
        @player_two = player_two
        @current_player = @player_one
    end 
    
    # make a move, gets column and row separately, and checks for valid input and available square
    def make_a_move
        puts "The current symbol playing is: #{@current_player.symbol}"
        puts "Enter the row: "
        # row = gets.chomp.to_i - 1
        row = get_move
        puts "Enter the column: "
        column = get_move
        while !valid_square(@board.board, row, column)
            puts "That square is taken"
            puts "Enter the row"
            row = get_move
            puts "Enter a column"
            column = get_move
        end
        puts "You entered row #{row + 1} and column #{column + 1}"
        @board.board[row][column] = @current_player.symbol
        @board.print_board
        #switch players at the end of a turn
        # dont switch if game is won
        if game_won
            puts "#{@current_player.symbol} Won!"
        elsif @board.board_full?(@board.board)
            puts "Cat's game!"
        else
            @current_player == @player_one ? @current_player = @player_two : @current_player = @player_one
        end
    end 
    
    # while loop until game_won returns true
    def start_game
        # use all to avoid or operator short circuit
        while([@board.board_full?(@board.board), game_won].all? { |i| i == false }) do
            make_a_move    
        end 
    end 
    
    # checks 3 winning scenarios
    def game_won
        if check_across(@board, @current_player)
            return true
        end 
        if check_down(@board, @current_player)
            return true
        end 
        if check_diagonal(@board.board, @current_player)
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
    
    # checks for down winner
    def check_down(board, player)
        pos = 0
        @board.board.count.times do |i|
            got_all_3 = 0
            
            @board.board[i].count.times do |j|
                # check each in the column, if it doesn't match, return false
                if @board.board[j][pos] == player.symbol
                    got_all_3 += 1
                end
            end 
            # all matched, so return true
            if got_all_3 == 3
                return true
            else
                pos += 1
            end 
        end
        return false
    end 
    
    def check_diagonal(board, player)
        if (board[0][0] == player.symbol && board[1][1] == player.symbol && board[2][2] == player.symbol) || (board[0][2] == player.symbol && board[1][1] == player.symbol && board[2][0] == player.symbol)
            return true
        end 
        return false
    end 
    
    # valid move gets an int between 0 and 2
    def valid_move(move)
        if move && move >= 0 && move <= 2
            return true
        end 
        return false
    end 
    
    # get move returns an int once it meets the requirements of valid_move
    def get_move
        move = gets.chomp.to_i - 1
        while !valid_move(move) do
            puts "Please enter a valid number, 1, 2, or 3"
            move = gets.chomp.to_i - 1
        end
        return move
    end
    
    def valid_square(board, row, column)
        if board[row][column] == " "
            return true
        end 
        return false
    end 
    
        
end
        