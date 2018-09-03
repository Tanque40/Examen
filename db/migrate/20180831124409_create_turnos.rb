class CreateTurnos < ActiveRecord::Migration[5.2]
  def change
    create_table :turnos do |t|
      t.string :nomTurn

      t.timestamps
    end
  end
end
