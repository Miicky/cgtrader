# frozen_string_literal: true

class CreatePrompts < ActiveRecord::Migration[7.1]
  def change
    create_table :prompts do |t|
      t.text :text
      t.integer :row_idx

      t.timestamps
    end
  end
end
