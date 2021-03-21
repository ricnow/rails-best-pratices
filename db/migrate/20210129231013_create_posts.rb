# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :avatar_name
      t.string :username
      t.string :title
      t.text :body
      t.integer :status, default: 0
      t.integer :likes
      t.float :relevance, default: 0
      t.timestamps
      t.belongs_to :widget
    end
  end
end
