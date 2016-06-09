class ArticlesController < ApplicationController

	before_action :require_user, only: [:index, :show]
	before_action :require_admin, only: [:destroy]
	
  def index
	@articles= Article.all
  end

  def edit
	@article= Article.find(params[:id])
  end
  
  def update
	@article = Article.find(params[:id])
	if @article.update(articles_params)
		redirect_to '/'
	else
		render 'edit'
	end
  end

  def show
	@article=Article.find(params[:id])
  end

  def new
	@article= Article.new
  end
  def create
	@article= Article.new(articles_params)
	if @article.save
		redirect_to '/'
	else
		render 'new'
	end
  end
  
  def destroy
	@article = Article.find(params[:id])
	@page=@article.page
	#@article.destroy
	redirect_to page_path(@page)
  end
  
  private
	def articles_params
		params.require(:article).permit(:intitule, :donnees, :archive, :page_id)
	end
end

