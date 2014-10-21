require_relative '../../config/application'

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :text
      t.boolean :complete
      t.date :completion_time
      t.timestamps
    end
  end
end

