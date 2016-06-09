class NewsletterinscritsController < ApplicationController

before_action :require_user, only: [:index, :show]
before_action :require_admin, only: [:destroy]
	
  def index
  end

  def edit
  end

  def show
  end

  def new
  end
end
