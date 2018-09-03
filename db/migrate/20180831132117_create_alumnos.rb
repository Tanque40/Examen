class CreateAlumnos < ActiveRecord::Migration[5.2]
  def change
    create_table :alumnos do |t|
      t.integer :matricula
      t.string :nombre
      t.string :apellidoP
      t.string :apellidoM
      t.integer :grupo
      t.references :semestre, foreign_key: true
      t.references :turno, foreign_key: true

      t.timestamps
    end
  end
end
