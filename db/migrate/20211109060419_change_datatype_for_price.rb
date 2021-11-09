class ChangeDatatypeForPrice < ActiveRecord::Migration[6.1]
  def change
    change_column(:courses, :price, :integer) 
  end
end
