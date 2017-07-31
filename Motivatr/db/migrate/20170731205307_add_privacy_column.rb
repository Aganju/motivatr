class AddPrivacyColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :goals, :private, :string
  end
end
