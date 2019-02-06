class Player 
    attr_accessor :token, :name, :player
    def initialize(args)
        @token = args[:token]
        @name = args[:name]
        @player = args[:player]
    end

    def selected_coordinate
        player.select_coordinate
    end
end