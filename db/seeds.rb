require_relative "../app/models/task"
require 'faker'

class Seed
	def self.run
		10.times do
			new_task = Task.new
			new_task.text = Faker::Lorem.sentence
			new_task.complete = false
			new_task.save
		end
	end
end