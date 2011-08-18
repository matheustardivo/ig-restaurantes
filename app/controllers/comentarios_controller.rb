class ComentariosController < ApplicationController
  
  def create
    @restaurante = Restaurante.find(params[:restaurante_id])
    @comentario = Comentario.new(params[:comentario])
    @comentario.restaurante = @restaurante
    
    #@comentario = @restaurante.comentarios.create(params[:comentario])
    
    if @comentario.save
      redirect_to restaurante_path(@restaurante)
    else
      render "restaurantes/show"
    end
  end
  
  def destroy
    @restaurante = Restaurante.find(params[:restaurante_id])
    @comentario = @restaurante.comentarios.find(params[:id])
    @comentario.destroy
    redirect_to restaurante_path(@restaurante)
  end
  
end
