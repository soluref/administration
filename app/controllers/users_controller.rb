class UsersController < ApplicationController
   
	def new
		@titrePage="Nouvel Utilisateur"
		@user=User.new
		
	end
  
	def create
		@user = User.new(user_params)		
		
		if @user.save
			session[:user_id]=@user.id
			logger.warn "New user: #{@user.nom}"			
			redirect_to '/'
		else
			redirect_to '/'
		end
		
	end
	# permet d'édition d'un user
	def edit
		@user = User.find(session[:user_id])
	end	

	# pour la mise à jour du user
	def update
		@user = User.find(params[:id])
	 
	  if @user.update(user_params)
		# on renvoie sur la page HOME
		redirect_to '/'
	  else
		render 'edit'
	  end
	end

	# Permet de liste tous les users
	def index
		@users = User.all
	end	
	
	# affiche un user
	def show
		@user = User.find(params[:id])
	end
	
	# Supprimer un user
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		# redirige sur la liste des utilisateurs
		redirect_to users_path
	end	
		
	# Privé : définition des variables 
	private
	  # user_params : pour la récupération des paramètres du formulaire 
	  def user_params
		params.require(:user).permit(:nom, :email, :email_confirmation, :password)
	  end
end
