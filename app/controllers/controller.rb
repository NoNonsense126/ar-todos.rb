class Controller
	def self.list
  	Task.all.each_with_index do |task, index|
  		completed = if task.complete
  			"[X]"
  		else
  			"[ ]"
  		end
  		puts "#{completed} #{index + 1}. #{task.text}"
  	end
  end

  def self.add(task_desc)
  	Task.create(text: task_desc, complete: false)
  	puts "Appended \"#{task_desc}\" to your TODO list..."
  end

  def self.delete(task_desc)
  	task_index = task_desc.to_i - 1
  	raise ArgumentError unless task_index >= 0 && task_index < Task.count
	  	task = Task.limit(1).offset(task_index).first
	  	puts "Deleted \"#{task.text}\" from your TODO list..."
	  	task.destroy
	  rescue ArgumentError
	  	puts "Number not on to do list"
  end

  def self.complete(task_desc)
  	task_index = task_desc.to_i - 1
  	raise ArgumentError unless task_index >= 0 && task_index < Task.count
	  	task = Task.limit(1).offset(task_index).first
	  	puts "Completed \"#{task.text}\" on your TODO list..."
	  	task.complete!
	  rescue ArgumentError
	  	puts "Number not on to do list"
  end

  def self.list_outstanding
  	Task.where(complete: false).each_with_index do |task, index|
  		puts "[ ] #{index + 1}. #{task.text}"
  	end
  end

  def self.list_completed
  	Task.where(complete: true).each_with_index do |task, index|
  		puts "[X] #{index + 1}. #{task.text}"
  	end
  end
end