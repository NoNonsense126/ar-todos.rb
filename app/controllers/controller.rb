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
  end

  def self.delete(task_desc)
  	task_index = task_desc.to_i - 1
  	raise ArgumentError unless task_index >= 0 && task_index < Task.count
	  	task = Task.limit(1).offset(task_index).first
	  	message =  "Deleted \"#{task.text}\" from your TODO list..."
	  	task.destroy
	  	return message
	  rescue ArgumentError
	  	return "Number not on to do list"
  end

  def self.complete(task_desc)
  	task_index = task_desc.to_i - 1
  	raise ArgumentError unless task_index >= 0 && task_index < Task.count
	  	task = Task.limit(1).offset(task_index).first
	  	task.complete!	  	
	  	return "Completed \"#{task.text}\" on your TODO list..."
	  rescue ArgumentError
	  	return "Number not on to do list"
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