class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name, limit: 20

      t.timestamps
    end
  end
end
