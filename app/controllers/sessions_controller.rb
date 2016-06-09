class SessionsController < ApplicationController
  
	before_action :require_user, only: [:index, :show]
	before_action :require_admin, only: [:destroy]

	# initialisation de l'objet d'authentification pour le login
	def new
	end


	# Tentative d'initialisation de la session...
	def create
	  # récupération du user si il existe
	  @user = User.find_by_email(params[:session][:email])
	  # s'il existe : on vérifie la conformité du mot de passe
	  if @user && @user.authenticate(params[:session][:password])
		# on stocke le userId en session
		session[:user_id] = @user.id
		# On redirige vers la page d'accueil
		redirect_to '/'
	  else
		# le user n'est pas trouvé ou le mot de passe n'est pas le bon : on revient sur le login
		redirect_to '/login',  error: "invalide password"
	  end 
	end

	# Suppression de la session
	def destroy 
		cookies.delete(:user_id)
		session.clear
		@current_user = nil
		# retour à la page d'accueil
		redirect_to '/' 
	end

	def authenticated?(password)
		self.hashed_password == encrypt(password)
	end
end
