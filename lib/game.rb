class Game

    WIN_COMBINATIONS = [
        [0,1,2], # top row
        [3,4,5], # middle row
        [6,7,8], # bottom row
        [0,3,6], # first column
        [1,4,7], # second column
        [2,5,8], # third column
        [0,4,8], # down right diagonal
        [2,4,6]  # down left diagonal
    ]

    attr_accessor :board, :player_1, :player_2

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
       self.board = board
       self.player_1 = player_1
       self.player_2 = player_2
    end

    def current_player
        self.board.turn_count.even? ? self.player_1 : self.player_2
    end

    def won? 
        winning_combo = WIN_COMBINATIONS.detect do |combo|
            self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[0]] == self.board.cells[combo[2]] && self.board.taken?(combo[0]+1)
        end
        winning_combo == nil ? false : winning_combo
    end

    def draw?
        self.board.full? && self.won? == false ? true : false
    end

    def over?
        self.draw? ||  self.won? != false ? true : false
    end

    def winner
        self.board.cells[self.won?[0]] if self.won? != false
    end

    def turn
       
        input = self.current_player.move(self.board)
        if self.board.valid_move?(input)
            self.board.update(input, self.current_player)
        else
            self.turn 
        end
    end  

    def play

         until self.over? do
             self.turn
         end
       
        if self.won?
            puts "Congratulations #{self.winner}!"
        else
            puts "Cat's Game!"
        end
    
    end

end

