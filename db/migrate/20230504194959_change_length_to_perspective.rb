class ChangeLengthToPerspective < ActiveRecord::Migration[7.0]
  def change
    rename_column :tweets, :length, :perspective
  end
end
