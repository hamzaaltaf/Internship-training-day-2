class AddClassNameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :class_name, :string
  end
end
