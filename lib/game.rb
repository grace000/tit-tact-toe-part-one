require_relative './board_presenter'
require_relative './command_line_input'
require_relative './input_validator'
require_relative './prompt'
require_relative './board'
require_relative './game_results'


class Game
    attr_accessor :board 
    def initialize
        @presenter = BoardPresenter.new
    end

    def select_coordinate
        puts Prompt::MAKE_COORDINATE_SELECTION
        CommandLineInput.new.get_input.to_i
    end

    def take_turn(board, position, token)
        input_validator = InputValidator.new
        if input_validator.valid_coordinate?(board.moves, position)
            board.move(token, position)
        else
            user_coordinate = select_coordinate
            take_turn(board, user_coordinate, token)
        end
    end

    def report_winner(winner)
        puts winner
    end

    def play(players, board)
        players.each { |player|
            puts "HELLO PLAYER #{player.token}"
            puts @presenter.display_board(board.moves)
            
            user_coordinate = select_coordinate
            take_turn(board, user_coordinate, player.token)
            game_results = GameResults.new
            return report_winner(player.token) if game_results.winner?(board.moves)
        }
        play(players, board)
    end

    
end