class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.references :materia, foreign_key: true
      t.references :parcial, foreign_key: true
      t.references :turno, foreign_key: true
      t.references :semestre, foreign_key: true
      t.date :fecha
      t.boolean :activo

      t.timestamps
    end
  end
end
