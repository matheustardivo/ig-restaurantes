class Comentario < ActiveRecord::Base
  belongs_to :restaurante
  
  validates_presence_of :texto
end
