class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 20
      t.string :last_name, limit: 20

      t.timestamps
    end
  end
end
