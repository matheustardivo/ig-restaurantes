class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.string :nome
      t.text :texto
      t.integer :nota
      t.references :restaurante

      t.timestamps
    end
  end

  def self.down
    drop_table :comentarios
  end
end
