class GameResults
    def winner?(board)
        if board.moves.length >= 5
            has_winning_combos?(board)
        else 
            false
        end
    end

    def has_winning_combos?(board)
        has_winning_row?(board)
    end

    def draw?(board)
        board.full? && !has_winning_combos?(board)
    end

    private 
    def all_cells_equal?(row)
        return if row.first == nil
        
        row.each_cons(2).all? { |x,y| x == y }
    end

    def has_winning_row?(board)
        rows = split_board_state(board)
        rows.any? { |row| return true if all_cells_equal?(row)}
    end

    def split_board_state(board)
        board.moves.each_slice(3).to_a
    end
end
