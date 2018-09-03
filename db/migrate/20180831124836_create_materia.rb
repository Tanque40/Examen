class CreateMateria < ActiveRecord::Migration[5.2]
  def change
    create_table :materia do |t|
      t.string :materia
      t.references :semestre, foreign_key: true

      t.timestamps
    end
  end
end
