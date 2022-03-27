module DbSeeds
	class Players < Base
		class << self
	    def execute!
	    	with_logging do
		    	ActiveRecord::Base.transaction do
		  			players.each do |player|
		    			Player.create!(
		    				first_name: player[:first_name],
		    				last_name:  player[:last_name], 
		    				win_count:  player[:win_count]
		    			)
		  			end  
					end
			  end
			end

	    private

			def players
				[
					{
						first_name: 'Player',
						last_name:  'One',
						win_count:  0
					},
					{
						first_name: 'Player',
						last_name:  'Two',
						win_count:  0
					}
				]
			end
		end
	end
end
