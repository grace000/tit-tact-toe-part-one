class GameResults
    def winner?(board)
        if board.moves.length >= 5
            has_winning_combos?(board)
        else 
            false
        end
    end

    def has_winning_combos?(board)
        has_winning_row?(board) || has_winning_column?(board) || has_winning_diagonal?(board)
    end

    def draw?(board)
        board.full? && !has_winning_combos?(board)
    end

    private 
    def all_cells_equal?(row)
        return false if row.include?(nil)

        row.each_cons(2).all? { |x,y| x == y }
    end

    def has_winning_row?(board)
        rows = split_board_state(board)
        rows.any? { |row| return true if all_cells_equal?(row)}
    end

    def has_winning_column?(board)
        columns = split_board_state(board)
        columns.transpose.any? { |column| return true if all_cells_equal?(column)}
    end

    def split_board_state(board)
        board.moves.each_slice(3).to_a
    end
end
