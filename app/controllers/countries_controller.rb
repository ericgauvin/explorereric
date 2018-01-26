class CountriesController < ApplicationController
	def show
		render template: "countries/#{params[:country]}"
	end
end
