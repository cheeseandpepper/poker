module DbSeeds
  class GameData < Base
    class << self
      def execute!
        with_logging do
          file = File.read('/app/public/poker_input.txt')

          insertable_hand_data = parse_file(file)

          Hand.insert_all(insertable_hand_data)
        end
      end

      private
      
      def parse_file(file)
        hand_data = []
        
        file.each_line do |line|
          #assign 5 card arrays to each player
          p1, p2 = line.split(' ').each_slice(5).to_a
          
          hand_evaluator = Ingestors::HandEvaluator.new(p1, p2)

          hand_evaluator.find_winner!
          
          game = Game.create(
            winner_id:       hand_evaluator.winner_id,
            winning_hand_id: hand_evaluator.winning_hand_id
          )

          hand_evaluator.hands.each do |hand|
            hand_data << hand.merge(game_id: game.id)
          end
        end

        hand_data
      end
    end
  end
end
