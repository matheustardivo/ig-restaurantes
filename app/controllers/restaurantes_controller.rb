class RestaurantesController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :pode_manter?, :only => [:edit, :update, :destroy]

  def index
    @restaurantes = Restaurante.all(:order => "nome")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @restaurantes }
    end
  end
  
  def meus_restaurantes
    @restaurantes = Restaurante.order("nome").find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @restaurantes }
    end
  end
  
  def show
    @restaurante = Restaurante.find(params[:id])
    @comentario = Comentario.new
    @comentario.restaurante = @restaurante
    
    if user_signed_in?
      @comentario.nome = current_user[:name]
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @restaurante }
    end
  end

  def new
    @restaurante = Restaurante.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @restaurante }
    end
  end

  def edit
    @restaurante = Restaurante.find(params[:id])
  end

  def create
    @restaurante = Restaurante.new(params[:restaurante])
    @restaurante.user = current_user

    respond_to do |format|
      if @restaurante.save
        format.html { redirect_to(@restaurante, :notice => 'Restaurante criado com sucesso.') }
        format.xml  { render :xml => @restaurante, :status => :created, :location => @restaurante }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @restaurante.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @restaurante = Restaurante.find(params[:id])

    respond_to do |format|
      if @restaurante.update_attributes(params[:restaurante])
        format.html { redirect_to(@restaurante, :notice => 'Restaurante editado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @restaurante.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy

    respond_to do |format|
      format.html { redirect_to(restaurantes_url, :notice => 'Restaurante removido com sucesso.') }
      format.xml  { head :ok }
    end
  end
  
  private
    def pode_manter?
      unless current_user.pode_manter?(Restaurante.find(params[:id]))
        redirect_to root_url, :alert => "Você não pode editar esse restaurante."
      end
    end
end
