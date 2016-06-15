class SessionsController < ApplicationController
  
	before_action :require_user, only: [:index, :show]
	before_action :require_admin, only: [:destroy]

	# initialisation de l'objet d'authentification pour le login
	def new
		@titrePage = "S'identifier"
	end


	# Tentative d'initialisation de la session...
	def create
		# récupération du user si il existe
		@user = User.find_by_email(params[:session][:email])
		# s'il existe : on vérifie la conformité du mot de passe
		if @user && @user.authenticate(params[:session][:password])
			# on stocke le userId en session
			cookies[:remember_token] = { :value   => @user.id,
										 :expires => 20.years.from_now.utc }			
			# On redirige vers la page d'accueil
			redirect_to '/'
		else
			flash.now[:error] = "Combinaison Email/Mot de passe invalide."
			@titre = "S'identifier"
			render 'new'		
		end 
	end

	# Suppression de la session
	def destroy 
		sign_out
		redirect_to root_path
	end

	def authenticated?(password)
		self.hashed_password == encrypt(password)
	end
end
