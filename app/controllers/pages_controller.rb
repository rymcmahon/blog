class PagesController < ApplicationController
	def show
		render "pages/#{params[:id]}"
	end

	def home

	end
end
