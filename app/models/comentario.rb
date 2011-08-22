class Comentario < ActiveRecord::Base
  belongs_to :restaurante
  belongs_to :user
  
  validates_presence_of :texto
end
