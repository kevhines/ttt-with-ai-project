

module Players
    class Human < Player
        def move(board)
            puts "Choose a Space:"
            index = gets.chomp
        end
    
   end
end