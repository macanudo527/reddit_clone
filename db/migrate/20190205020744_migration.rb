class Migration < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :links, :users
  end
end
