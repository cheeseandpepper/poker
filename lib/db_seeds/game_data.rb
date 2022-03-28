module DbSeeds
  class GameData < Base
    class << self
      def execute!
        with_logging do
          hand_data = []  
          parse_file(hand_data)
          
          ActiveRecord::Base.transaction do
            Hand.insert_all(hand_data)
          end
        end
      end

      private
      
      def add_hand_data(divider, hand_data)
        divider.split

        hand_eval = Ingestors::HandWinner.new(divider)
        hand_eval.find_winner
        game = Game.create(
          winner_id:       hand_eval.winner_id,
          winning_hand_id: hand_eval.winning_hand_id
        )
        
        hand_eval.hands.each do |hand|
          hand_data << hand.merge(game_id: game.id)
        end
      end
      
      def parse_file(hand_data)
        f = File.read('/app/public/poker_input.txt')

        while f.length > 0 do
          card_count   = 1   # 10 cards make a game
          game_hands   = ''  # 20 char hand string
          divider      = nil
          
          while card_count <= 10
            #take first 3 chars, remove them in place, strip whitespace
            current_card = f.slice!(0, 3).strip
            
            game_hands << current_card
            
            divider = Ingestors::HandDivider.new(game_hands) if card_count == 10
            
            if divider.present?
              add_hand_data(divider, hand_data)
            end
            
            #continues inner loop
            #once it becomes 11, start outer loop again
            card_count += 1 
          end
        end
      end
    end
  end
end
