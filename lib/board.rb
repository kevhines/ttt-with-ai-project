
class Board


    attr_accessor :cells

    def initialize
        self.reset!
    end


    def reset!
        self.cells = Array.new(9, " ")
    end

    def display
        line = "-----------"
        row = ""
        counter = 1
        self.cells.each do |square|
            row << " #{square} "        
            if counter.remainder(3) == 0
                puts row
                puts line
                row = ""
            else
                row << "|"
            end
            counter +=1
        end    
    end

    def position(index)
        self.cells[input_to_index(index)]
    end

    def input_to_index(input)
        input.to_i - 1        
    end

    def taken?(index)
        self.position(index) == " " ? false : true 
    end

    def valid_move?(index)
        input_to_index(index).between?(0,8) && !self.taken?(index) ?  true : false
    end

    def turn_count
        self.cells.select{|square| square != " " }.size
    end

    def update(index, player)
        self.cells[input_to_index(index)] = player.token
    end

    def full?
        self.turn_count == 9 ? true : false
    end

 end