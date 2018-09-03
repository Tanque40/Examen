class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :examen, foreign_key: true
      t.text :pregunta
      t.text :respuestaC
      t.text :respuesta1
      t.text :respuesta2
      t.text :respuesta3

      t.timestamps
    end
  end
end
