# frozen_string_literal: true

class CreateWidgets < ActiveRecord::Migration[6.1]
  def change
    create_table :widgets do |t|
      t.string :name, :type
      t.text :description
      t.belongs_to :board

      t.timestamps
    end
  end
end
