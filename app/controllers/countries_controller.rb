class CountriesController < ApplicationController
	def show
		render template: "/countries/countries"
	end
end
