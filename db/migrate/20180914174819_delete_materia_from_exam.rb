class DeleteMateriaFromExam < ActiveRecord::Migration[5.2]
  def change
      remove_column :exams, :materia
  end
end
