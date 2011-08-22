# encoding: utf-8
class Restaurante < ActiveRecord::Base
  has_many :comentarios, :order => 'created_at desc'
  belongs_to :user
  
  validates_presence_of :nome, :endereco, :message => "não pode ser vazio"
  
  HUMAN_ATTRIBUTES = {
    :endereco => "Endereço"
  }
  
  def self.human_attribute_name(attribute, options = {})
    HUMAN_ATTRIBUTES[attribute.to_sym] || super
  end
  
  def nota_media
    return 0 if self.comentarios.empty?
    self.comentarios.inject(0.0) { |sum, comentario| sum + comentario.nota } / @comentarios.size
  end
end
