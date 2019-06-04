class RemoveGrupoFromAlumno < ActiveRecord::Migration[5.2]
  def change
    remove_column :alumnos, :grupo, :integer
  end
end
