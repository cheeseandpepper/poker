module DbSeeds
	class Base
		class << self
	    def with_logging(&block)
	    	start_time    = Time.now
	    	seed_class    = self.ancestors.first.to_s.demodulize
	    	start_message = "\n\nStarting seed for #{seed_class}"
	    	
	    	#both because I have multiple terminal tabs open
	    	Rails.logger.warn(start_message)
	    	puts start_message
	    	
	    	yield

	    	end_time    = Time.now
	    	total_time  = end_time.to_f - start_time.to_f
	    	end_message = "\n\nFinished seed for #{seed_class} -- took #{total_time} seconds"

	    	Rails.logger.warn(end_message)
	    	puts end_message
	    end
	  end
	end
end
