# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :location
      t.string :task_type
      t.datetime :scheduled_to

      t.timestamps
    end
  end
end
