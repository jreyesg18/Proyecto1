class CreateParametros < ActiveRecord::Migration[5.2]
  def change
    create_table :parametros do |t|
      t.string :genero
      t.string :grado_de_tumor
      t.string :pleura
      t.string :tipo_histologico
      t.string :edad
      t.string :abdominal
      t.string :mama
      t.string :madiastino
      t.string :cerebro
      t.string :hueso
      t.string :peritoneum
      t.string :piel
      t.string :nombre_completo
      t.string :resultado
      t.string :email

      t.timestamps
    end
  end
end
