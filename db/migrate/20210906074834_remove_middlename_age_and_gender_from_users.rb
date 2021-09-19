class RemoveMiddlenameAgeAndGenderFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :middle_name, :string
    remove_column :users, :age, :integer
    remove_column :users, :gender, :string
  end
end
