class RemoveRoleFromUserSubjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_subjects, :role_id, :bigint
  end
end
