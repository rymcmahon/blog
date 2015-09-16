class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to new_article_path
  	else
  		flash.now[:danger] = 'Email and/or password are incorrect'
  		render 'new'
  	end
  end

  def destroy
  	redirect_to articles_path
  end
end
