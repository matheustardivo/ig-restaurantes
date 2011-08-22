class AddUserToRestaurantes < ActiveRecord::Migration
  def self.up
    add_column :restaurantes, :user_id, :integer
  end

  def self.down
    remove_column :restaurantes, :user_id
  end
end
