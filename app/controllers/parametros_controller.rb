class ParametrosController < ApplicationController
  before_action :set_parametro, only: %i[show edit update destroy]

  def index
    @parametros = Parametro.all
  end

  def show
  end

  def new
    @parametro = Parametro.new
  end

  def edit
  end

  def create
    @parametro = Parametro.new(parametro_params)
    if @parametro.save
      redirect_to @parametro, notice: 'Parámetro creado exitosamente.'
    else
      render :new
    end
  end

  def update
    if @parametro.update(parametro_params)
      redirect_to @parametro, notice: 'Parámetro actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @parametro.destroy
    redirect_to parametros_url, notice: 'Parámetro eliminado exitosamente.'
  end

  private

  def set_parametro
    @parametro = Parametro.find(params[:id])
  end

  def parametro_params
    params.require(:parametro).permit(:genero, :grado_de_tumor, :pleura, :tipo_histologico, :edad, :abdominal, :mama, :madiastino, :cerebro, :hueso, :peritoneum, :piel)
  end
end
