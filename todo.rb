require_relative 'config/application'
require_relative 'app/controllers/controller'

class Commands
	def self.start
    command = ARGV
    task = command[0]
    task_desc = command[(1..-1)].join(" ")
    case 
    when task == "add"
      Controller.add(task_desc)
    when task == "list"
      Controller.list
	  when task == "delete"
      Controller.delete(task_desc)
    when task == "list:outstanding"
      Controller.list_outstanding
    when task == "list:completed"
      Controller.list_completed
    when task == "complete"
      Controller.complete(task_desc)
    else
      puts "Invalid command"
    end
  end  
end

Commands.start
