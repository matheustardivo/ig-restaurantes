# encoding: utf-8
class ComentariosController < ApplicationController
  before_filter :authenticate_user!
  before_filter :pode_manter?, :only => :destroy
  
  def create
    @restaurante = Restaurante.find(params[:restaurante_id])
    @comentario = Comentario.new(params[:comentario])
    @comentario.restaurante = @restaurante
    @comentario.user = current_user
    
    #@comentario = @restaurante.comentarios.create(params[:comentario])
    
    if @comentario.save
      redirect_to restaurante_path(@restaurante), :notice => "Comentário criado com sucesso."
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
  
  def meus_comentarios
    @comentarios = Comentario.order("created_at").find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comentarios }
    end
  end
  
  private
    def pode_manter?
      unless current_user.pode_manter?(Comentario.find(params[:id]))
        redirect_to root_url, :alert => "Você não pode editar esse comentário."
      end
    end
  
end
