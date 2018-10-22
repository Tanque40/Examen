class AddDefaultValueToActiveExam < ActiveRecord::Migration[5.2]
  def change
      change_column :exams, :activo, :boolean, default: true
  end
end
