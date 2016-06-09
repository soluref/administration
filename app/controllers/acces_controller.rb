class AccesController < ApplicationController

	before_action :require_user, only: [:index, :show]
	before_action :require_admin, only: [:destroy]

  def index
	@access=Acce.all
  end

  def edit
	@acces=Acce.find(params[:id])
  end
  
  def update
	@acces = Acce.find(params[:id])
	if @acces.update(acces_params)
		redirect_to '/'
	else
		render 'edit'
	end
  end

  def show
	@acces=Acce.find(params[:id])
  end

  def new
	@index= new Acce
  end
  def create
	@acces= new Acce(acces_params)
	if @acces.save
		redirect_to '/'
	else
		render 'new'
	end
  end
  
  def destroy
	@acces = Acce.find(params[:id])
	@acces.destroy
	redirect_to acces_path
  end
  
  private
	def acces_params
		params.require(:acces).permit(:libelle, :url)
	end
end
