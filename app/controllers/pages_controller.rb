class PagesController < ApplicationController

	before_action :require_user, only: [:index, :show]
	before_action :require_admin, only: [:destroy]
	
  def index
	@pages=Page.all
  end

  def edit
	@page=Page.find(params[:id])
  end
  
  def update
	@page = Page.find(params[:id])
	if @actualites.update(acces_params)
		redirect_to '/'
	else
		render 'edit'
	end
  end

  def show
	@page=Page.find(params[:id])
	@articles = @page.articles
  end

  def new
	@page= new Page
  end
  def create
	@page= new Page(pages_params)
	if @page.save
		redirect_to '/pages'
	else
		render 'new'
	end
  end
  
  def destroy
	Page.destroy(params[:id])
	redirect_to pages_path
  end
  
  private
	def pages_params
		params.require(:pages).permit(:libelle, :url, :couleur)
	end
end
