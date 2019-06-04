class CreateParcials < ActiveRecord::Migration[5.2]
  def change
    create_table :parcials do |t|
      t.string :noParcial

      t.timestamps
    end
  end
end
