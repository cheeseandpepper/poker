require 'csv'

module DbSeeds
	class HandReferences < Base
		class << self
	    def execute!
	    	with_logging do
		    	ActiveRecord::Base.transaction do
		  			CSV.foreach("/app/public/poker_hands.csv").with_index(1) do |row, i|
		  			  #row is [7, 7, 7, 6, 6, FH]
		  			  
		  			  short_name = row.pop

		  			  HandReference.create(
								name:          name_from_short_name(short_name),        
								short_name:    short_name,
								rank:          i,
								identifier:    identifier_from_row(row),
								requires_suit: requires_suit?(short_name)
		  			  )
		  			end
					end
			  end
			end

	    private

	    def identifier_from_row(row)
        # source data was a little dirty 
        row.join.gsub(' ', '')
	    end

	    def name_from_short_name(short_name)
	    	{
	    		'RF' => 'Royal Flush',
	    		'SF' => 'Straight Flush',
	    		'4K' => 'Four of a Kind',
	    		'FH' => 'Full House',
	    		'F'  => 'Flush',
	    		'S'  => 'Straight',
	    		'3K' => 'Three of a Kind',
	    		'2P' => 'Two Pair',
	    		'1P' => 'One Pair',
	    		'HC' => 'High Card'
	    	}[short_name]
	    end

	    def requires_suit?(short_name)
        case short_name
        when 'RF', 'SF', 'F'
        	true
        else
        	false
        end
	    end
		end
	end
end
