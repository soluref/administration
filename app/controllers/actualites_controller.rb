class ActualitesController < ApplicationController

	before_action :require_user, only: [:index, :show]
	before_action :require_admin, only: [:destroy]

	
  def index
	@actualites=Actualite.all
  end

  def edit
	@actualite=Actualite.find(params[:id])
  end
  
  def update
	@actualite = Actualite.find(params[:id])
	if @actualite.update(actualites_params)
		redirect_to '/actualites'
	else
		render 'edit'
	end
  end

  def show
	@actualite=Actualite.find(params[:id])
  end

  def new
	@index= new Actualite
  end
  def create
	@actualite= new Actualite(actualites_params)
	if @actualite.save
		redirect_to '/'
	else
		render 'new'
	end
  end
  
  def destroy
	@actualite = Actualite.find(params[:id])
	@actualite.destroy
	redirect_to actualites_path
  end
  
  private
	def actualites_params
		params.require(:actualite).permit(:libelle, :informations, :archive, :image, :resume, :pdf, :url)
	end
end
