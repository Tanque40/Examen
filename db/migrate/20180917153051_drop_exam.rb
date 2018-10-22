class DropExam < ActiveRecord::Migration[5.2]
  def change
      drop_table :exams
  end
end
