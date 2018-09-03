class AddGruporelToAlumno < ActiveRecord::Migration[5.2]
  def change
    add_reference :alumnos, :grupo, foreign_key: true
  end
end
