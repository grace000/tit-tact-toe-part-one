require 'setup'
require 'command_line_input'

describe Setup do
    before(:each) do
        @setup = Setup.new 
    end

    describe "#assign_computer_token" do
        it "assigns letter X as token when human token is not X" do
            
            human_token = "P"
            human_name = "Human"
            human_player = Player.new(token:human_token, name:human_name)
            @setup.players << human_player
            @setup.assign_computer_token(human_token)
            
            expect(@setup.players[1].token).to eq("X")
        end

        it "does not assign letter X as token when human token is X" do
            
            human_token = "X"
            human_name = "Human"
            human_player = Player.new(token:human_token, name:human_name)
            @setup.players << human_player
            @setup.assign_computer_token(human_token)
            
            expect(@setup.players[1].token).not_to eq("X")
        end
    end
end