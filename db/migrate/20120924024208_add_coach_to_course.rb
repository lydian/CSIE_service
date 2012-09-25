class AddCoachToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :coach, :string
  end
end
