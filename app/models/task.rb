require_relative '../../config/application'

class Task < ActiveRecord::Base
	def complete!
		self.complete = true
		self.completion_time = Time.now
		save!
	end

end
